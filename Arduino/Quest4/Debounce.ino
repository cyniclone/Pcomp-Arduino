
int debLastReading = HIGH; // Not pressed
int debButtonState = HIGH; // Official button state
int debDelay = 50;
long debLastDebounceTime = 0;

int readButtonDebounced() {

  int reading = digitalRead(buttonPin);
  if (reading != debLastReading) {
    debLastDebounceTime = now; 
  }
  if (now - debLastDebounceTime > debDelay) {
    if (reading != debButtonState) {
      debButtonState = reading;
    }
  }
  
  debLastReading = reading;
  return debButtonState;
}

