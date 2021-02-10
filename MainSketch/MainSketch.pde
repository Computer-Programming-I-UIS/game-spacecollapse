import java.awt.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

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

//---------------------------------------------

float specLow = 0.03; // 3% 0.03
float specMid = 0.125;  // 1 = 0.12 52.5% 0.125
float specHi =  5.20;   //  = 5.2 020% 5.20

float scoreLow = 255;
float scoreMid = 0;
float scoreHi = 0;

float oldScoreLow = scoreLow;
float oldScoreMid = scoreMid;
float oldScoreHi = scoreHi;

float scoreDecreaseRate = 25;//25

int nbCubes;
Cube[] cubes;

//---------------------------------------------

PImage shi;
PImage shi2;
PImage shi3;

PImage space;
PImage SC;

PImage asteroid;

int nstars = 30;//estrellas con efectos
int nbstars = 2;//estrellas grandes sin efectos(temporal)
int normstars = 5;//estrellas normales sin efectos(temporal)
int numAsteroids = 5;

int bulletWidth = 5;

int gameStatus = 3;
int Menu;

ArrayList<Bullet>bullets;

StarsPlus[] stars = new StarsPlus [nstars];
StarsBig[] starsbig = new StarsBig[nbstars];
StarsNorm[] starsnorm = new StarsNorm[normstars];

//Asteroids[] rock = new Asteroids[5];

ArrayList<Asteroid> meteoritos;

float xmouse = mouseX;//constrain(mouseX - 50, 300, 1150);
float ymouse = mouseY;//mouseY - 16;

boolean locked = false; 




