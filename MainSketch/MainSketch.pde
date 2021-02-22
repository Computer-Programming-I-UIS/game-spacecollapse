import java.awt.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

UI window;

Buttom start;
Buttom config;
Buttom exit;
Buttom yes;
Buttom no;
Buttom credits;

SpaceShip player;

LifeBar shiplife;
ShieldBar shipshield;

Minim minim;
AudioPlayer main;
FFT fft;

Robot robot;

boolean shaking = false;
boolean shakingmini = false;

int frameFx = 0;
int frame = 0;
int timeSlow = 0;

int thew = 1500;
int theh = 1000;



ArrayList<Bullet>bullets;
ArrayList<Asteroid> meteoritos;

void setup() {

  size(1500, 1000, P3D);
  frameRate(60);


  InitBackgroundCubes();

  bullets = new ArrayList<Bullet>();
  meteoritos = new ArrayList<Asteroid>();

  shiplife = new LifeBar();
  shipshield = new ShieldBar();

  minim = new Minim(this);
  main = minim.loadFile("S_Start.mp3");

  player = new SpaceShip();
  window = new UI();

  awakeStars();
  createButtoms();

  main.loop();
  main.setGain(-10);// ajustamos el volumen inicial a uno tolerable
}

void draw() 
{
  background(0,0,20);
  window.toShake();
  window.toShakemini();
  stateMachine();
}

//_____________________________NOT IN USE____________________________________

//void scrollspace()
//{
//  int x = frameCount*3 % space.width;

//  for (int i = -x; i < width; i += space.width) {
//    copy(space, 0, 0, space.width, height, 300, -i, space.width, height);
//  }
//}
//-----------------------------FOR NOW...------------------------------------
void keyReleased()
{
  player.keyReleased();
}
void mouseReleased()
{

  locked = false;
}
