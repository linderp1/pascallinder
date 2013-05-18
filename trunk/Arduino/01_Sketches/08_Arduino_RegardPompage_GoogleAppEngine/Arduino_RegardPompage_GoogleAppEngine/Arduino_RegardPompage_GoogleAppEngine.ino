//
// Arduino "Regard de pompage" project
// -----------------------------------
//
// The intent of this code is to be informed about critical water levels
// in the water tank (regard the pompage) on the back of the house.
// 
// History:
// The first verion of this project was created in 2009 with an initial
// version of the Arduino code implementing only the ultrasonic sensor PING)))
// and the required formula to determine the percentage of tank "fillness".
// Special thanks to Marco for helping developing the formula in Excel  :-)
//
// A next release on which I settled almost 2 years later with an interface to
// Xively (formerly called Pachube and then Cosm) followed by a version that
// was also tweeting the measured value :-)
//
// Next serious round of development was started in May 2013 with the discovery
// of a nice tutorial about using the Arduino together with the Google App Engine.
// It is possible to configure an email and a SMS address to which the measured
// value has to be send if some critical value is reached (threshold)
// see http://regardpompage.appspot.com
// Xively interface was also kept as it shows a nice overview of the value over time
// see https://xively.com/feeds/12155
// remark: Xively can handle multiple triggers to tweet or send a SMS when a given
// value is reached. No specific Tweeter code is therefore required anymore
//
// This code is the official 1st version used in real (v1.0)
// It is stored in googlecode :-)
// https://linder.pascal%40gmail.com@pascallinder.googlecode.com/svn/trunk

/* Original Pachube code comment
  Pachube sensor client
 
 This sketch connects an analog sensor to Pachube (http://www.pachube.com)
 using a Wiznet Ethernet shield. You can use the Arduino Ethernet shield, or
 the Adafruit Ethernet shield, either one will work, as long as it's got
 a Wiznet Ethernet module on board.
 
 This example has been updated to use version 2.0 of the Pachube.com API. 
 To make it work, create a feed with a datastream, and give it the ID
 sensor1. Or change the code below to match your feed.
 
 
 Circuit:
 * Analog sensor attached to analog in 0
 * Ethernet shield attached to pins 10, 11, 12, 13
 
 created 15 March 2010
 updated 16 Mar 2012
 by Tom Igoe with input from Usman Haque and Joe Saavedra
 
http://arduino.cc/en/Tutorial/PachubeClient
 This code is in the public domain.
 
 */

#include <SPI.h>
//#include <Client.h>
#include <Ethernet.h>
#include <HttpClient.h>
#include <Xively.h>

#define APIKEY         "DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g"
//"641a9f8761f08b2185a03e8408d0b2a8fc42cffa6f2d642f3f5f7c54eac9f182" // replace your pachube api key here
#define FEEDID         1464880832  //12155 // replace your feed ID
#define USERAGENT      "WaterLevel" // user agent is the project name

// assign a MAC address for the ethernet controller.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
// fill in your address here:
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte myIP[] = { 192, 168, 1, 99 };
byte gateway[] = { 192, 168, 1, 1 };

// Pachube (Cosm) and Google App engine client
EthernetClient client;

// Initialize the Cosm library
// Define the string for our datastream ID
char sensorId[] = "Level";

XivelyDatastream datastreams[] = {
  XivelyDatastream(sensorId, strlen(sensorId), DATASTREAM_FLOAT),
};

// Wrap the datastream into a feed
XivelyFeed feed(FEEDID, datastreams, 1);
XivelyClient xivelyclient(client);

// Pachube/Cosm/Xively server's address
// Not required anymore, server names are packed in the library directly
//const char* serverPachube = "www.pachube.com";
//const char serverPachube[] = "www.pachube.com";
//Google App Engine (GAE) application address
const char* serverGAE = "http://regardpompage.appspot.com";

