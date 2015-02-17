/*
 * Nicolas Aguirre
 * Quest 3.2
 */

const int SENSOR_PIN = A0;
const int BUTTON_PIN = 2;

int sensorValue = 0;
int buttonValue = 0;

void setup() {
  Serial.begin(9600);
  pinMode(SENSOR_PIN, INPUT);
  pinMode(BUTTON_PIN, INPUT_PULLUP);
}


void loop() {
  sensorValue = analogRead(SENSOR_PIN);
  buttonValue = digitalRead(BUTTON_PIN);
  Serial.print(sensorValue);
  Serial.print(" ");
  Serial.print(buttonValue == HIGH ? 0 : 1);
  Serial.println();
  delay(5);

}


