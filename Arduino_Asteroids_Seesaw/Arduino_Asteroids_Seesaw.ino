// BOARD --- Arduino Mega 2560
// PORT  --- /dev/tty.usbmodemfa141

int inPin = 2;         // input pin for the tilt sensor
int outPinA = 12;      // output pins for the leds - just feedback for debugging
int outPinB = 13;

int LEDstate = HIGH;   // the current state of the output pin
int reading;           // the current reading from the input pin
int previous = LOW;    // the previous reading from the input pin
 
// the following variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long time = 0;         // the last time the output pin was toggled
long debounce = 50;    // the debounce time, increase if the output flickers

int left, right;       // turn direction
 
void setup()
{
  Serial.begin(9600);
  pinMode(inPin, INPUT);
  digitalWrite(inPin, HIGH);   // turn on the built in pull-up resistor
  pinMode(outPinA, OUTPUT);
  pinMode(outPinB, OUTPUT);
}
 
void loop()
{
  int switchstate;
 
  reading = digitalRead(inPin);
 
  // If the switch changed, due to bounce or pressing...
  if (reading != previous) {
    // reset the debouncing timer
    time = millis();
  } 
 
  if ((millis() - time) > debounce) {
     // whatever the switch is at, its been there for a long time
     // so lets settle on it!
     switchstate = reading;
 
     // Now invert the output on the pin13 LED
    if (switchstate == HIGH)
    {
      // left = 20;  right = 31;
      Serial.println("2-0");
      Serial.println("3-1");
      LEDstate = LOW;
    }
    else
    {
      //left = 21;  right = 30;
      Serial.println("2-1");
      Serial.println("3-0");
      LEDstate = HIGH;
    }
  }
  digitalWrite(outPinA, LEDstate);
  digitalWrite(outPinB, switchstate);

  delay(100);
 
  // Save the last reading so we keep a running tally
  previous = reading;
}
