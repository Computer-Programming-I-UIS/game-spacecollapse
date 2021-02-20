int nstars = 30;//estrellas con efectos
int nstars2 = 5;
int nbstars = 2;//estrellas grandes sin efectos(temporal)
int normstars = 5;//estrellas normales sin efectos(temporal)
int numAsteroids = 5;// 5


StarPlus[] stars = new StarPlus [nstars];
StarBig[] starsbig = new StarBig[nbstars];
StarNorm[] starsnorm = new StarNorm[normstars];
StarPlus[] stars2 = new StarPlus [nstars2];

abstract class Star {
  float d;
  color starFill;
  float sx = constrain(random(1500), 300, 1200);
  float y = random(height);
  float b;
  float g;

  float min1;
  float min2;
  float max1;
  float max2;

  Star() {
  }//creamos un constructor vacio

  float value()
  {
    return value();
  }
  void mouseMove()
  {
    if (player.ismovR == true)//usar bool como bandera mejor
    {// genera el efecto de movimiento
      sx = sx+random(min1, max1);
    } else
      if (player.ismovL == true)
      {
        sx = sx-random(min2, max2);
      }
  }
  void caida() {
    y = y + 5 ;   //VELOCIDAD
    fill(starFill);
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
class StarPlus extends Star
{

  StarPlus(color initStarFill, float initMin1, float initMax1 ) {

    starFill = initStarFill;
    min1 = initMin1;
    max1 = initMax1;
    min2 = min1;
    max2 = max1;
  }

  float value()
  {
    fill(starFill);
    float diam = random(2);
    return diam;
  }
}
class StarBig extends Star
{
  StarBig(color initStarFill, float initMin1, float initMax1 ) {

    starFill = initStarFill;
    min1 = initMin1;
    max1 = initMax1;
    min2 = min1;
    max2 = max1;
  }


  float value()
  {
    fill(starFill);
    float diamx = 5;
    return diamx;
  }
}
class StarNorm extends Star
{
  StarNorm(color initStarFill, float initMin1, float initMax1 ) {

    starFill = initStarFill;
    min1 = initMin1;
    max1 = initMax1;
    min2 = min1;
    max2 = max1;
  }

  float value()
  {
    fill(starFill);
    float diamx = 4;
    return diamx;
  }
}
