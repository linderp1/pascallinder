/*
  This program makes uses of an Arduino to display
  values for Xively IoT data provider.
  Main goal is to show the current value of water in the garden
  => "Level" data feed on Xively
  => see also: https://api.xively.com/v2/feeds/1464880832/datastreams/Level.json

  It all began with testing the proper functionning of the Arduino with an LCD display
  This code uses thr LiquidCrystal library provided with the Arduino IDE that demonstrates
  the use of a 16x2 LCD display.  The LiquidCrystal library works with all LCD displays that 
  are compatible with the Hitachi HD44780 driver. There are many of them out there, and you
  can usually tell them by the 16-pin interface.

  I used a 16*2 display from Anag Vision, the AV1624
  For more details, see: 
  http://www.iq-tm.de/astro/EQ6/184594-da-01-ml-LCD_Modul_16x2_Zeichen_LED_de_en.pdf
  or
  http://www.mikrocontroller.net/attachment/61375/lcd_av1624.pdf

  Below is the description of the LCD circuit:
  The circuit:
 * LCD RS pin () to digital pin 11
 * LCD Enable pin () to digital pin 12
 * LCD D4 pin () to digital pin 7
 * LCD D5 () pin to digital pin 8
 * LCD D6 () pin to digital pin 9
 * LCD D7 pin () to digital pin 10
 * LCD R/W pin () to ground
 * LCD VSS pin () to ground
 * LCD VCC pin () to 5V
 * 10K resistor:
 *  ends to +5V and ground
 *  wiper to LCD VO pin (pin 3)
 */

// include the library code:
#include <LiquidCrystal.h>

#include <SPI.h>
#include <Ethernet.h>
#include <EthernetUdp.h>

// initialize the LCD with the numbers of the interface pins
LiquidCrystal lcd(11, 12, 7, 8, 9, 10);

// Set the tick-tock (i.e. the separator between the hours and minutes)
boolean TickTock = false;


// Enter a MAC address for your controller below.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED
};

unsigned int localPort = 8888;       // local port to listen for UDP packets

char timeServer[] = "time.nist.gov"; // time.nist.gov NTP server

const int NTP_PACKET_SIZE = 48; // NTP time stamp is in the first 48 bytes of the message

byte packetBuffer[ NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets

// A UDP instance to let us send and receive packets over UDP
EthernetUDP Udp;


void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);

  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // start Ethernet and UDP
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    for (;;)
      ;
  }
  Udp.begin(localPort);
}

void loop() {
  String sHour, sMinutes, sSeconds;
  sendNTPpacket(timeServer); // send an NTP packet to a time server

  // wait to see if a reply is available
  delay(1000);
  if (Udp.parsePacket()) {
    // We've received a packet, read the data from it
    Udp.read(packetBuffer, NTP_PACKET_SIZE); // read the packet into the buffer

    // the timestamp starts at byte 40 of the received packet and is four bytes,
    // or two words, long. First, extract the two words:

    unsigned long highWord = word(packetBuffer[40], packetBuffer[41]);
    unsigned long lowWord = word(packetBuffer[42], packetBuffer[43]);
    // combine the four bytes (two words) into a long integer
    // this is NTP time (seconds since Jan 1 1900):
    unsigned long secsSince1900 = highWord << 16 | lowWord;
    Serial.print("Seconds since Jan 1 1900 = ");
    Serial.println(secsSince1900);

    // now convert NTP time into everyday time:
    Serial.print("Unix time = ");
    // Unix time starts on Jan 1 1970. In seconds, that's 2208988800:
    const unsigned long seventyYears = 2208988800UL;
    // subtract seventy years:
    unsigned long epoch = secsSince1900 - seventyYears;
    // print Unix time:
    Serial.println(epoch);

    // print the hour, minute and second:
    Serial.print("The UTC time is ");       // UTC is the time at Greenwich Meridian (GMT)
    Serial.print((epoch  % 86400L) / 3600); // print the hour (86400 equals secs per day)
    sHour=String((epoch  % 86400L) / 3600);
    Serial.print(':');
    if (((epoch % 3600) / 60) < 10) {
      // In the first 10 minutes of each hour, we'll want a leading '0'
      Serial.print('0');
      sMinutes="0";
    }
    Serial.print((epoch  % 3600) / 60); // print the minute (3600 equals secs per minute)
    sMinutes=sMinutes+((epoch  % 3600) / 60);
    Serial.print(':');
    if ((epoch % 60) < 10) {
      // In the first 10 seconds of each minute, we'll want a leading '0'
      Serial.print('0');
      sSeconds="0";
    }
    Serial.println(epoch % 60); // print the second
    sSeconds=sSeconds+(epoch % 60);
  }
  // wait ten seconds before asking for the time again
  delay(10000);
  Ethernet.maintain();
  // end of ethernet example code
  
  // begin PaL code
  // Print the timestamp to the LCD.
  lcd.setCursor(0, 0);

  lcd.print(sHour + ":" + sMinutes + ":" + sSeconds);
  //lcd.print("24/04/2016 16:10");
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(millis() / 1000);
  delay(1000);
}

// send an NTP request to the time server at the given address
void sendNTPpacket(char* address) {
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
  Udp.write(packetBuffer, NTP_PACKET_SIZE);
  Udp.endPacket();
}