unsigned long lastConnectionTime = 0;          // last time you connected to the server, in milliseconds
const unsigned long connectionInterval = 15000;      // delay between connecting to Xively in milliseconds
// those 2 normally not needed anymore .... to eb checked..
boolean lastConnected = false;                 // state of the connection last time through the main loop
const unsigned long postingInterval = 100;   //delay between updates to Xively


// Variables used for the PING))) sensor
long lLevelMin = 200; // 190cm = low water level (nivean bas = cuve vide) // ** TO BE ADAPTED TO THE TANK PARAMETERS **
long lLevelMax = 100; // 100cm = high level (niveau haut = cuve pleine, max autorisé) // ** TO BE ADAPTED TO THE TANK PARAMETER **
// Variables used for calculating the %age of tank fillness
long lLevelFor100PercFillness;
long lLevelFor1PercFillness = lLevelFor100PercFillness/100 ;

// establish variables for duration of the ping, 
// and the distance result in inches and centimeters:
long duration, inches, cm;
// variable for storing the percentage of tank fillness
int iFillness;
// this constant won't change.  It's the pin number of the sensor's output:
const int pingPin = 7;

// variable used for counting purpose
// This is the frequency of measurements of the ultrasonic sensor
int loopTime = 10000; // equal 10 seconds = 10000 mseconds
// This is the frequency of email sending. Only every 15 minutes if an alert keeps active. 
// Reason: Google App Engine (free version) allows only 1000 emails per 24 hours (i.e. 96 mails per day are fine)
long emailSendingMinPeriod = 900000; // in miliseconds. There are 900 seconds in 15 mninutes (15*60)
// In fact, with all loops and wait times within the whole code, this is rather 20 minutes instead of 15 => still OK :-)
long counter = emailSendingMinPeriod + 1; // counter used to determine if an alert email can be send

void setup() {
  // start serial port:
  delay(1000);
  // TO RE-ACTIVATE FOR DEBUGGING !!!!
  Serial.begin(9600);
  // start the Ethernet connection:
 // start the Ethernet connection:
  Ethernet.begin(mac, myIP, gateway);
  // give the ethernet module time to boot up:
  delay(1000);  
  //Serial.println("Setup complete");
}


void loop() {  
  // if there's incoming data from the net connection.
  // send it out the serial port.  This is for debugging
  // purposes only:
  if (client.available()) {
    char c = client.read();
    //Serial.print(c);
  }

  // if there's no net connection, but there was one last time
  // through the loop, then stop the client:
  if (!client.connected() && lastConnected) {
    //Serial.println();
    //Serial.println("disconnecting.");
    client.stop();
  }
  
   //
   // PING))) part
   // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
   // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
   //
   pinMode(pingPin, OUTPUT);
   digitalWrite(pingPin, LOW);
   delayMicroseconds(2);
   digitalWrite(pingPin, HIGH);
   delayMicroseconds(5);
   digitalWrite(pingPin, LOW);
   // The same pin is used to read the signal from the PING))): a HIGH
   // pulse whose duration is the time (in microseconds) from the sending
   // of the ping to the reception of its echo off of an object.
   pinMode(pingPin, INPUT);
   duration = pulseIn(pingPin, HIGH);
   // convert the time into a distance
   inches = microsecondsToInches(duration);
   cm = microsecondsToCentimeters(duration); 
   iFillness = (cm - lLevelMin) / (lLevelFor1PercFillness-1 );
   delay(100);
   //if(!client.connected() && (millis() - lastConnectionTime > postingInterval)) {
    
   //Serial.println();
   //Serial.print(inches);
   //Serial.print("in, ");
   //Serial.print(cm);
   //Serial.print("cm, ");
   //Serial.print//Serial.print(" => cuve remplie a ");
   //Serial.print(iFillness);
   //Serial.print("%");
   //Serial.println();
   //Serial.println(" >>> Begin sending information to Pachube <<<");
   
   // Send the measured tank value to Xivelky (formerly called Pachube and then Cosm)
   sendData2Xively(cm);
   lastConnected = client.connected();

   //
   // Google App Engine (GAE) part
   // note: lLevelMax needs to be adapted in the declaration section (at the beginning of the code)
   // if the water level gets equal or below a certain level (i.e. the distance measured by the ultrasound sensor gets shorter)
   // then an alert must be send
   if (cm <= lLevelMax) {
      if  (counter > emailSendingMinPeriod) {
          sendAlert("email", "bad", cm);
          //Serial.println("> Mail sent");
          delay(1000);
          // commented "Text" messaging for the time being .... 
          //sendAlert("text", "bad", cm);
          //Serial.println("> Text sent");
          counter = 0;          
      } else {
        counter = counter + loopTime;
      }
   }
   
   
   // wait 10 seconds until next round
   //Serial.println(" ");
   //Serial.println("wait 10 seconds until next round....zZzZzZ");
   //Serial.println(" ");
   delay(loopTime);
   //Serial.println("end wait time");
}
// end loop

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//Required functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Google App Engine (GAE) part
//
// function to prepare the call to the GAE (works for both email and text messages)
void sendAlert(String type, String criticality, int value) {
  //Serial.println("Google App Eengine - Sending " + criticality + " " + type + " alert with value: " + value);
  String link = String (serverGAE) + "/alerts?Type=" + type + "&Criticality=" + criticality + "&Value=" + value;
  String response = GAE(link);
  //Serial.println("GAE - " + link);
  //String response = GAE("http://localhost:8080/alerts?Type=" + type);
  //Serial.println("GAE - Response: " + response);
  //Serial.println("GAE - finished");
}  

