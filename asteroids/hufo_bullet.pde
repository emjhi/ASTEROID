class UFOBullet extends GameObject {
  PVector direction;
  int timer;

  UFOBullet(float x, float y, float vx, float vy) {
    timer = 80;
    lives = 1;
    location = new PVector(x, y);

    velocity = new PVector(myShip.location.x - location.x, myShip.location.y - location.y);
    velocity.setMag(10);

    size = 10;
  }

  void show() {
    strokeWeight(1);
    stroke(255);
    noFill();
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    timer--;
    if (timer <= 0) {
      lives = 0;
    }
  }
}
