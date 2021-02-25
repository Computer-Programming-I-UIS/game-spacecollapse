import java.awt.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

UI window;

Buttom start;
Buttom config;
Buttom credits;
Buttom tutorial;
Buttom exit;

Buttom yes;
Buttom no;


SpaceShip player;

Minim minim;
AudioPlayer main;
AudioPlayer inGame;
AudioPlayer hit;
AudioPlayer shoot;
AudioPlayer shieldBoing;
AudioPlayer shipHit;
AudioPlayer asteroidHit;
AudioPlayer loading;
AudioPlayer click;
AudioPlayer woosh;

FFT fft;

Robot robot;

boolean shaking = false;
boolean shakingmini = false;

int frameFx = 0;
int frame = 0;
int timeSlow = 0;

int playerScore = 0;

int thew = 1500;
int theh = 1000;

boolean genAsteroids = false;


ArrayList<Bullet>bullets;
ArrayList<Asteroid> meteoritos;

void setup() {

  size(1500, 1000, P3D);
  frameRate(60);


  InitBackgroundCubes();

  bullets = new ArrayList<Bullet>();
  meteoritos = new ArrayList<Asteroid>();

  minim = new Minim(this);
  main = minim.loadFile("S_Start.mp3");
  inGame = minim.loadFile("S_InGame.mp3");
  hit = minim.loadFile("Z_hit.mp3");
  asteroidHit = minim.loadFile("Z_TheHit.mp3");
  shoot = minim.loadFile("Z_Shoot.mp3");
  shieldBoing =  minim.loadFile("Z_TheHit.mp3");
  shipHit =  minim.loadFile("Z_ShipHit.mp3");
  loading =  minim.loadFile("Z_Loading.mp3");
  click =  minim.loadFile("Z_Click.mp3");
  woosh =  minim.loadFile("Z_Woosh.mp3");



  player = new SpaceShip();
  window = new UI();

  awakeStars();
  createButtoms();

  main.loop();
  inGame.loop();
  loading.loop();

  loading.pause();
  inGame.pause();

  main.setGain(-10);// ajustamos el volumen inicial a uno tolerable}
  loading.setGain(-30);
  hit.setGain(-20);
  shieldBoing.setGain(-20);
  shipHit.setGain(-30);
  asteroidHit.setGain(-20);
  shoot.setGain(-20);
  click.setGain(-15);
  woosh.setGain(-20);
  inGame.setGain(-20);
}

void draw() 
{
  background(0, 0, 20);
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
