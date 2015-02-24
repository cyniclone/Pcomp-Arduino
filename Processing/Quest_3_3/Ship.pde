// User-controlled ship class

class Ship {
  // Position
  float x, y;

  Ship (float x, float y) {
    this.x = x;
    this.y = y;
  }

  void render () {
    fill(255, 60, 60);
    rectMode(CENTER);
    rect (x, y, 20, 20);
  }
}

