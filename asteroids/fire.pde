class Fire extends GameObject {

  int t;//transaparency
  PVector nudge;

  Fire() {
    lives = 1;
    size = int(random(5, 10));
    t = int(random(200, 255));
    location = myShip.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(25);
    location.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI + random(-0.5, 0.5));//180
    velocity.setMag(5);
  }

  void show() {
    noStroke();
    fill(255, 0, 0, t);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    t = t - 20;
    if ( t <= 0) lives = 0;
  }
}
