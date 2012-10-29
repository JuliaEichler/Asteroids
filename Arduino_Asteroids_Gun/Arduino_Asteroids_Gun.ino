// BOARD --- Arduino Uno
// PORT  --- /dev/tty.usbmodemfd141

int shootPin = 9;   // Button connected to pin 2
int shootVal;

void setup() {
  pinMode(shootPin, INPUT);              // Set pin as an input
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  // detect shoot
  shootVal = digitalRead(shootPin);
  
  Serial.print("5");
  Serial.print("-");
  
  if(shootVal == 1){
    Serial.println("0");
  }
  else
  {
    Serial.println("1");
  }
  
  delay(100);                            // Wait 100 milliseconds
}


