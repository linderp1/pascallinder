#include <SPI.h>

#include <Client.h>
#include <Ethernet.h>
#include <Server.h>
#include <Udp.h>

#include <Ethernet.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; // Arduino's MAC address
byte ip[] = { 192, 168, 0, 99 }; // Arduino's IP Address
byte server[] = { 80, 12, 242, 86 }; // Mail server address  (smtp.orange.fr)

Client client(server, 25);  // smtp server ip/port

void setup()
{
Ethernet.begin(mac, ip);
Serial.begin(9600);

delay(1000);

Serial.println("connecting...");

if (client.connect()) {
  delay(1000);
  Serial.println("connected");
  client.println("EHLO MYSERVER");
//  client.println("AUTH PLAIN ************************************");  // replace the **'s with your auth info from the perl script.
  client.println("MAIL FROM:<linder.pascal@orange.fr>");
  client.println("RCPT TO:<linder.pascal@orange.fr>");
  client.println("DATA");
  client.println("From: <linder.pascal@orange.fr>");
  client.println("TO: <linder.pascal@orange.fr>");
  client.println("SUBJECT: Arduino email test (through orange SMTP)");
  client.println();
  client.println("This is the body.");
  client.println("This is another line of the body.");
  client.println(".");
//  client.println(".");
} else {
  Serial.println("connection failed");
}
}

void loop()
{
if (client.available()) {
  char c = client.read();
  Serial.print(c);
}

if (!client.connected()) {
  Serial.println();
  Serial.println("disconnecting.");
  client.stop();
  for(;;)
    ;
}
}
