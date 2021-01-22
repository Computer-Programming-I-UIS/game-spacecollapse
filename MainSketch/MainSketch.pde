LifeBar shiplife;
ShieldBar shipshield;

Buttom start;
ButtomConfig config;
ButtomExit exit;
ButtomYes yes;
ButtomNo no;

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

  bullets = new ArrayList<Bullet>();

  shiplife = new LifeBar();
  shipshield = new ShieldBar();

  start = new Buttom();
  config = new ButtomConfig();
  exit = new ButtomExit();


  yes = new ButtomYes();
  no = new ButtomNo();


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

    mainmenu();

    break;
  case 1:

    areyousure();


    break;
  case 2:

    break;

  case 3:

    noCursor();
    this.scrollspace();

    this.drawstar();
    nave();

    xmouse = constrain(mouseX, 300, 1150);
    ymouse = mouseY - 16;

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
  image(SC, 450, 100);//logo

  start.showbuttom();
  config.showbuttom();
  exit.showbuttom();
}
void areyousure()
{

  int w = 500;
  int h = 300;

  strokeJoin(ROUND);
  stroke(255, 0, 248);
  strokeWeight(10);
  fill(0);

  

  rect(width/2-w/2, height/2.5, w, h);
  
  no.showbuttom();
  yes.showbuttom();
  //filter( BLUR, 8 );
}


void keyPressed() // echarle un ojo a keyReleased();
{
  toDoKeyPressed();
}
