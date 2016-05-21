#include <SPI.h>


#include <CountingStream.h>
#include <Xively.h>
#include <XivelyClient.h>
#include <XivelyDatastream.h>
#include <XivelyFeed.h>



#include <b64.h>
#include <HttpClient.h>

#include <SoftwareSerial.h>
#include <Xively.h>
#include "WiFly.h"
#include <WiFlyClient.h>

//WiFi shield definitions
#define SSID      "Livebox-6A60"
#define KEY       "5008apt19"
#define AUTH      WIFLY_AUTH_WPA2_PSK     // or WIFLY_AUTH_WPA1, WIFLY_AUTH_WEP, WIFLY_AUTH_OPEN
int keyIndex = 0;            // your network key Index number (needed only for WEP)

// Your Xively key to let you upload data
#define APIKEY         "DStyplPvQgFpXYUeYGoJ5X_RfLSSAKxmRmxXMzV0UTU5ND0g"
#define FEEDID         1464880832  //12155 // replace your feed ID
#define USERAGENT      "WaterLevel" // user agent is the project name

//SoftwareSerial uart(2, 3);
//WiFly wifly(&uart);

// Define the strings for our datastream IDs
char levelId[] = "Level";
XivelyDatastream datastreams[] = {
  XivelyDatastream(levelId, strlen(levelId), DATASTREAM_FLOAT),
};
// Finally, wrap the datastreams into a feed
XivelyFeed feed(FEEDID, datastreams, 1 /* number of datastreams */);

WiFlyClient wiFlyClient;

XivelyClient xivelyclient(wiFlyClient);


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  // wait for initilization of wifly
  delay(3000);

/*  uart.begin(9600);     // WiFly UART Baud Rate: 9600
  
  wifly.reset();
  Serial.println("Join " SSID );
  if (wifly.join(SSID, KEY, AUTH)) {
    Serial.println("OK");
  } else {
    Serial.println("Failed");
  }
 */
  Serial.println("Starting single datastream load from Xively...");
  Serial.println();
  // attempt to connect to Wifi network:
  Serial.println("Join " SSID );
  while(!wiFlyClient.join(SSID, KEY, AUTH)) {
    Serial.println("connect network error! try again ...");
    delay(5000);
  }
  Serial.println("Network OK!");

}

void loop() {
  //int sensorValue = analogRead(sensorPin);
  //int sensorValue = 130;
  //datastreams[0].setFloat(sensorValue);

  //Serial.print("Read sensor value ");
  //Serial.println(datastreams[0].getFloat());

  //wiFlyClient.begin();
  
  Serial.println("Loading data....");
  int ret = xivelyclient.get(feed, APIKEY);
  if (ret > 0)
  {
    Serial.println("Datastream is...");
    Serial.println(feed[0]);
    Serial.print("xivelyclient.put returned ");
    Serial.println(ret);

    Serial.print("Current level is: ");
    float float_value = feed[0].getFloat();
    Serial.println(float_value);
  }
    
  

  Serial.println();
  delay(2000);
  Serial.println("loop");
}

