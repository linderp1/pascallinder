#include <Ethernet.h>
//#include <time.h>
#include <EEPROM.h>
#include <string.h>

//#include <DateTimeStrings.h>

/*
About Section:
This piece of software was written by Christos Mavrakis (cmavr8@gmail.com).
It uses temperature sensor LM35 and ethernet shield. Refer to LM35's documentation to find the alternative way to connect the sensor. (using two diodes and a 18Kohm resistor)
The project's target is to make a web-controllable thermostat that controls the heating equipment of a house.

You can use/copy/modify this software only if this About section remains intact.
For comments and/or suggestions please contact me at cmavr8@gmail.com.

Special thanks to Charilaos Volanis and Miltos Allamanis for their moral and technical support.
End of About Section.

Version Log:
1.0: Same as 0.6.3, FIrst stable version! (low mem!)
0.6.3: better online printing, min max changing with password LOW MEMORY
0.6.2: fixed auto mode and web i-face
0.6.1: correct bugs... LEFT: no return to Auto mode when set mode=0, no web i-face
0.6: Supports Modes: Auto, ON, OFF
0.5.1: NT tests
0.5: Better print on serial
0.4: Introducing precice temperature measurements (using two diodes and a 18Kohm resistor)
0.3: ethernet enabled

*/


#include "WProgram.h"
void setup();
void loop();
long microsecondsToInches(long microseconds);
long microsecondsToCentimeters(long microseconds);
int temp_pin=0; // temperature sensor INPUT pin
int ref_pin=1;  // temperature sernor's Voltage Level reference 
int ledPin = 4;  // LED indicator OUTPUT
int heat=5;      // Output to heating device

float min_threshold=0.0; // in meters
float max_threshold=2.00; //in meters
int heating=0; // flag: Is heating on?
boolean override=false; // Override Auto mode if web input is available
char mode='2'; // Which mode by default?

int samples[8]; // variables to make a better precision
int i;
char pass[]="CH" ;


double temp; // Holds temperature

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte ip[] = { 192, 168, 0, 99 };			    // this is the ip within my lan
byte gateway[] = { 192, 168, 0, 1 };			// neccessary to get access to the internet via your router
byte subnet[] = { 255, 255, 255, 0 };
Server server(80);

int a = 0; // EEPROM location number for storing no. of draining cycles (vidanges)
int iNumberDrainings = 0;
long lLevelMin = 190; // 190cm  // ** TO BE ADAPTED **
long lLevelMax = 125; // 100cm  // ** TO BE ADAPTED **
long lLevelFor100PercFillness;
long lLevelFor1PercFillness = lLevelFor100PercFillness/100 ;

// establish variables for duration of the ping, 
// and the distance result in inches and centimeters:
long duration, inches, cm;
// variable for storing the percentage of tank fillness
int iFillness;

// this constant won't change.  It's the pin number
// of the sensor's output:
const int pingPin = 7;

void setup(){

  Ethernet.begin(mac, ip, gateway, subnet);
  pinMode(ledPin, OUTPUT);      // Status LED output pin
  pinMode(heat, OUTPUT);    // Heating output pin
  // initialize serial communication:
  Serial.begin(9600);
}

