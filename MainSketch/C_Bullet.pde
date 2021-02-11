class Bullet
{
  float x;
  float y;
  float speed;
  float w;
  float time;
 

  Bullet(float initx, float inity, float initw)
  {
    x = initx;
    y = inity;
    w = initw;
    speed = -50 ;
  }

  void move()
  {
    time =time+1;
    speed = speed-time;
    y = y+speed;
  }
  void display()
  {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, w, w);
  }

  Boolean finished()
  {
    if (this.y < 0)
    {
      return true;
    } else
    {
      return false;
    }
  }
}
