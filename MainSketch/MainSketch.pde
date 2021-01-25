import java.awt.*;

LifeBar shiplife;
ShieldBar shipshield;

Robot robot;

Buttom start;
Buttom config;
Buttom exit;
Buttom yes;
Buttom no;

PImage shi;
PImage shi2;
PImage shi3;

PImage space;
PImage SC;

int nstars = 8;
int bulletWidth = 5;

int gameStatus = 0;
int Menu;

ArrayList<Bullet>bullets;
Stars[] stars = new Stars [nstars];

float xmouse = mouseX;//constrain(mouseX - 50, 300, 1150);
float ymouse = mouseY;//mouseY - 16;

void setup() {

  size(1500, 1000);
  frameRate(60);

  bullets = new ArrayList<Bullet>();

  shiplife = new LifeBar();
  shipshield = new ShieldBar();
  //clear(bullets);

  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus,MX,MY)
  start = new Buttom(width/2-150, height/3, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "START", width/2, height/2.5, 0, 255, 255, 0, 50, 3,  1920/2-50,1080/2);
  config = new Buttom(width/2-150, height/2, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "OPTIONS", width/2, height/1.77, 255, 255, 0, 0, 50, 2,  1920/2,0);
  exit = new Buttom(width/2-150, height/1.5, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "EXIT", width/2, height/1.37, 255, 0, 0, 0, 50, 1,  1920/2,1080/2+100);








  yes = new Buttom(width/2-70*2, height/2+35, 70, 70, 12, #ff0000, 0, 10, #808080, 0, 133, "YES", width/2-104, height/2+95, 255, 0, 0, 0, 35, 11,  1920/2-75,1080/2+75);
  no = new Buttom(width/2+70, height/2+35, 70, 70, 12, #0DFF00, 0, 10, #808080, 0, 133, "NO", width/2+104, height/2+95, 0, 255, 0, 0, 35, 0,  1920/2,1080/2-300);

  this.awakestar();


  shi = loadImage("ShipI.png");
  shi2 = loadImage("ShipII.png");
  shi3 = loadImage("ShipIII.png");

  SC = loadImage("Logo.png");
  space = loadImage("Space.png");
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
    this.scrollspace(); 

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
    stars[i] = new Stars();
  }
}
void drawstar()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i].caida();
  }
}  
void mainmenu()
{
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
void keyPressed() // echarle un ojo a keyReleased();
{
  toDoKeyPressed();
}
