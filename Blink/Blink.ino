int LED = 13;

void setup() 
{
  pinMode(LED, OUTPUT);  
}

void loop()
{
   digitalWrite(LED, HIGH);
   delay(500);    //Delay of 500 ms
   digitalWrite(LED,LOW);
   delay(500);
}
