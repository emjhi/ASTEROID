void game() {
  //background
  bg.resize(1100, 0);
  image(bg, 0, 0);

  //objects
  int i = 0;
  while ( i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();

    if (obj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }

  //ufo 
  UFOtimer++;

  if (UFOtimer >= 1500) {
    myObjects.add(new Ufo());
    UFOtimer = 0;
  }

  //pause
  stroke(255);
  noFill();
  strokeWeight(4);
  rect(560, 40, 40, 40);
  line(555, 30, 555, 50);
  line(565, 30, 565, 50);

  //teloport cool down
  rectMode(CORNER);
  noStroke();
  fill(255);
  rect(20, 20, 200, 20);

  fill(255, 0, 0);
  if (teloTimer >= 200) fill(0, 255, 0);
  rect(20, 20, teloTimer, 20);
  rectMode(CENTER);

  //othe stuff
  textFont(font);
  textSize(30);
  text("score:" + asteroidCount, 475, 575);

  //text(UFOtimer, 300, 450);
  text("lives:" + myShip.lives, 100, 575);

  if (myShip.lives <= 0) {
    mode = GAMEOVER;
  }

  if (asteroidCount == 28) {
    mode = GAMEOVER;
  }
}



void gameClicks() {
  //pause
  if ( mouseX >= 540 && mouseX <= 580 && mouseY >= 20 && mouseY <= 60) {
    mode = PAUSE;
  }
}
