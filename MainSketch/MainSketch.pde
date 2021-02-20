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


PImage Credits;
PImage RP;
PImage space;
PImage SC;

PImage[] load = new PImage[6];

boolean shaking = false;
int frame = 0;

ArrayList<Bullet>bullets;
ArrayList<Asteroid> meteoritos;



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
  
  toShake();
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
