abstract class Star {
  float d;
  float sx = constrain(random(1500), 300, 1200);
  float y = random(height);
  float b;
  float g;

  Star() {
  }//creamos un constructor vacio
  
  float value()
  {
    return value();
  }
  void mouseMove()
  {
    //if (xmouse <= 600)
    //{// genera el efecto de movimiento
    //  sx = sx+1.5;
    //} else
    //{
    //  sx = sx+0.1;
    //}
    //if (xmouse >= 880)
    //{
    //  sx = sx-1.5;
    //} else
    //{
    //  sx = sx-0.1;
    //}
  }
  void caida() {
    y = y + 5 ;   //VELOCIDAD
    fill(255);
    ellipse(this.sx, this.y, this.d, this.d);
    d = value();

    if (y>height) {
      sx = constrain(random(1500), 300, 1200);
      y = random(-100);
      d = random(10);
    }
    if (sx <= 300 || sx >= 1200) {

      sx = constrain(random(1500), 300, 1200);
      d = random(10);
    }
  }
}
class StarsPlus extends Star
{
 float value()
 {
   float diam = random(2);
   return diam;
 }
}
class StarsBig extends Star
{
  float value()
 {
   float diamx = 5;
   return diamx;
 }
}
class StarsNorm extends Star
{
  float value()
 {
   float diamx = 4;
   return diamx;
 }
}
