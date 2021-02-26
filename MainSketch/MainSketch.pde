import java.awt.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

UI window;

Buttom start;
Buttom Pause;
Buttom Continue;
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
AudioPlayer move;
AudioPlayer exp;

FFT fft;

Robot robot;

boolean shaking = false;
boolean shakingmini = false;

int frameFx = 0;
int frameFxA = 0;
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

  main = minim.loadFile("data/music/S_Start.mp3");
  inGame = minim.loadFile("data/music/S_InGame.mp3");
  loading =  minim.loadFile("data/music/Z_Loading.mp3");

  hit = minim.loadFile("data/audio/Z_hit.mp3");
  exp = minim.loadFile("data/audio/Z_Exp.mp3");
  asteroidHit = minim.loadFile("data/audio/Z_TheHit.mp3");
  shoot = minim.loadFile("data/audio/Z_Shoot.mp3");
  shieldBoing =  minim.loadFile("data/audio/Z_plasmaBoing.mp3");
  shipHit =  minim.loadFile("data/audio/Z_ShipHit.mp3");
  click =  minim.loadFile("data/audio/Z_Click.mp3");
  woosh =  minim.loadFile("data/audio/Z_Woosh.mp3");
  move =  minim.loadFile("data/audio/Z_Mov.mp3");



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
  move.setGain(-20);
  exp.setGain(-20);
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
