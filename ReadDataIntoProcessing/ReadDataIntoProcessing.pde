// Reading Data into Processing
// Nicolas Aguirre

import processing.serial.*;

Serial _port; // Holds Serial object
float _inputValue = 0 // Global variable to hold input value

void setup() {
  size(800, 640);
  frameRate(10);
  _port = new Serial(this, "/dev/tty.usbmodem1421", 9600);

  // Tell Serial object to call function whenever it reads a new line
  _port.bufferUntil('\n');
}

void serialEvent (Serial p) {
  String s = preadStringUntil('\n');
  _inputValue = Float.parseFloat(s);
  println(_inputValue);
}
