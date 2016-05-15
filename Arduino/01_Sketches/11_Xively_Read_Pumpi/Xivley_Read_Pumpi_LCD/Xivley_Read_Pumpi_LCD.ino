
/*
# Copyright Pascal Linder, May 2016
#
# This Arduino sketch fetches the current "Level" value from Xively (FEEDID: 1464880832) approx. every 20 seconds. 
# The value is displayed on a 2*16 char LCD display (ANAG VISION AV1624)
#
# LCD wiring as follows:
#   LCD RS pin to digital pin 8
#   LCD Enable pin to digital pin 9
#   LCD D4 pin to digital pin 4
#   LCD D5 pin to digital pin 5
#   LCD D6 pin to digital pin 6
#   LCD D7 pin to digital pin 7
#   LCD R/W pin to ground
#   LCD VSS pin to ground
#   LCD VCC pin to 5V
#   LCD V0 (drive) to 10K resistor wiper
# This gives the following LiquidCrytal library command => LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
# More infos on LCD wiring at: https://www.arduino.cc/en/Tutorial/HelloWorld
# AV1624 page: http://www.iq-tm.de/astro/EQ6/184594-da-01-ml-LCD_Modul_16x2_Zeichen_LED_de_en.pdf
# or: http://www.mikrocontroller.net/attachment/61375/lcd_av1624.pdf
#
# A special "progress bar" function shows the percentage of filness of the water tank 
#   105 cm is when it is almost full
#   122 cm is when it was just emptied by the pump (i.e.distance between the PING sensor and the water level
#   is at its highest
#   Used from: https://www.carnetdumaker.net/articles/faire-une-barre-de-progression-avec-arduino-et-liquidcrystal/
#
# The percentage (iFillness) is calculated with the following formula: iFillness = (float_value-lLevelMin)/(lLevelFor1PercFillness*-1) where:
#   float_value => current distance measured by the sensor
#   lLevelMin => min distance measured when the water is at its highest
#   lLevelMax => max distance measured when the water is at its lowest (pump has just emptied the tank)
#   lLevelFor1PercFillness => distance measured for 1 percent of fillness
#  
#   Remark: lLevelFor1PercFillness = lLevelFor100PercFillness/100
#           lLevelFor100PercFillness = lLevelMin-lLevelMax
#
# Ethernet (for WIZ Ethernet W5500 shield) libraries where feteched to work with sepcific Arduino IDE version used 1.6.x
#   The downloaded library (folder Ethernet) had to be placed into Arduino library folder (in the user's document folder)
#   => on the Mac: Macintosh HD/User/Pascal/Documents/Arduino/libraries/Ethernet
#   https://github.com/embeddist/WIZ_Ethernet_Library-IDE1.6.x  
#   A copy of the library was placed into the git repository (under libraries). See https://github.com/linderp1/pascallinder
#
*/

#include <LiquidCrystal.h>

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

// Define the string for our datastream ID
char levelId[] = "Level";
//String levelId("Level");
XivelyDatastream datastreams[] = {
  XivelyDatastream(levelId, strlen(levelId), DATASTREAM_FLOAT),
};
// Finally, wrap the datastreams into a feed
XivelyFeed feed(FEEDID, datastreams, 1 /* number of datastreams */);
EthernetClient client;
XivelyClient xivelyclient(client);

// Variables used for the PING))) sensor
  long lLevelMin = 122; // 122cm = low water level (nivean bas = cuve vide) // ** TO BE ADAPTED TO THE TANK PARAMETERS **
  long lLevelMax = 100; // 105cm = high level (niveau haut = cuve pleine, max autorisé) // ** TO BE ADAPTED TO THE TANK PARAMETER **
  // Variables used for calculating the %age of tank fillness
  float lLevelFor100PercFillness = lLevelMin-lLevelMax;
  float lLevelFor1PercFillness = lLevelFor100PercFillness/100;

// initialize the library with the numbers of the interface pins
// remark: pins 11 and 12 should not be used due to conflict with the Ethernet shield.
//         therefore, switched to 8 and 9.
// LCD AV1624 (ANAG VISION)
//LiquidCrystal lcd(8, 9, 2, 3, 4, 5);
// LCD Keypad Shield
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

