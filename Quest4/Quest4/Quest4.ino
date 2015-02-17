/* Arduino Quest 4
 * Modified from switch example Arduino
 * Using examples from: http://cttoronto.com/10/22/2013/introduction-arduino-workshop-notes/
 * Credit Christoper Lewis
*/
 

int fading_led = 9;       // the number of the output pin
int brightness = 0;

// Used to get delay time
long lastTime;
int delayTime = 2000;
long previousMillis;

int state = LOW;      // the current state of the output pin
int reading;           // the current reading from the input pin
int previousReading = LOW;    // the previous reading from the input pin

void setup()
{
  Serial.begin(19200);

  pinMode(fading_led, OUTPUT);
  pinMode(7, INPUT);
}

void loop()
{
// Read potentiometer on pin A0
  int sensorValue = analogRead(A0);

  // Get current time
  long currentMillis = millis();

  brightness = sensorValue/4; // Because brightness is 0-255, sensor is 0-1023

  reading = digitalRead(7);

  // if the input just went from LOW and HIGH and we've waited long enough
  // to ignore any noise on the circuit, toggle the output pin and remember
  // the time
  if (reading == LOW) {
    if (previousReading == HIGH) {
      delayTime = (currentMillis - lastTime) / 2;
      lastTime = currentMillis; 
    }
    brightness = 0;
    previousReading = LOW;
  } 
  else {
    previousReading = HIGH;
  }

  // If delayTime has passed, toggle light
  if (currentMillis - previousMillis > delayTime) {
    previousMillis = currentMillis;
    toggleLight(); 
  }

  if (state == LOW) {
    analogWrite(fading_led, 0);
  }
  else{
    analogWrite(fading_led, brightness);
  }
  delay(1);
}

void toggleLight() {
  //Toggle the light
  if (state == LOW){
    state = HIGH;
  }
  else{
    state = LOW;
  }
}
