import java.awt.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

SpaceShip player;

LifeBar shiplife;
ShieldBar shipshield;

Minim minim;
AudioPlayer main;
FFT fft;

Robot robot;

Buttom start;
Buttom config;
Buttom exit;
Buttom yes;
Buttom no;

Buttom credits;


PImage shi;
PImage shi2;
PImage shi3;

PImage shield1;
PImage shield2;
PImage shield3;
PImage shield4;
PImage shield5;

PImage load1;
PImage load2;
PImage load3;

PImage space;
PImage SC;

PImage Credits;
PImage RP;

PImage asteroid;
PImage asteroidDamaged;

int nstars = 30;//estrellas con efectos
int nstars2 = 5;
int nbstars = 2;//estrellas grandes sin efectos(temporal)
int normstars = 5;//estrellas normales sin efectos(temporal)
int numAsteroids = 5;// 5

int bulletWidth = 5;

int gameStatus = 3;
int Menu;

ArrayList<Bullet>bullets;
ArrayList<Asteroid> meteoritos;

StarPlus[] stars = new StarPlus [nstars];
StarBig[] starsbig = new StarBig[nbstars];
StarNorm[] starsnorm = new StarNorm[normstars];
StarPlus[] stars2 = new StarPlus [nstars2];

//Asteroids[] rock = new Asteroids[5];

//mouseY - 16;


void setup() {

  size(1500, 1000, P3D);
  frameRate(60);

  LoadImages();
  InitBackgroundCubes();

  bullets = new ArrayList<Bullet>();
  meteoritos = new ArrayList<Asteroid>();

  shiplife = new LifeBar();
  shipshield = new ShieldBar();

  minim = new Minim(this);
  main = minim.loadFile("S_Start.mp3");

  awakeStars();
  initShip();
  createButtoms();

  main.loop();
  main.setGain(-10);// ajustamos el volumen inicial a uno tolerable
}

void draw() 
{
  background(0);

  stateMachine();
}

//____________________________________________________________________________

void scrollspace()
{
  int x = frameCount*3 % space.width;

  for (int i = -x; i < width; i += space.width) {
    copy(space, 0, 0, space.width, height, 300, -i, space.width, height);
  }
}

void keyPressed() {
}

//void keyPressed()
//{
//  //player.keyPressed();
//}
void keyReleased()
{
  player.keyReleased();
}
void mouseReleased()
{

  locked = false;
}
