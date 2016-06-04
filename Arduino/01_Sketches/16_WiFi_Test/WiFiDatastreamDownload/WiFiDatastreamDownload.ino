// This worked after upgrading the Wifi shield!!!!!
//Followed instructions form:  http://www.golgi.io/arduino-upgrading-the-wifi-shield-firmware/



#include <SPI.h>
#include <WiFi.h>
#include <HttpClient.h>
#include <Xively.h>

#define WIFISSID      "Livebox-6A60"
//#define WIFISSID      "linderp1's iPhone"
#define KEY       "5008apt19"

#define APIKEY         "DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g"
#define FEEDID         1464880832

//char ssid[] = "Livebox-6A60"; //  your network SSID (name) 
//char pass[] = "5008apt19";    // your network password (use for WPA, or use as key for WEP)
int keyIndex = 0;            // your network key Index number (needed only for WEP)


int status = WL_IDLE_STATUS;

// Your Xively key to let you upload data
//char xivelyKey[] = "DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g";

// Define the string for our datastream ID
char LevelId[] = "Level";

XivelyDatastream datastreams[] = {
  XivelyDatastream(LevelId, strlen(LevelId), DATASTREAM_FLOAT),
};
// Finally, wrap the datastreams into a feed
XivelyFeed feed(FEEDID, datastreams, 1 /* number of datastreams */);

WiFiClient client;
XivelyClient xivelyclient(client);

void printWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  Serial.println("Reading from Xively example");
  Serial.println();

  // attempt to connect to Wifi network:
  while ( status != WL_CONNECTED) { 
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(WIFISSID);
    Serial.println("Allow 10 seconds for connection......");
    status = WiFi.begin(WIFISSID, KEY);
    // wait 10 seconds for connection:
    delay(10000);
  } 
  Serial.println("Connected to wifi!!");
  printWifiStatus();
}

void loop() {
  Serial.println();
  Serial.println("Now contacting Xively......");
  int ret = xivelyclient.get(feed, APIKEY);
  Serial.print("xivelyclient.get returned ");
  Serial.println(ret);

  if (ret > 0)
  {
    Serial.println("Datastream is...");
    Serial.println(feed[0]);

    Serial.print("Level is: ");
    Serial.println(feed[0].getFloat());
  }

  Serial.println();
  Serial.println("15 seconds pause.....");
  delay(15000UL);
}