/* Const setting the LCD screen size */
const int LCD_NB_ROWS = 2;
const int LCD_NB_COLUMNS = 16;

/* Caractères personnalisés */
byte START_DIV_0_OF_4[8] = {
  B01111,
  B11000,
  B10000,
  B10000,
  B10000,
  B10000,
  B11000,
  B01111
}; // Char début 0 / 4

byte START_DIV_1_OF_4[8] = {
  B01111,
  B11000,
  B10000,
  B10000,
  B10000,
  B10011,
  B11000,
  B01111
}; // Char début 1 / 4

byte START_DIV_2_OF_4[8] = {
  B01111,
  B11000,
  B10000,
  B10000,
  B10111,
  B10011,
  B11000,
  B01111
}; // Char début 2 / 4

byte START_DIV_3_OF_4[8] = {
  B01111,
  B11000,
  B10000,
  B10111,
  B10111,
  B10011,
  B11000,
  B01111
}; // Char début 3 / 4

byte START_DIV_4_OF_4[8] = {
  B01111,
  B11000,
  B10011,
  B10111,
  B10111,
  B10011,
  B11000,
  B01111
}; // Char début 4 / 4

byte DIV_0_OF_8[8] = {
  B11111,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B11111
}; // Char milieu 0 / 8

byte DIV_1_OF_8[8] = {
  B11111,
  B00000,
  B00000,
  B00000,
  B00000,
  B11000,
  B00000,
  B11111
}; // Char milieu 1 / 8

byte DIV_2_OF_8[8] = {
  B11111,
  B00000,
  B00000,
  B00000,
  B11000,
  B11000,
  B00000,
  B11111
}; // Char milieu 2 / 8

byte DIV_3_OF_8[8] = {
  B11111,
  B00000,
  B00000,
  B11000,
  B11000,
  B11000,
  B00000,
  B11111
}; // Char milieu 3 / 8

byte DIV_4_OF_8[8] = {
  B11111,
  B00000,
  B11000,
  B11000,
  B11000,
  B11000,
  B00000,
  B11111
}; // Char milieu 4 / 8

byte DIV_5_OF_8[8] = {
  B11111,
  B00000,
  B11000,
  B11000,
  B11000,
  B11011,
  B00000,
  B11111
}; // Char milieu 5 / 8

byte DIV_6_OF_8[8] = {
  B11111,
  B00000,
  B11000,
  B11000,
  B11011,
  B11011,
  B00000,
  B11111
}; // Char milieu 6 / 8

byte DIV_7_OF_8[8] = {
  B11111,
  B00000,
  B11000,
  B11011,
  B11011,
  B11011,
  B00000,
  B11111
}; // Char milieu 7 / 8

byte DIV_8_OF_8[8] = {
  B11111,
  B00000,
  B11011,
  B11011,
  B11011,
  B11011,
  B00000,
  B11111
}; // Char milieu 8 / 8

byte END_DIV_0_OF_4[8] = {
  B11110,
  B00011,
  B00001,
  B00001,
  B00001,
  B00001,
  B00011,
  B11110
}; // Char fin 0 / 4

byte END_DIV_1_OF_4[8] = {
  B11110,
  B00011,
  B00001,
  B00001,
  B00001,
  B11001,
  B00011,
  B11110
}; // Char fin 1 / 4

byte END_DIV_2_OF_4[8] = {
  B11110,
  B00011,
  B00001,
  B00001,
  B11101,
  B11001,
  B00011,
  B11110
}; // Char fin 2 / 4

byte END_DIV_3_OF_4[8] = {
  B11110,
  B00011,
  B00001,
  B11101,
  B11101,
  B11001,
  B00011,
  B11110
}; // Char fin 3 / 4

byte END_DIV_4_OF_4[8] = {
  B11110,
  B00011,
  B11001,
  B11101,
  B11101,
  B11001,
  B00011,
  B11110
}; // Char fin 4 / 4

