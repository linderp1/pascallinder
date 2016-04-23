//
// Extension of the initial project downloaded from: http://blog.petrockblock.com/2012/05/19/usb-keyboard-with-arduino-and-v-usb-library-an-example/
// Adding Volume up/down/mute functions
// 
// The following are the added keyboard extension to UsbKeyboard.h library:
// Key mapping where found in the USB HID library http://www.usb.org/developers/hidpage/Hut1_12v2.pdf
// --------------------------------------------
// | Key desc     | Decimal value | Hex value |
// --------------------------------------------
// | Mute         |    127        |    7F     |
// | volume up    |    128        |    80     |
// | volume down  |    129        |    81     |
// --------------------------------------------
//
// Pascal Linder, September 27th 2015
//

#include "UsbKeyboard.h"

#define PIN_BUTTON_MUTE 7 // the button KEY_MUTE is attached to pin 7
#define PIN_BUTTON_VOLUME_UP 8 // the button KEY_VOLUME_UP is attached to pin 8
#define PIN_BUTTON_VOLUME_DOWN 9 // the button KEY_VOLUME_DOWN is attached to pin 9

int lastStateBUTTON_MUTE = LOW; // LOW is equivalent to 0
int lastStateBUTTON_VOLUME_UP = LOW; // LOW is equivalent to 0
int lastStateBUTTON_VOLUME_DOWN = LOW; // LOW is equivalent to 0

void setup() {
  //  button setup
  pinMode(PIN_BUTTON_MUTE, INPUT);
  pinMode(PIN_BUTTON_VOLUME_UP, INPUT);
  pinMode(PIN_BUTTON_VOLUME_DOWN, INPUT);

  // USB setup -----------------
  // Disable timer0 since it can mess with the USB timing. Note that
  // this means some functions such as delay() will no longer work.
  TIMSK0 &= !(1<TOIE0);
  // Clear interrupts while performing time-critical operations
  cli();

  // Force re-enumeration so the host will detect us
  usbDeviceDisconnect();
  delayMs(250);
  usbDeviceConnect();

  // Set interrupts again
  sei();
}

void loop() {
  // update USB device state
  UsbKeyboard.update();

  // check, if transition to button-pressed has occured
  if( (digitalRead(PIN_BUTTON_MUTE) == HIGH) && (lastStateBUTTON_MUTE==LOW) ) {
    //UsbKeyboard.sendKeyStroke(KEY_A); // if so, send the letter 'a' via USB keyboard
    UsbKeyboard.sendKeyStroke(KEY_MUTE);
    lastStateBUTTON_MUTE = HIGH; // update the state variable
    delay(10); // simple de-bouncing
  // check, if the button was released
  } else if( (digitalRead(PIN_BUTTON_MUTE) == LOW) && (lastStateBUTTON_MUTE==HIGH) ) {
    lastStateBUTTON_MUTE = LOW; // if so, update the state variable
    delay(10); // simple de-bouncing
  }
  
  if( (digitalRead(PIN_BUTTON_VOLUME_UP) == HIGH) && (lastStateBUTTON_VOLUME_UP==LOW) ) {
    //UsbKeyboard.sendKeyStroke(KEY_A); // if so, send the letter 'a' via USB keyboard
    UsbKeyboard.sendKeyStroke(KEY_VOLUME_UP);
    lastStateBUTTON_VOLUME_UP = HIGH; // update the state variable
    delay(10); // simple de-bouncing
  // check, if the button was released
  } else if( (digitalRead(PIN_BUTTON_VOLUME_UP) == LOW) && (lastStateBUTTON_VOLUME_UP==HIGH) ) {
    lastStateBUTTON_VOLUME_UP = LOW; // if so, update the state variable
    delay(10); // simple de-bouncing
  }
  
  if( (digitalRead(PIN_BUTTON_VOLUME_DOWN) == HIGH) && (lastStateBUTTON_VOLUME_DOWN==LOW) ) {
    //UsbKeyboard.sendKeyStroke(KEY_A); // if so, send the letter 'a' via USB keyboard
    UsbKeyboard.sendKeyStroke(KEY_VOLUME_DOWN);
    lastStateBUTTON_VOLUME_DOWN = HIGH; // update the state variable
    delay(10); // simple de-bouncing
  // check, if the button was released
  } else if( (digitalRead(PIN_BUTTON_VOLUME_DOWN) == LOW) && (lastStateBUTTON_VOLUME_DOWN==HIGH) ) {
    lastStateBUTTON_VOLUME_DOWN = LOW; // if so, update the state variable
    delay(10); // simple de-bouncing
  }

}

// helper method for V-USB library
void delayMs(unsigned int ms) {
  for( int i=0; i<ms; i++ ) {
    delayMicroseconds(1000);
  }
}
