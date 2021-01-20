PImage shi;
PImage shi2;
PImage shi3;

PImage space;

ArrayList<Bullet>bullets;
int bulletWidth = 5;

void setup() {

  size(1500, 1000);
  
  bullets = new ArrayList<Bullet>();
  shi = loadImage("ShipI.png");
  shi2 = loadImage("ShipII.png");
  shi3 = loadImage("ShipIII.png");
  space = loadImage("Space.png");
}
void draw() 
{


  noCursor();
  background(0);
  this.scrollspace();
  nave();
  
  
  
}
void scrollspace()
{
  int x = frameCount*3 % space.width;

  for (int i = -x; i < width; i += space.width) {
    copy(space, 0, 0, space.width, height, 300, -i, space.width, height);
  }
}


//void mousePressed()
//{
//}
void keyPressed() // echarle un ojo a keyReleased();
{
  toDoKeyPressed();
}