// function to send / read the http request
String GAE(String link) {
  httpRequest(link);
  delay(10000);
  String readString = ""; // Reset string
  while (client.available() > 0) {
    char s = client.read();
    //Serial.print(s);    // Complete response w/ header. For dev mode  
    if (s == '\n') {
      char c = client.read();
      //Serial.print(c);  // Parsed response. For dev mode
      if (c == '\r') {
        while (client.connected()) {
          char z = client.read();
          readString += z;
        }
      }
    }
  }
  client.stop();
  return(readString);
}
  
// this method makes an HTTP connection to the server
void httpRequest(String link) {
 // if there is a successful connection
  if (client.connect(serverGAE, 80)) {
    client.println("GET " + link + " HTTP/1.0");
    //Serial.println("HTTP Request" + link);
    client.println();
  } else {
    // You couldn't make the connection
    //Serial.println("Connection Failed");
    //Serial.println("Disconnecting.");
    client.stop();
    }
}


// send the supplied value to Xively, printing some debug information as we go
void sendData2Xively(int sensorValue) {
  datastreams[0].setFloat(sensorValue);

  //Serial.print("Read sensor value ");
  //Serial.println(datastreams[0].getFloat());

  //Serial.println("Uploading to Xively");
  int ret = xivelyclient.put(feed, APIKEY);
  //Serial.print("PUT return code: ");
  //Serial.println(ret);

  //Serial.println();
}

// This method calculates the number of digits in the
// sensor reading.  Since each digit of the ASCII decimal
// representation is a byte, the number of digits equals
// the number of bytes:

int getLength(int someValue) {
  // there's at least one byte:
  int digits = 1;
  // continually divide the value by ten, 
  // adding one to the digit count for each
  // time you divide, until you're at 0:
  int dividend = someValue /10;
  while (dividend > 0) {
    dividend = dividend /10;
    digits++;
  }
  // return the number of digits:
  return digits;
}

long microsecondsToInches(long microseconds)
{
  // According to Parallax's datasheet for the PING))), there are
  // 73.746 microseconds per inch (i.e. sound travels at 1130 feet per
  // second).  This gives the distance travelled by the ping, outbound
  // and return, so we divide by 2 to get the distance of the obstacle.
  // See: http://www.parallax.com/dl/docs/prod/acc/28015-PING-v1.3.pdf
  return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds)
{
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}

