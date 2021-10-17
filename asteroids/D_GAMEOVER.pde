void gameover() {
  if (asteroidCount == 28) {
    background(#33F027);
    image(win, 0, 0);
    fill(255);
    textFont(font2);
    textSize(100);
    text("YOU WON", height/2, width/2);
  } else {
    background(#F027D9);
    image(lose, 0, 0);
    fill(255);
    textFont(font2);
    textSize(100);
    text("YOU LOST", height/2, width/2);
  }
}

void gameoverClicks() {
  mode = INTRO;
  reset();
}
