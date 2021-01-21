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
    if (y > height -w/2)
    {
      speed *= -0.95;
      y =   height-w/2;
    }
  }
  void display()
  {
    fill(0, 255, +life);
    noStroke();
    ellipse(x, y, w, w);
  }

  Boolean finished()
  {
    life--;
    if (life<0)
    {
      return true;
    } else
    {
      return false;
    }
  }
}
