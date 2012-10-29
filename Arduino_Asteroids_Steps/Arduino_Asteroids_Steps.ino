int pressureMat1 = 11;          // pressure mat for each of the two steps (forward and backward movement)
int pressureMat2 = 12;          
int val1, val2;

void setup()
{
  pinMode(pressureMat1, INPUT);
  pinMode(pressureMat2, INPUT);
  Serial.begin(9600);
}

void loop()
{
  // Move forward mat
  val1 = digitalRead(pressureMat1);
  Serial.print("7");
  Serial.print("-");
  Serial.println(val1);         // sends 0 or 1 depending on whether someone stands on it or not
  
  delay(100);
  
  // Move backwards mat
  val2 = digitalRead(pressureMat2);
  Serial.print("8");
  Serial.print("-");
  Serial.println(val2);
  
  delay(100);
}
