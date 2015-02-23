// User-controlled ship class

class Ship {
  // Position
  float x, y;
  boolean firing;

  Ship (float x, float y) {
    this.x = x;
    this.y = y;
    firing = false;
  }

  void update () {
  }

  void render () {
    fill(255, 60, 60);
    rectMode(CENTER);
    rect (x, y, 20, 20);

    if (firing) {
      // Render the ship's laser
      fill (255, 255, 0);
      line (x, y, x, 0);
    }
  }
}