/**
 * Fonction de configuration de l'écran LCD pour la barre de progression.
 * Utilise tous les caractéres personnalisés de 0 à 8.
 */
void setup_progressbar() {

  /* Enregistre les caractères personnalisés dans la mémoire de l'écran LCD */
  lcd.createChar(0, START_DIV_4_OF_4);
  lcd.createChar(1, DIV_0_OF_8);
  lcd.createChar(2, DIV_8_OF_8);
  lcd.createChar(3, END_DIV_0_OF_4);
  // Les autres caractéres sont configurés dynamiquement
}


/**
 * Fonction de configuration dynamique de l'écran LCD pour la barre de progression.
 *
 * @param bank Le numéro de la banque de caractéres à configurer.
 */
void switch_progressbar_bank(byte bank) {

  // IMPORTANT : Il est nécessaire de faire un lcd.clear() ou un lcd.setCursor() aprés chaque changement de banque.

  /* Change de banque de caractères */
  switch (bank) {
    case 0:
      lcd.createChar(4, START_DIV_0_OF_4);
      lcd.createChar(5, START_DIV_1_OF_4);
      lcd.createChar(6, START_DIV_2_OF_4);
      lcd.createChar(7, START_DIV_3_OF_4);
      break;

    case 1:
      lcd.createChar(4, DIV_1_OF_8);
      lcd.createChar(5, DIV_2_OF_8);
      lcd.createChar(6, DIV_3_OF_8);
      lcd.createChar(7, DIV_4_OF_8);
      break;

    case 2:
      lcd.createChar(4, DIV_4_OF_8);
      lcd.createChar(5, DIV_5_OF_8);
      lcd.createChar(6, DIV_6_OF_8);
      lcd.createChar(7, DIV_7_OF_8);
      break;

    case 3:
      lcd.createChar(4, END_DIV_1_OF_4);
      lcd.createChar(5, END_DIV_2_OF_4);
      lcd.createChar(6, END_DIV_3_OF_4);
      lcd.createChar(7, END_DIV_4_OF_4);
      break;
  }
}


/**
 * Fonction dessinant la barre de progression.
 *
 * @param percent Le pourcentage à afficher.
 */
void draw_progressbar(byte percent, byte line) {

  /* Déplace le curseur sur la ligne */
  lcd.setCursor(0, line);

  /* Map la plage (0 ~ 100) vers la plage (0 ~ (LCD_NB_COLUMNS - 4) * 2 * 4 - 2 * 4) */
  byte nb_columns = map(percent, 0, 100, 0, (LCD_NB_COLUMNS - 4) * 2 * 4 - 2 * 4);
  // Chaque caractére affiche 2 barres verticales de 4 pixels de haut, mais le premier et dernier caractére n'en affiche qu'une.
  
  /* Dessine chaque caractére de la ligne */
  for (byte i = 0; i < LCD_NB_COLUMNS - 4; ++i) {

    if (i == 0) { // Premiére case

      /* Affiche le char de début en fonction du nombre de colonnes */
      if (nb_columns > 4) {
        lcd.write((byte) 0); // Char début 4 / 4
        nb_columns -= 4;

      } else if (nb_columns == 4) {
        lcd.write((byte) 0); // Char début 4 / 4
        nb_columns = 0;

      } else {
        switch_progressbar_bank(0);
        lcd.setCursor(i, line);
        lcd.write(nb_columns + 4); // Char début N / 4
        nb_columns = 0;
      }

    } else if (i == LCD_NB_COLUMNS - 5) { // Derniére case

      /* Affiche le char de fin en fonction du nombre de colonnes */
      if (nb_columns > 0) {
        switch_progressbar_bank(3);
        lcd.setCursor(i, line);
        lcd.write(nb_columns + 3); // Char fin N / 4

      } else {
        lcd.write(3); // Char fin 0 / 4
      }

    } else { // Autres cases

      /* Affiche le char adéquat en fonction du nombre de colonnes */
      if (nb_columns == 0) {
        lcd.write(1); // Char div 0 / 8

      } else if (nb_columns >= 8) {
        lcd.write(2); // Char div 8 / 8
        nb_columns -= 8;

      } else if (nb_columns >= 4 && nb_columns < 8) {
        switch_progressbar_bank(2);
        lcd.setCursor(i, line);
        lcd.write(nb_columns); // Char div N / 8
        nb_columns = 0;

      } else if (nb_columns < 4) {
        switch_progressbar_bank(1);
        lcd.setCursor(i, line);
        lcd.write(nb_columns + 3); // Char div N / 8
        nb_columns = 0;
      }
    }
  }
  
  /* Affiche le pourcentage */
  char tmp[5];
  sprintf(tmp, "%3d%%", percent);
  lcd.print(tmp);
}

