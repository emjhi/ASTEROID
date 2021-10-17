void pause(){
  //background(0, 255 ,0 );
  
  fill(255);
  textFont(font);
  textSize(75);
  text("PAUSED", width/2, height/2);
  
}

void pauseClicks(){
  mode = GAME;
}
