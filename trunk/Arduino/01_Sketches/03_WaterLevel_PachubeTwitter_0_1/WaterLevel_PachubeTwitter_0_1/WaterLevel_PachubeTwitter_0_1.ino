/*
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
#include <Client.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <Server.h>
#include <Udp.h>
#include <EEPROM.h>
#include <string.h>
#include <Twitter.h>
#include <Time.h>


#define APIKEY         "641a9f8761f08b2185a03e8408d0b2a8fc42cffa6f2d642f3f5f7c54eac9f182" // replace your pachube api key here
#define FEEDID         "12155" // replace your feed ID
#define USERAGENT      "WaterLevel" // user agent is the project name

// assign a MAC address for the ethernet controller.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
// fill in your address here:
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };

// fill in an available IP address on your network here,
// for manual configuration:
IPAddress ip(192,168,1,99);
//IPAddress dns(192,168,1,1);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);
//byte gateway[] = { 192, 168, 0, 1 };			// neccessary to get access to the internet via your router
//byte subnet[] = { 255, 255, 255, 0 };
// initialize the library instance:
EthernetClient client;

// if you don't want to use DNS (and reduce your sketch size)
// use the numeric IP instead of the name for the server:
//IPAddress server(216,52,233,122);      // numeric IP for api.pachube.com
const char* server = "www.pachube.com";
//char server[] = "api.pachube.com";   // name address for pachube API

unsigned long lastConnectionTime = 0;          // last time you connected to the server, in milliseconds
boolean lastConnected = false;                 // state of the connection last time through the main loop
const unsigned long postingInterval = 100; //delay between updates to Pachube.com

// PaL adds
long lLevelMin = 200; // 190cm = nivean bas = cuve vide// ** TO BE ADAPTED **
long lLevelMax = 100; // 100cm = niveau haut = cuve pleine max autorisé// ** TO BE ADAPTED **
long lLevelFor100PercFillness;
long lLevelFor1PercFillness = lLevelFor100PercFillness/100 ;

// establish variables for duration of the ping, 
// and the distance result in inches and centimeters:
long duration, inches, cm;
// variable for storing the percentage of tank fillness
int iFillness;
// the following 2 lines are probably not required
int ledPin = 4;  // LED indicator OUTPUT
int heat=5;      // Output to heating device
// this constant won't change.  It's the pin number
// of the sensor's output:
const int pingPin = 7;

// Twitter part
boolean firstround = true;
Twitter twitter("307212692-ULvAlU966WcF4jcv9Y7S5iNVg8FYa9CSx6U7CUGI");
char msg[] = "Hello, World! I'm Pascal's Arduino pachubing & tweeting!";
//UDP/NTP part
unsigned int localPort = 8888;      // local port to listen for UDP packets
IPAddress timeServer(199,167,198,163); // pool.ntp.org NTP server
const int NTP_PACKET_SIZE= 48; // NTP time stamp is in the first 48 bytes of the message
byte packetBuffer[ NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets 
// A UDP instance to let us send and receive packets over UDP
EthernetUDP Udp;
int timeZoneHour = +1; // Enter Your Actual Time Zone EDT (-4)
long timeZoneOffset = (timeZoneHour * -1) * 60 * 60 ;
int NTP_Update_Interval = 60; // Number of secs before resync - should be longer just testing really
int intHour;
int intMinutes;


void setup() {
  // start serial port:
  delay(1000);
  Serial.begin(9600);
  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    for(;;)
      ;
  }
  // give the ethernet module time to boot up:
  delay(1000);
  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // Configure manually:
    Ethernet.begin(mac, ip, dns, gateway, subnet);
  }
  // UDP
  Udp.begin(localPort);
  Serial.print("Got IP:");
  Serial.println(Ethernet.localIP());
  setSyncProvider(getNTPTime);
  Serial.println("Looking for a time");
  while(timeStatus()== timeNotSet)   
     ;
  Serial.println("Got a Time");
  setSyncInterval(NTP_Update_Interval);
}

void loop() {  
  // if there's incoming data from the net connection.
  // send it out the serial port.  This is for debugging
  // purposes only:
  if (client.available()) {
    char c = client.read();
    Serial.print(c);
  }

  // if there's no net connection, but there was one last time
  // through the loop, then stop the client:
  if (!client.connected() && lastConnected) {
    Serial.println();
    Serial.println("disconnecting.");
    client.stop();
  }
  
   // PaL adds  
   // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
   // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
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
   
   // get current time
   time_t t = now();
   intHour = hour(t);
   intMinutes = minute(t);
   
  // Send information to Twitter if level change since last round
  // first reound then send to Twitter
  if (firstround)
  {
    Serial.print("connecting to Twitter ... Time: ");
    Serial.print(intHour);
    Serial.print(":");
    Serial.println(intMinutes);
    if (twitter.post(msg)) 
    {
      int status = twitter.wait();
      if (status == 200) 
      {
        Serial.println("Twitter post OK.");
      } 
      else 
      {
        Serial.print("Twitter post failed : code ");
        Serial.println(status);
      }
    } 
    else 
    {
      Serial.println("Twitter connection failed.");
    }
      
  }
  
  
  // not first round then send only if level changed or warning
  
  
   
  // Send information to pachube
  // if you're not connected, and ten seconds have passed since
  // your last connection, then connect again and send data:
  // This is the part that performs the sending to Pachube
  if(!client.connected() && (millis() - lastConnectionTime > postingInterval)) {
    
   Serial.println();
   Serial.print(inches);
   Serial.print("in, ");
   Serial.print(cm);
   Serial.print("cm, ");
   Serial.print(" => cuve remplie a ");
   Serial.print(iFillness);
   Serial.print("%");
    Serial.println();
    Serial.println(" >>>      <<<");
    Serial.println(" >>> Sent information to Pachube <<<");
    Serial.println(" >>>      <<<");
    //Serial.println();
    sendData(cm);
  }
  // store the state of the connection for next time through
  // the loop:
  lastConnected = client.connected();
  //
  Serial.println(" ");
  Serial.println("wait a minute until next round....zZzZzZ");
  Serial.println(" ");
  // wait a minute until next round
  delay(60000);
}
// end loop

// this method makes a HTTP connection to the server:
void sendData(int thisData) {
  // if there's a successful connection:
  if (client.connect(server, 80)) {
    Serial.println("connecting...");
    // send the HTTP PUT request:
    client.print("PUT /v2/feeds/");
    client.print(FEEDID);
    client.println(".csv HTTP/1.1");
    client.println("Host: api.pachube.com");
    client.print("X-PachubeApiKey: ");
    client.println(APIKEY);
    client.print("User-Agent: ");
    client.println(USERAGENT);
    client.print("Content-Length: ");

    // calculate the length of the sensor reading in bytes:
    // 8 bytes for "sensor1," + number of digits of the data:
    int thisLength = 8 + getLength(thisData);
    client.println(thisLength);

    // last pieces of the HTTP PUT request:
    client.println("Content-Type: text/csv");
    client.println("Connection: close");
    client.println();

    // here's the actual content of the PUT request:
    client.print("Level,");
    client.println(thisData);
  
  } 
  else {
    // if you couldn't make a connection:
    Serial.println("connection failed");
    Serial.println();
    Serial.println("disconnecting.");
    client.stop();
  }
   // note the time that the connection was made or attempted:
  lastConnectionTime = millis();
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


// PaL adds

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

// UDP/NTP functions
void printDigits(int digits){
  if(digits < 10)
    Serial.print('0');
  Serial.print(digits);
}

unsigned long getNTPTime()
{
  Serial.println("In getNTPTime");
  sendNTPpacket(timeServer);
  delay(1000); 
  if ( Udp.parsePacket() ) {  
    Serial.println("Got Time Packet");
    Udp.read(packetBuffer,NTP_PACKET_SIZE);
 
    unsigned long highWord = word(packetBuffer[40], packetBuffer[41]);
    unsigned long lowWord = word(packetBuffer[42], packetBuffer[43]);  
    unsigned long secsSince1900 = highWord << 16 | lowWord;  

    const unsigned long seventyYears = 2208988800UL + timeZoneOffset;      
    unsigned long epoch = secsSince1900 - seventyYears;  
  
    return epoch;    
  }
  Serial.println("No Time Packet Found");
  return 0;
}
// send an NTP request to the time server at the given address 
unsigned long sendNTPpacket(IPAddress& address)
{
  // set all bytes in the buffer to 0
  memset(packetBuffer, 0, NTP_PACKET_SIZE); 
  // Initialize values needed to form NTP request
  // (see URL above for details on the packets)
  packetBuffer[0] = 0b11100011;   // LI, Version, Mode
  packetBuffer[1] = 0;     // Stratum, or type of clock
  packetBuffer[2] = 6;     // Polling Interval
  packetBuffer[3] = 0xEC;  // Peer Clock Precision
  // 8 bytes of zero for Root Delay & Root Dispersion
  packetBuffer[12]  = 49; 
  packetBuffer[13]  = 0x4E;
  packetBuffer[14]  = 49;
  packetBuffer[15]  = 52;

  // all NTP fields have been given values, now
  // you can send a packet requesting a timestamp: 		   
  Udp.beginPacket(address, 123); //NTP requests are to port 123
  Udp.write(packetBuffer,NTP_PACKET_SIZE);
  Udp.endPacket(); 
}