void setup() {
  /*
  //ethernet shield reset
  pinMode(10, OUTPUT);
  digitalWrite(10, LOW);
  delay(1000);
  digitalWrite(10, HIGH);
  delay(1000);
  digitalWrite(10, LOW);
  //digitalWrite(10, HIGH); 
  */
  
  // set up the LCD's number of columns and rows:
  lcd.begin(LCD_NB_COLUMNS, LCD_NB_ROWS);
  setup_progressbar();
  lcd.clear();
  // Print a message to the LCD.
  lcd.print("Demarrage.......");
  // put your setup code here, to run once:
  Serial.begin(9600);

  // start the Ethernet connection:
  Ethernet.begin(mac, ip, myDns, gateway, subnet);
  // give the ethernet module time to boot up:
  delay(1000);  
  Serial.println("Ethernet setup complete");
  lcd.clear();
  lcd.print("Ethernet OK!");
  
  delay(1000); lcd.clear();
  lcd.print("Testing LCD.....");
  
  for (int i=0; i <110; i=i+10)
  {
    draw_progressbar(i, 1);
    delay(200);
    Serial.print("Testing progress bar: "); Serial.println(i);
    Serial.println("Now entering the loop");
  } 
}

void loop() {
  
  
  Serial.println("Contacting Xively ... ");
  int ret = xivelyclient.get(feed, APIKEY);
  Serial.print("xivelyclient.get returned HTTP code: ");
  Serial.println(ret);

  if (ret > 0)
  {
    Serial.println("Datastream is...");
    Serial.println(feed[0]);

    Serial.print("Current level is: ");
    //float float_value = datastreams[0].getFloat();
    float float_value = feed[0].getFloat();
    
    Serial.println();
    Serial.print("> Level when minimum: "); Serial.println(lLevelMin);
    Serial.print("> Level when maximum: "); Serial.println(lLevelMax);
    Serial.print("> Level for 100% fillness: "); Serial.println(lLevelFor100PercFillness);
    Serial.print("> Level for 1% fillness: "); Serial.println(lLevelFor1PercFillness);
    // Calculates percentage of fillness
    int iFillness = (float_value-lLevelMin)/(lLevelFor1PercFillness*-1);
    Serial.print("> Current % of fillness: "); Serial.println(iFillness);
    
    Serial.println(float_value);
    // set the cursor to column 0, line 1
    // (note: line 1 is the second row, since counting begins with 0):
    // Print a message to the LCD.
    // Print cm value on the 1st line
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Niveau: "); lcd.print(float_value, 2); lcd.print("cm");
    // Draw the progress bar wth the percentage value on the 2nd line
    draw_progressbar(iFillness, 1);
    delay(2000);
    lcd.clear();
    lcd.print("Dist. min: 100cm");
    // Draw the progress bar wth the percentage value on the 2nd line
    draw_progressbar(iFillness, 1);
    delay(4000);
    lcd.clear();
    lcd.print("Niveau: "); lcd.print(float_value, 2); lcd.print("cm");
    // Draw the progress bar wth the percentage value on the 2nd line
    draw_progressbar(iFillness, 1);
    //lcd.setCursor(0, 1);
    //lcd.print("cm "); lcd.print(iFillness); lcd.print("%");
    // Draw the progress bar wth the percentage value on the 2nd line
    draw_progressbar(iFillness, 1);
  }
  //Serial.println();
  delay(15000UL);
}
