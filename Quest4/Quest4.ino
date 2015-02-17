/* switch
 Nicolas Aguirre
 
 Code modified from Arduino Switch tutorial
 Code referenced from Christoper Lewis' Arduino tutorial:
 http://cttoronto.com/10/22/2013/introduction-arduino-workshop-notes/
 
 
 */

const int led_pin = 9;
const int button_pin = 7;
int brightness = 0;
int buttonState = 0;

// Used to check delay time
long lastTime;
int delayTime = 2000;

// Use millis instead of delay
long previousMillis;

void setup()
{
  //Serial.begin(19200);

  pinMode (led_pin, OUTPUT); // Set LED as output

  pinMode(button_pin, INPUT); // Button is an input

}

void loop()
{
  // Read button state
  buttonState = digitalRead(button_pin);

  //int sensorValue = analogRead(A0); // Read potentiometer on pin A0

    if (buttonState == HIGH) {
    digitalWrite(led_pin, HIGH);
  }
  else {
    digitalWrite(led_pin, LOW);
  }
}



