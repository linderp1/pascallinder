/* 
   Sample sketch for Multimedia Keys
   Alternately mute and un-mute the system volume every five seconds.
 
   http://stefanjones.ca/blog/arduino-leonardo-remote-multimedia-keys/
*/

void setup() { 
}
 
void loop() {
  delay(5000); 
 
  // Prevent duplicate activation
  
  Remote.mute();
  Remote.clear(); 
  
}
