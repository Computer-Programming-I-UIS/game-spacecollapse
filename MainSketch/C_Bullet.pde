int bulletWidth = 5;

class Bullet
{
  float x;
  float y;
  
  float speed;
  float w;
  float time;
  boolean desaparecer;


  Bullet(float initx, float inity, float initw)
  {
    x = initx;
    y = inity;
    w = initw;
    speed = random(-1.5, -1);
  }

  void move()
  {
    time =time+0.1;
    speed = speed-time;
    y = y+speed;
  }
  void display()
  {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, w/2, w);
  }

  void finished()
  {
    if (this.y < 0 ) // || 
    {
      desaparecer = true;
        
    } else
    {
      desaparecer = false;
    }
  }
}
