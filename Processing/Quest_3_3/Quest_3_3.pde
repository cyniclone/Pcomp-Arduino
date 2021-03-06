/* Quest 3.3
 * Nicolas Aguirre
 *
 */

import processing.serial.*;

Serial _port;

float _sensorValue = 0;
boolean _buttonPressed = false;
final int RADIUS = 60;

void setup() {
  size(800, 640);

  _port = new Serial(this, "/dev/tty.usbmodem1411", 9600);
  _port.bufferUntil('\n');
}

void draw() {
  
  if (_buttonPressed) {
    float bgColor = map(_sensorValue, 0, 1024, 0, 255);
    background(bgColor, 127);
  }

  if (_buttonPressed) {
    fill (random(0, 255), random(0, 255), random(0, 255));
  } else {
    fill (60, 60, 255, 127);
  }
  ellipse (map(_sensorValue, 0, 1024, 0 + RADIUS/2, width - RADIUS/2), height/2, RADIUS, RADIUS);
}

void serialEvent(Serial p) {
  String s = p.readStringUntil('\n');
  String[] tokens = splitTokens(s, " \r\n\t,");

  if (tokens.length >= 2) {
    _sensorValue = Float.parseFloat(tokens[0]);

    if (Integer.parseInt(tokens[1]) == 1) {
      _buttonPressed = true;
    } else {
      _buttonPressed = false;
    }

    println(_sensorValue + " " + _buttonPressed);
  }
}

