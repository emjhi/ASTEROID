class Particle extends GameObject {

  int t;

  Particle(float x, float y) {
    lives = 1;
    size = 7;

    t = 255;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(PI + random(-7, 7));//180
  }

  void show() {
    fill(255, 255, 255, t);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    t = t - 15;
    if ( t <= 0) lives = 0;
  }
}
