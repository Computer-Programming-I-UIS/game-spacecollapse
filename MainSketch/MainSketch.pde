LifeBar shiplife;

PImage shi;
PImage shi2;
PImage shi3;

PImage space;

ArrayList<Bullet>bullets;

int gameStatus = 0;

float xmouse = mouseX;//constrain(mouseX - 50, 300, 1150);
float ymouse = mouseY;//mouseY - 16;

int bulletWidth = 5;

void setup() {

  size(1500, 1000);

  bullets = new ArrayList<Bullet>();
  shiplife= new LifeBar();

  shi = loadImage("ShipI.png");
  shi2 = loadImage("ShipII.png");
  shi3 = loadImage("ShipIII.png");
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
  if (gameStatus == 0)
  {
  } else
  {
    noCursor();
    this.scrollspace();
    nave();
    xmouse = constrain(mouseX, 300, 1150);
    ymouse = mouseY - 16;
  }
}


//void mousePressed()
//{
//}
void keyPressed() // echarle un ojo a keyReleased();
{
  toDoKeyPressed();
}
