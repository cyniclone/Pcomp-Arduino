// User-controlled ship class

class Enemy {
  // Position
  float x, y;
  boolean dead;

  Enemy (float x, float y) {
    this.x = x;
    this.y = y;
    dead = false;
  }

  void update () {
    y += 5;
  }

  void render () {
    fill(80, 80, 80);
    rectMode(CENTER);
    rect (x, y, 20, 20);
  }
}

