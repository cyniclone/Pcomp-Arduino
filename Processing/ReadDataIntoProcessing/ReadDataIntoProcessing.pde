// Reading Data into Processing
// Nicolas Aguirre

import processing.serial.*;

Serial _port; // Holds Serial object
float _inputValue = 0; // Global variable to hold input value
float x;
float y;

void setup() {
  size(800, 640);
  frameRate(10);
  
  x = 0;
  y = height/2;
  
  _port = new Serial(this, "/dev/tty.usbmodem1411", 9600);

  // Tell Serial object to call function whenever it reads a new line
  _port.bufferUntil('\n');
}

void serialEvent (Serial p) {
  String s = p.readStringUntil('\n');
  _inputValue = Float.parseFloat(s);
  println(_inputValue);
}

void draw() {
  float bgColor = map(_inputValue, 0, 1023, 0, 255);
  background(bgColor);
  
  fill(color(255, 80, 80, 127)); 
  x = map(_inputValue, 0, 1023, 0, width);
  ellipse(x,y, 30, 30);
}

