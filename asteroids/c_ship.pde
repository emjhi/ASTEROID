class Ship extends GameObject {

  PVector direction;
  int shotTimer, threshold;
  float immunTimer;

  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 60;
    immunTimer = 200;
  }

  void show() {
    text("immunity" + immunTimer, 300, 350);
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    
    if (immunTimer > 0) {
      noFill();
      stroke(255, 0, 0);
    }

    strokeWeight(4);
    fill(#7EFAE8);
    triangle(-20, 20, -20, -20, 30, 0);

    popMatrix();

    //teloport cool down
    if (teloTimer < 200)  teloTimer = teloTimer + 0.5;

    rectMode(CENTER);
  }

  void act() {
    super.act();
    
    //teleport
    if (qkey && teloTimer >= 200) {
      location.x = random(600);
      location.y = random(600);
      int i = 0;
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) {
          location.x = random(width);
          location.y = random(height);
        }
      }
      teloTimer = 0;
    }

    if (velocity.mag() > 10) velocity.setMag(10);

    if (wkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (skey) velocity.sub(direction);
    if (akey) direction.rotate(radians(-5));
    if (dkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
      shoot.rewind();
      shoot.play();  
    }
    shotTimer++;
    
    if (immunTimer >= 0) immunTimer--;

    //damage stuff lives die
    int i = 0;
    while ( i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (immunTimer <= 0) {
        if (obj instanceof Asteroid) {
          if (dist(location.x, location.y, obj.location.x, obj.location.y) <= 35 + obj.size/2) {
            lives--;
            immunTimer = 200;
          }
        }
        if (obj instanceof UFOBullet) {
          if (dist(location.x, location.y, obj.location.x, obj.location.y) <= 35 + obj.size/2) {
            lives--;
            immunTimer = 200;
          }
        }
      } 
      i++;
    }
  }
}
