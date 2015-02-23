/* Quest 3.3
 * Nicolas Aguirre
 *
 */

import processing.serial.*;
Serial _port;

float _sensorValue = 0;
boolean _buttonPressed = false;
final int RADIUS = 60;

// Allocate memory for actors
ArrayList<Enemy> enemies;

Ship ship;
Enemy e;

void setup() {
  size(800, 640);

  _port = new Serial(this, "/dev/tty.usbmodem1421", 9600);
  _port.bufferUntil('\n');
  
  Ship ship = new Ship (width/2, height - 50);
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
}

void draw() {
  // Add a new enemy every few seconds
  if (frameCount % 240 == 0) {
    Enemy e = new Enemy (random (0, width), 0); 
  }
  
  //handleInput ();
  
  // Update ship x position
  ship.x = map (_sensorValue, 0, 1024, 20, width - 20);
  ship.firing = _buttonPressed;
  
  render ();
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

// Handles user input
/*void handleInput () {
  // Sensor value mapped to x coordinate
  map (_sensorValue, 0, 1024, 0, width);
}*/

// Update positions and variables
void update () {
  
}

// Draw to screen
void render () {
  
  
  /*if (_buttonPressed) {
    float bgColor = map(_sensorValue, 0, 1024, 0, 255);
    background(bgColor);
  }

  if (_buttonPressed) {
    fill (random(0, 255), random(0, 255), random(0, 255));
  } else {
    fill (60, 60, 255, 127);
  }
  ellipse (map(_sensorValue, 0, 1024, 0, width), height/2, RADIUS, RADIUS);
  */
}

