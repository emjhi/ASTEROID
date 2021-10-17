class Bullet extends GameObject {

  int timer;

  Bullet() {
    timer = 80;
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    velocity.add(myShip.velocity);
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
