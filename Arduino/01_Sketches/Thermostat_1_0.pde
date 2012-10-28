#include <Ethernet.h>
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

int temp_pin=0; // temperature sensor INPUT pin
int ref_pin=1;  // temperature sernor's Voltage Level reference 
int ledPin = 4;  // LED indicator OUTPUT
int heat=5;      // Output to heating device

float min_threshold=20.5;
float max_threshold=21.5;
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

void setup(){

  Ethernet.begin(mac, ip, gateway, subnet);
  pinMode(ledPin, OUTPUT);      // Status LED output pin
  pinMode(heat, OUTPUT);    // Heating output pin
  Serial.begin(9600);
}

void loop(){
 // First get temp
   for(i = 0;i<=7;i++){ // get 8 samples of temperature

    samples[i] = ( 5.0 * (analogRead(temp_pin)-analogRead(ref_pin)) * 100.0) / 1024.0;
    temp = temp + samples[i];
    delay(300);
    }
  temp = temp/8.0;
  char temperature[70]={""}; // This will hold our temperature
  dtostrf(temp,4,1,temperature); // Copy tempc double to temperature string
  Serial.print("Temperature is: ");
  Serial.print(temperature);
  Serial.print(". Mode is: ");
  Serial.print(mode);
  Serial.print("\n");
 

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
          
          // output stats to HTTP request:
          client.println("<font color='red' size='5'>Chris's house live monitor</font><br /><br />");

          client.println("<font color='blue'>Current house temperature: ");
          client.print(temperature);
          client.println("<br />");
          client.println("Heating is currently: ");
          if (heating==1)   client.print("ON");
          else  client.print("OFF");
          client.println();
          client.print("<br />Mode is: ");
          client.print(mode);
          client.print("<br />");
          client.print("min: ");
          
          char tmp[70]={""};
          dtostrf(min_threshold,4,1,tmp);
          client.print(tmp); 
          char tmp2[70]={""};
          dtostrf(max_threshold,4,1,tmp2);         
          client.print(" max: ");
          client.print(tmp2);  
          
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
if (mode=='1') heaton(); // MANUAL ON mode
else if (mode=='2') heatoff();
else { // Not overriding: AUTO mode
    if (heating==1 && temp>max_threshold) heatoff();  // it's too hot   
    else if (temp<=min_threshold) heaton();  // it's too cold
}  

  temp = 0; //reset temperature var
  delay(1000); 
  
}




void heaton(){
      digitalWrite(heat,HIGH);  // heating on
      digitalWrite(ledPin,HIGH);  
      if (heating==0) Serial.print("Turning heating on \n");
      heating=1;  
}

void heatoff(){
        digitalWrite(heat,LOW); //turn heat off
      digitalWrite(ledPin,LOW);  
      if (heating==1) Serial.print("Turning heating off \n");
      heating=0;
}
