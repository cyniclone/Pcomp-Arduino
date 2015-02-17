/* switch
 Nicolas Aguirre
 
 Code modified from Arduino Switch tutorial
 Code referenced from Christoper Lewis' Arduino tutorial:
 http://cttoronto.com/10/22/2013/introduction-arduino-workshop-notes/
 
 
 */

int fading_led = 9;
int brightness = 0;

// Used to check delay time
long lastTime;
int delayTime = 2000;

// Check LED states
int ledState = LOW;
int lastSwitchState = LOW; // Used to alternate between states

// Use millis instead of delay
long previousMillis;

void setup()
{
  Serial.begin(19200);

  pinMode (fading_led, OUTPUT); // Set LED as output

  pinMode(7, INPUT);        // Set pin to input
  digitalWrite(7 HIGH);

}

void loop()
{
  int sensorValue = analogRead(A0); // Read potentiometer on pin A0

    long currentMillis = millis(); // Get # of milliseconds passed since sketch started

  // Sensor returns 0-1023, LED goes from 0 to 255
  brightness = map (sensorValue, 0, 1023, 0, 255);

  // "LOW" is on because the pullup resistor reverses values
  if (digitalRead(7) == LOW) {
    if (lastSwitchState == HIGH) {
      // Set delaytime
      delayTime = (currentMillis - lastTime); 
      lastTime = currentMillis;
    }

    // Set brightness to off while button is depressed
    brightness = 0;
    lastSwitchState = LOW;
  }else{
    // If it's not LOW it's HIGH
    lastSwitchState = HIGH; 
  }

  if (currentMillis - previousMillis > delayTime) {
    previousMillis = currentMillis;
    onDelayEvent(); 
  }

  if (ledState == LOW) {
    analogWrite(fading_led, 0); 
  }else{
    analogWrite(fading_led, brightness); 
  }
  delay(1);
}

void function onDelayEvent() 
{
  //Toggle light
 if (ledstate == LOW) {
  ledState = HIGH;
  }else{
  ledState = LOW;
  { 
}




