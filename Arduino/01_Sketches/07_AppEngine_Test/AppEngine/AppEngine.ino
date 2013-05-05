
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

// push button pins
int emailPin = 2;
int textPin = 3;

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte myIP[] = { 192, 168, 1, 99 };
byte gateway[] = { 192, 168, 1, 1 };

//server name
char server[] = "http://www.regardpompage.appspot.com";
//char server[] = "http://localhost:8080/";

EthernetClient client;

void setup() {
  // start serial port:
  delay(1000);
  Serial.begin(9600);
  // start the Ethernet connection:
  Ethernet.begin(mac, myIP, gateway);
  // give the ethernet module time to boot up:
  delay(1000);
  
  pinMode(emailPin, INPUT);
  pinMode(textPin, INPUT);
  
  Serial.println("Setup complete");
}

void loop() {
  
  int email = digitalRead(emailPin);
  if (email == HIGH) {
      sendAlert("email");
  }
  int text = digitalRead(textPin);
  if (text == HIGH) {
      sendAlert("text");
  }
  
  delay(200);
  
  // for testing purpose only (PaL)
  sendAlert("email");
  Serial.println("> Mail sent");
    
  delay(1000);

  sendAlert("text");
  Serial.println("> Text sent");
}


void sendAlert(String type) {
  Serial.println("Sending " + type + " alert.");
  String response = GAE("http://www.regardpompage.appspot.com/alerts?Type=" + type + "&Criticality=bad&Value=9");
  //String response = GAE("http://localhost:8080/alerts?Type=" + type);
  Serial.println(response);
  Serial.println("Ready");
}  
  
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
  if (client.connect(server, 80)) {
    client.println("GET " + link + " HTTP/1.0");
    client.println();
  } else {
    // You couldn't make the connection
    Serial.println("Connection Failed");
    Serial.println("Disconnecting.");
    client.stop();
    }
}
