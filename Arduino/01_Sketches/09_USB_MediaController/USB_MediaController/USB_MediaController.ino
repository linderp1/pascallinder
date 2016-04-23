#include "UsbKeyboard.h"

#define PIN_BUTTON 7 // the button is attached to pin 7

int lastState = LOW; // LOW is equivalent to 0

void setup() {
  //  button setup
  pinMode(PIN_BUTTON, INPUT);

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
  if( (digitalRead(PIN_BUTTON) == HIGH) && (lastState==LOW) ) {
    UsbKeyboard.sendKeyStroke(KEY_A); // if so, send the letter 'a' via USB keyboard
    lastState = HIGH; // update the state variable
    delay(10); // simple de-bouncing
  // check, if the button was released
  } else if( (digitalRead(PIN_BUTTON) == LOW) && (lastState==HIGH) ) {
    lastState = LOW; // if so, update the state variable
    delay(10); // simple de-bouncing
  }

}

// helper method for V-USB library
void delayMs(unsigned int ms) {
  for( int i=0; i<ms; i++ ) {
    delayMicroseconds(1000);
  }
}
