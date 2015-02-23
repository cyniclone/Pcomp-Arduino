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
    Enemy e = new Enemy (random (0, width), 0.0f);
    enemies.add(e);
  }

  //handleInput ();

  // Update positions
  ship.x = map (_sensorValue, 0, 1024, 20, width - 20);
  ship.firing = _buttonPressed;
  for (int i = 0; i < enemies.size (); i++) {
    enemies.get(i).update();
  }

  // Check ship against every enemy
  if (ship.firing) {
    for (int i = 0; i < enemies.size (); i++) {
      e = enemies.get(i);
      
      // Check beam collision
      if (dist(ship.x, e.x, 0, 0) <= 20) {
        e.dead = true;
      }
    }
  }

  // Display everything
  render ();

  // Remove dead enemies
  for (int i = 0; i < enemies.size (); i++) {
    // If the enemy is dead, remove it from arraylist
    if (enemies.get(i).dead)
      enemies.remove(i);
  }
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

