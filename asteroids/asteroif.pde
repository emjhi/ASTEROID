class Asteroid extends GameObject {

  Asteroid() {
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
    lives = 1;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }

  void show() {
    strokeWeight(4);
    stroke(255);
    fill(#AA61EA);
    square(location.x, location.y, size);
  }

  void act() {
    super.act();

    int i = 0;
    while ( i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) {
          obj.lives = 0;
          lives = 0;

          if (size >= 30) {
            asteroidCount++;
            
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          } else {
            lives = 0;
            asteroidCount++;

            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
          }
        }
      }
      i++;
    }
  }
}
