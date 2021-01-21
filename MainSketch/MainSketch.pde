LifeBar shiplife;
ShieldBar shipshield;

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

      noCursor();
      this.scrollspace();

      this.drawstar();
      nave();

      xmouse = constrain(mouseX, 300, 1150);
      ymouse = mouseY - 16;

      break;
    case 3:
    
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
  background(0);
  image(SC,450,100);
  

}


void keyPressed() // echarle un ojo a keyReleased();
{
  toDoKeyPressed();
}
