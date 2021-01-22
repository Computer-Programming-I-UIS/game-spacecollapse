class Bullet
{
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;

  Bullet(float initx, float inity, float initw)
  {
    x = initx;
    y = inity;
    w = initw;
    speed = -30 ;
    gravity = 0.2;
  }

  void move()
  {
    
    speed = speed - gravity;
    y = y+speed;

  }
  void display()
  {
    fill(0, 255, +life);
    noStroke();
    ellipse(x, y, w, w);
  }

  Boolean finished()
  {
    life = life -10;
    if (life<0)
    {
      return true;
    } else
    {
      return false;
    }
  }
}
