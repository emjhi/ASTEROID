//Emma SUn
//Oct 4th 2021
//Aster0oids

int lives;
int UFOtimer;
int immunTimer;
int lifeTimer;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer shoot;

//teloport
float teloTimer = 200;

//asteroid
int asteroidCount;

//gif intro
PImage[] gif;
int f;
int n;

//game background
PImage bg;
PImage win;
PImage lose;

//font
PFont font;
PFont font2;

//objects
Ship myShip;
ArrayList<GameObject> myObjects;

//keyboard
boolean wkey, akey, skey, dkey, qkey, spacekey;

//mode framwork
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

void setup() {
  size(600, 600, FX2D);
  rectMode(CENTER);
  textAlign(CENTER);

  //objects
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  
  //asteroids
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());

  //keyboard
  wkey = akey = skey = dkey = spacekey = qkey = false;

  //font
  font = createFont("conthrax-sb.ttf", 50);
  font2 = createFont("Star Trek_future.ttf", 50);

  mode = GAME;

  //intro gif
  f = 74;
  gif = new PImage[f];
  int i = 0;
  while ( i< f) {
    gif[i] = loadImage("frame_"+i+"_delay-0.05s.gif");
    i++;

    //images
    bg = loadImage("maxresdefault.jpg");
    win = loadImage("GettyImages-1211293811.jpg");
    lose = loadImage("practical-informations__header.jpg");
  }

  //minim
  minim = new Minim(this);
  shoot = minim.loadFile("mixkit-laser-gun-shot-3110.wav");
}

void draw() {
  background(0);

  //mode framwoekr
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
}

void reset() {
  myObjects = new ArrayList<GameObject>();

  myShip.lives = 3;
  myShip.velocity = new PVector(0, 0);
  myShip.location = new PVector(width/2, height/2);
  myShip.direction = new PVector(0, -0.1);

  myObjects.add(myShip);
  immunTimer = 200;
  asteroidCount = 0;
  UFOtimer = 0;

  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
}
