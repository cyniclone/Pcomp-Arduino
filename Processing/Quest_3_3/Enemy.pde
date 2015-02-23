// User-controlled ship class

class Enemy {
  // Position
  float x, y;

  Ship (float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update () {
    y += 5;
  }

  void render () {
    fill(80, 80, 80);
    rect (x, y, 20, 20);

  }
}

