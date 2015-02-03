int LED1 = 10;
int LED2 = 12;
boolean randomize = true;
int myCase = 1;

void setup() 
{
  pinMode(LED1, OUTPUT);  
  pinMode(LED2, OUTPUT);  
  Serial.print("hello");
}

void loop()
{
  switch (myCase)
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

}