void loop(){
  
 // Read EEPROM first of all to get no. of draining cycles
 //iNumberDrainings = EEPROM.read(a);
 
 // First get temp
//   for(i = 0;i<=7;i++){ // get 8 samples of temperature

//    samples[i] = ( 5.0 * (analogRead(temp_pin)-analogRead(ref_pin)) * 100.0) / 1024.0;
//    temp = temp + samples[i];
//    delay(300);
//    }
//  temp = temp/8.0;
//  char temperature[70]={""}; // This will hold our temperature
//  dtostrf(temp,4,1,temperature); // Copy tempc double to temperature string
//  Serial.print("Temperature is: ");
//  Serial.print(temperature);
//  Serial.print(". Mode is: ");
//  Serial.print(mode);
//  Serial.print("\n");


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
   Serial.println();
   Serial.print(inches);
   Serial.print("in, ");
   Serial.print(cm);
   Serial.print("cm, ");
//   Serial.println();
   iFillness = (cm - lLevelMin) / (lLevelFor1PercFillness-1 );
   Serial.print(" => cuve remplie a ");
   Serial.print(iFillness);
   Serial.print("%");
   delay(100);
   
   

// SERVER:
Client client = server.available();
  if (client) {
    // an http request ends with a blank line
    boolean current_line_is_blank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
       // char c2 = client.read();        

        // if we've gotten to the end of the line (received a newline
        // character) and the line is blank, the http request has ended,
        // so we can send a reply

        if(c == '&') {
          c = client.read(); 
          if  (c =='#'){
            client.println("Ok, got it! Setting mode...");
            mode=client.read();
            Serial.print("Input from web: ");
            Serial.println(mode);
            override = true; // Override Auto mode
                    
            char data[10]={""};
            for (int j=0;j<=9;j++){
              c = client.read(); 
              data[j]=c;
            }
      
            if  ((data[0] ==pass[0]) && (data[1] ==pass[1])) { //pass correct
                    
                    char tmp[4]={""}; // temp var
                    for (int j=2;j<=5;j++)  tmp[j-2]=data[j];
                    min_threshold=atof(tmp);
                    Serial.print(tmp); 
                    for (int j=6;j<=9;j++)  tmp[j-6]=data[j];   

                    
                    max_threshold=atof(tmp);
                    Serial.print(tmp);
                    client.print("Correct insertion");
                    Serial.print("Insertion from the Web");
                    Serial.println();


            }

          }
          break;
        }else{
          
        if (c == '\n' && current_line_is_blank) {
          // send a standard http response header
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println();
          client.println("<title>Indicateur de niveau d'eau</title>");
          
          // output stats to HTTP request:
          client.println("<font face='arial black' color='black' size='5'>INDICATEUR DE NIVEAU D'EAU</font><br /><br />");

          client.println("<font face='arial' color='blue'>Niveau actuel (en cm): ");
          client.print(cm);
          client.print("<br />");
//          client.print(" (");
          client.println("<font face='arial' color='blue'>Niveau actuel (en %): ");
          client.print(iFillness);
//          client.print("%)");
          //client.println("Heating is currently: ");
          //if (heating==1)   client.print("ON");
          //else  client.print("OFF");
          client.println();
          ///client.print("<br />Mode is: ");
          ///client.print(mode);
          client.print("<br />");
          //http://chart.apis.google.com/chart?chs=300x180&chf=bg,s,ffffff&cht=gom&chd=t:10&chl=10%&chco=00ff00,ffff00,ff6600,ff0000
          // min height is 200 for a maximum chart size
//          const char* cGoogleStringPart1
//          const char* cGoogleStringPart2,cGoogleStringPart3,cGoogleStringPart4;
          const char* cGoogleStringPart1 = "<IFRAME SRC=\"http://chart.apis.google.com/chart?chs=300x180&chf=bg,s,ffffff&cht=gom&chd=t:"; //
          const char* cGoogleStringPart2 = "&chl=";
          const char* cGoogleStringPart3 = "%&chco=00ff00,ffff00,ff6600,ff0000\" WIDTH=500 HEIGHT=200> If you can see this, your browser doesn\'t understand IFRAME.</IFRAME>";
          //sprintf(cGoogleStringPart1, "%d", iFillness);
          client.print(cGoogleStringPart1);
          client.print(iFillness);
          client.print(cGoogleStringPart2);
          client.print(iFillness);          
          client.print(cGoogleStringPart3);
          
          Serial.print(cGoogleStringPart1);
          Serial.print(iFillness);
          Serial.print(cGoogleStringPart2);
          Serial.print(iFillness);
          Serial.print(cGoogleStringPart3);
          Serial.println();
        
          client.print("<br />");
//        client.print("<br />");
          client.print("<br><font face='arial' color='blue'>Nombre de vidanges cuve depuis mise en route: ");
          client.print(iNumberDrainings);
          iNumberDrainings++;

          //EEPROM.write(a, iNumberDrainings);

          
//          char tmp[70]={""};
//          dtostrf(min_threshold,4,1,tmp);
//          client.print(tmp); 
//          char tmp2[70]={""};
//          dtostrf(max_threshold,4,1,tmp2);         
//          client.print(" max: ");
//          client.print(tmp2);  
//          client.print("<br />");
//          client.print("<br />");
          client.print("<br><br><font face='courier' color='black' size='1'><i>Copyright P. Linder - 2009.</i>");
          
          break;
        }
        if (c == '\n') current_line_is_blank = true; // we're starting a new line
        else if (c != '\r') current_line_is_blank = false; // we've gotten a character on the current line          
 
      }
    }
    
  } // while closing
  client.stop();
  }
  
// Now decide what to do with the heating
//if (mode=='1') heaton(); // MANUAL ON mode
//else if (mode=='2') heatoff();
//else { // Not overriding: AUTO mode
//    if (heating==1 && temp>max_threshold) heatoff();  // it's too hot   
//    else if (temp<=min_threshold) heaton();  // it's too cold
//}  
// temp = 0; //reset temperature var
//  delay(1000); 
  
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

int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

