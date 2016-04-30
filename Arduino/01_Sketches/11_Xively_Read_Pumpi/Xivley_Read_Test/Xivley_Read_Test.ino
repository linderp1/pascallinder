// Ethernet library
#include <Dhcp.h>
#include <Dns.h>
#include <Ethernet.h>
#include <EthernetClient.h>
#include <EthernetServer.h>
#include <EthernetUdp.h>

// HTTP libraries
#include <b64.h>
#include <HttpClient.h>

// Xively libraries
#include <CountingStream.h>
#include <Xively.h>
#include <XivelyClient.h>
#include <XivelyDatastream.h>
#include <XivelyFeed.h>


#include <SPI.h>

#define APIKEY         "DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g"
#define FEEDID         1464880832  //12155 // replace your feed ID
#define USERAGENT      "WaterLevel" // user agent is the project name

// MAC address for your Ethernet shield
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xEE };
// fill in an available IP address on your network here,
// for manual configuration:
IPAddress ip(192, 168, 1, 100);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0);
IPAddress myDns(192, 168, 1, 1);

// Your Xively key to let you upload data
char xivelyKey[] = APIKEY;

// Define the string for our datastream ID
char levelId[] = "Level";

XivelyDatastream datastreams[] = {
  XivelyDatastream(levelId, strlen(levelId), DATASTREAM_FLOAT),
};
// Finally, wrap the datastreams into a feed
XivelyFeed feed(FEEDID, datastreams, 1 /* number of datastreams */);

EthernetClient client;
XivelyClient xivelyclient(client);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  Serial.println("Reading from Xively example");
  Serial.println("---------------------------");

  // start the Ethernet connection:
  Ethernet.begin(mac, ip, myDns, gateway, subnet);
  // give the ethernet module time to boot up:
  delay(1000);  
  Serial.println("Ethernet setup complete");
}

void loop() {
  Serial.println("Entering loop");
  int ret = xivelyclient.get(feed, APIKEY);
  Serial.print("xivelyclient.get returned ");
  Serial.println(ret);

  if (ret > 0)
  {
    Serial.println("Datastream is...");
    Serial.println(feed[0]);

    Serial.print("Temperature is: ");
    Serial.println(feed[0].getFloat());
  }

  Serial.println();
  delay(15000UL);
}
