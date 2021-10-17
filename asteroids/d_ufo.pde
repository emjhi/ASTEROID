class Ufo extends GameObject {

  PVector direction;
  int ShotTimer, Threshold;
  float vx, vy;
  int sides;

  Ufo() {
    lives = 5;
    sides = int(random(4));
    velocity = new PVector(-1, 1);
    velocity.rotate(random(0, TWO_PI));
    direction = new PVector (0, -0.1);

    ShotTimer = 0;
    Threshold = 80;
    size = 30;

    if (sides == 0) location = new PVector(random(600), -20);//top
    if (sides == 1) location = new PVector(random(600), height + 20);//bottom
    if (sides == 2) location = new PVector(-20, random(600));//left
    if (sides == 3) location = new PVector(width + 20, random(600));//right
  }

  void show() {      
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    strokeWeight(2);
    fill(#FC5C71);
    circle(0, 0, size);
    popMatrix();
  }

  void act() {
    super.act();
    ShotTimer++;

    lifeTimer++;
    if (lifeTimer >= 900) {
      if (location.x >= width + 20) lives = 0;
      if (location.x <= -20) lives = 0;
      if (location.y >= height + 20) lives = 0;
      if (location.y <= -20) lives = 0;
      lifeTimer = 0;
    }

    //getting hit by bullets
    int i = 0;
    while ( i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
          obj.lives = 0;
          lives--;
        }
      }
      i++;
    }

    //shooting
    if (ShotTimer > Threshold) {
      myObjects.add(new UFOBullet(location.x, location.y, vx, vy));
      ShotTimer = 0;
    }
  }
}
