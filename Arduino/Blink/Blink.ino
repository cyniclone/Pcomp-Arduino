int LED1 = 10;
int LED2 = 12;
boolean randomize = true;
int myCase = 2;  // Defines pattern of blinking

void setup() 
{
  pinMode(LED1, OUTPUT);  
  pinMode(LED2, OUTPUT);  
  Serial.print("hello");
}

void loop()
{
  switch (myCase) {
  case 1:
    // Case 1 - Alternating
    {
      digitalWrite(LED1, HIGH);
      digitalWrite(LED2, LOW);
      if (randomize)
      {
        delay(random(1,1000));
      }
      else
      { 
        delay(500);    //Delay of 500 ms
      }
      digitalWrite(LED1, LOW);
      digitalWrite(LED2, HIGH);
      if (randomize)
      {
        delay(random(1,1000));
      }
      else
      { 
        delay(500);    //Delay of 500 ms
      }
      break;  
    }
    // ===================================================
  case 2:
  // LEDs blinking but not in SYNC
    {
      digitalWrite(LED1, HIGH);
      digitalWrite(LED2, HIGH);
      delay (random(1, 500));
      digitalWrite(LED1, LOW);
      delay (random(1, 500));
      digitalWrite(LED2, LOW);
      delay (random(1,500));

    }
  }

}









