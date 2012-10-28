#if defined(ARDUINO) && ARDUINO > 18   // Arduino 0019 or later
  #include <SPI.h>
#endif
#include <Ethernet.h>
#include <EthernetUdp.h>
//#include <EthernetDNS.h>  Only needed in Arduino 0022 or earlier
#include <Twitter.h>
#include <Time.h>
//#include <UdpBytewise.h>  // UDP library from: bjoern@cs.stanford.edu 12/30/2008

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress ip(192,168,0,99);
IPAddress gateway(192,168,0,1);
//byte ip[] = { 192,168,0,99 };
//byte gateway[] = {192,168,0,1};
//byte subnet[] = {255,255,255,0};
//byte time_dot_nist_dot_gov[] = { 192, 43, 244, 18}; // time.nist.gov
unsigned int localPort = 8888;      // local port to listen for UDP packets
IPAddress timeServer(199,167,198,163); // pool.ntp.org NTP server
Twitter twitter("307212692-ULvAlU966WcF4jcv9Y7S5iNVg8FYa9CSx6U7CUGI");
char msg[] = "Hello, World! I'm Pascal's Arduino tweeting! (2nd)";

const int NTP_PACKET_SIZE= 48; // NTP time stamp is in the first 48 bytes of the message

byte packetBuffer[ NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets 

// A UDP instance to let us send and receive packets over UDP
EthernetUDP Udp;

int timeZoneHour = +1; // Enter Your Actual Time Zone EDT (-4)

long timeZoneOffset = (timeZoneHour * -1) * 60 * 60 ;
int NTP_Update_Interval = 60; // Number of secs before resync - should be longer just testing really

void setup()
{
  delay(1000);
  Ethernet.begin(mac, ip, gateway);
  Serial.begin(9600);
  
  Udp.begin(localPort);
  Serial.print("Got IP:");
  Serial.println(Ethernet.localIP());
  setSyncProvider(getNTPTime);
  Serial.println("Looking for a time");
  while(timeStatus()== timeNotSet)   
     ;
  Serial.println("Got a Time");
  setSyncInterval(NTP_Update_Interval);
  
  Serial.println("connecting ...");
  if (twitter.post(msg)) {
    int status = twitter.wait();
    if (status == 200) {
      Serial.println("OK.");
    } else {
      Serial.print("failed : code ");
      Serial.println(status);
    }
  } else {
    Serial.println("connection failed.");
  }
}

void loop()
{
  time_t t = now();
  
  printDigits(hour(t));
  Serial.print(":");
  printDigits(minute(t));
  Serial.println();
  
  delay(10000);
}

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

