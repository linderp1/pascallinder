/* Inclut la bibliothéque LiquidCrystal pour l'écran LCD */
#include <LiquidCrystal.h>


/* Créer l'objet lcd avec une configuration de broches compatible avec shield LCD de DFRobots */
LiquidCrystal lcd(8, 9, 2, 3, 4, 5);


/* Constantes pour la taille de l'écran LCD */
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


/** Fonction setup() */
void setup(){

  /* Initialise l'écran LCD */
  lcd.begin(LCD_NB_COLUMNS, LCD_NB_ROWS);
  setup_progressbar();
  lcd.clear();

  lcd.print("Bonjour");
}


/** Fonction loop() */
void loop(){

  /* Valeur en pourcent de la barre de progression */
  static byte percent = 0;

  /* Affiche la valeur */
  draw_progressbar(percent, 1);

  /* Incrémente le pourcentage */
  if (++percent == 101) {
    // Revient à zéro si le pourcentage dépasse 100%
    percent = 0;
    delay(1000);
  }

}