void setup() {

  size(1500, 1000, P3D);
  frameRate(60);

  //fullScreen(P3D);

  bullets = new ArrayList<Bullet>();
  meteoritos = new ArrayList<Asteroid>();

  shiplife = new LifeBar();
  shipshield = new ShieldBar();

  minim = new Minim(this);
  main = minim.loadFile("Start.mp3");
  //clear(bullets);

  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus,MX,MY)
  start = new Buttom(width/2-150, height/3, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "START", width/2, height/2.5, 0, 255, 255, 0, 50, 3, 1920/2-50, 1080/2, 0, 0);
  config = new Buttom(width/2-150, height/2, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "OPTIONS", width/2, height/1.77, 255, 255, 0, 0, 50, 2, 1920/2, 0, 0, 0.1);
  exit = new Buttom(width/2-150, height/1.5, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "EXIT", width/2, height/1.37, 255, 0, 0, 0, 50, 1, 1920/2+100, 1080/2+100, 0, 0.50);








  yes = new Buttom(width/2-70*2, height/2+35, 70, 70, 12, #ff0000, 0, 10, #808080, 0, 133, "YES", width/2-104, height/2+95, 255, 0, 0, 0, 35, 11, 1920/2-75, 1080/2+75, 0, 0);
  no = new Buttom(width/2+70, height/2+35, 70, 70, 12, #0DFF00, 0, 10, #808080, 0, 133, "NO", width/2+104, height/2+95, 0, 255, 0, 0, 35, 0, 1920/2, 1080/2-300, 0, 0);

  this.awakestar();

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  minim = new Minim(this);

  main = minim.loadFile("Start.mp3");

  fft = new FFT( main.bufferSize(), main.sampleRate());

  //Un cube par bande de fréquence
  nbCubes = 300; // (int)(fft.specSize()*specHi)
  cubes = new Cube[nbCubes];

  for (int i = 0; i < nbCubes; i++) {
    cubes[i] = new Cube();
  }


  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  shi = loadImage("ShipI.png");
  shi2 = loadImage("ShipII.png");
  shi3 = loadImage("ShipIII.png");

  asteroid = loadImage("Asteroid.png");

  SC = loadImage("Logo.png");
  space = loadImage("Space.png");


  main.loop();
  main.setGain(-10);// ajustamos el volumen inicial a uno tolerable
}

void draw() 
{
  background(0);

  onstart();
}

void scrollspace()
{
  int x = frameCount*3 % space.width;

  for (int i = -x; i < width; i += space.width) {
    copy(space, 0, 0, space.width, height, 300, -i, space.width, height);
  }
}

void onstart()
{  
  switch (gameStatus)
  {
  case 0:

    //fullScreen(P3D);
    this.mainmenu();

    break;
  case 1:


    this.areyousure();

    break;
  case 2:

    this.options();

    break;

  case 3:


    noCursor();
    //this.scrollspace(); 
    main.pause();

    this.drawstar();
    nave();

    xmouse = constrain(mouseX, 300, 1150);
    ymouse = mouseY - 16;

    break;

  case 11:

    exit();

    break;
  }
}

void awakestar()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new StarsPlus();
  }

  for (int i = 0; i < starsbig.length; i++) {
    starsbig[i] = new StarsBig();
  }

  for (int i = 0; i < starsnorm.length; i++) {
    starsnorm[i] = new StarsNorm();
  }
  for (int i = 0; i < numAsteroids; i++) {
    //rock[i] = new Asteroids();
    meteoritos.add(new Asteroid());//llamando el constructor (colocar argumentos del constructor)
  }
}
void drawstar()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i].caida();
    //stars[i].mouseMove();
  }
  for (int i = 0; i < starsnorm.length; i++) {
    starsnorm[i].caida();
    starsnorm[i].mouseMove();
  }
  for (int i = 0; i < starsbig.length; i++) {
    starsbig[i].caida();
    starsbig[i].mouseMove();
  }
  for(Asteroid rock : meteoritos) {
    rock.caida();
    rock.collision(bullets);
  }
}  
void mainmenu()
{

  backCubes();


  image(SC, width/2-298.5, 100);//width/2-298.5, 100


  start.showbuttom();
  config.showbuttom();
  exit.showbuttom();
}
void options()
{
}
void areyousure()
{
  int w = 500;
  int h = 300;

  strokeJoin(ROUND);
  stroke(255, 0, 248);
  strokeWeight(10);
  fill(0);

  rect(width/2-250, height/2.5, w, h);

  textSize(50);
  fill(255, 255, 0);
  textAlign(CENTER, BOTTOM);

  text("ARE YOU SURE?", width/2, height/2);
  //filter( BLUR, 4);

  no.showbuttom();
  yes.showbuttom();
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void backCubes()
{

  fft.forward(main.mix);

  //Calcul des "scores" (puissance) pour trois catégories de son
  //D'abord, sauvgarder les anciennes valeurs
  oldScoreLow = scoreLow;
  oldScoreMid = scoreMid;
  oldScoreHi = scoreHi;

  //Réinitialiser les valeurs
  scoreLow = 0;
  scoreMid = 0;
  scoreHi = 0;

  //Calculer les nouveaux "scores"
  for (int i = 0; i < fft.specSize()*specLow; i++)
  {
    scoreLow += fft.getBand(i);
  }

  for (int i = (int)(fft.specSize()*specLow); i < fft.specSize()*specMid; i++)
  {
    scoreMid += fft.getBand(i);
  }

  for (int i = (int)(fft.specSize()*specMid); i < fft.specSize()*specHi; i++)
  {
    scoreHi += fft.getBand(i);
  }

  //Faire ralentir la descente.
  if (oldScoreLow > scoreLow) {
    scoreLow = oldScoreLow - scoreDecreaseRate;
  }

  if (oldScoreMid > scoreMid) {
    scoreMid = oldScoreMid - scoreDecreaseRate;
  }

  if (oldScoreHi > scoreHi) {
    scoreHi = oldScoreHi - scoreDecreaseRate;
  }

  //Volume pour toutes les fréquences à ce moment, avec les sons plus haut plus importants.
  //Cela permet à l'animation d'aller plus vite pour les sons plus aigus, qu'on remarque plus
  float scoreGlobal = 0.66*scoreLow + 0.8*scoreMid + 1*scoreHi;

  //Couleur subtile de background
  background(scoreLow/100, scoreMid/100, scoreHi/100);

  //Cube pour chaque bande de fréquence
  for (int i = 0; i < nbCubes; i++)
  {
    //Valeur de la bande de fréquence
    float bandValue = fft.getBand(i);

    //La couleur est représentée ainsi: rouge pour les basses, vert pour les sons moyens et bleu pour les hautes. 
    //L'opacité est déterminée par le volume de la bande et le volume global.
    cubes[i].display(scoreLow, scoreMid, scoreHi, bandValue, scoreGlobal);
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void keyPressed() // echarle un ojo a keyReleased();
{
  toDoKeyPressed();
}
void mouseReleased()
{

  locked = false;
}
