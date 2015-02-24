/* switch
 Nicolas Aguirre
 
 Code modified from Arduino Switch tutorial
 Code referenced from Christoper Lewis' Arduino tutorial:
 http://cttoronto.com/10/22/2013/introduction-arduino-workshop-notes/
 */

// ======Global variables===========================

int ledPin = 13;
int buttonPin = 2;
int potPin = A0;

boolean ledIsOn = false;
boolean isSwitchOn = false; // is LED blinking
int buttonState = HIGH;
int lastButtonState = HIGH;

long now = 0;
long lastBlinkTime = 0;
int blinkInterval = 1000;

// ================================================

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(potPin, INPUT);
}

void loop() {
  now = millis();

  setBlinkIntervalBasedOnPot();

  if (buttonGoesFromPressedToReleased()) {
    toggleSwitch(); 
  }

  if (isSwitchOn) {
    blinkLed(); 
  } 
  else {
    turnLedOff();
  }
}

// ================================================

void setBlinkIntervalBasedOnPot() {
  int pot = analogRead(potPin); // 0 to 1023 
  // blink interval between 300 and 1500 ms
  blinkInterval = map(pot, 0, 1023, 1000, 150);
}

void blinkLed() {
  if (now - lastBlinkTime > blinkInterval) {
    toggleLed();
    lastBlinkTime = now;
  } 
}

void turnLedOff() {
  ledIsOn = false;
  digitalWrite(ledPin, LOW);
}

void toggleSwitch() {
  isSwitchOn = !isSwitchOn;
}

void toggleLed() {
  ledIsOn = !ledIsOn;
  if (ledIsOn) {
    digitalWrite(ledPin, HIGH); 
  } 
  else {
    digitalWrite(ledPin, LOW);
  }
}

boolean buttonGoesFromPressedToReleased() {
  boolean itDid = false;

//  buttonState = digitalRead(buttonPin);
  buttonState =  readButtonDebounced();
  if (buttonState == HIGH) {  // Not pressed
    if (lastButtonState == LOW) { // Pressed
      itDid = true;

    } 
  }
  lastButtonState = buttonState;
  return itDid;
}

// ================================================





