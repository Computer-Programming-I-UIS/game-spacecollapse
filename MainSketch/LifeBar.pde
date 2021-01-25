class LifeBar
{
  int r;
  int g = 255;
  int b;

  Boolean loselify = false;

  void lifebar()
  {    
    fill(r, g, b);
    rect(constrain(xmouse+45, 300, 1145), ymouse+35, 10, 30);//vida de la nave

    if (loselify == true)
    {
      r = r+10;
      g--;
    }
  }
}

class ShieldBar extends LifeBar
{
  int r;
  int g;
  int b = 255;

  Boolean loseshieldy = false;

  void shieldbar()
  {    
    fill(r, g, b);
    noStroke();
    ellipse(constrain(xmouse+33.3, 300, 1134), ymouse+30.2, 8.5, 8.5);//escudo de la nave
    ellipse(constrain(xmouse+66.3, 300,1167), ymouse+30.2, 8, 8);//escudo de la nave

    ellipse(constrain(xmouse+34.9, 300, 1135), ymouse+22.1, 3.9, 3.9);
    ellipse(constrain(xmouse+65.9, 300, 1165), ymouse+22.1, 3.9, 3.9);

    ellipse(constrain(xmouse+26.5, 300, 1126), ymouse+70.5, 7.5, 7.5);//escudo de la nave
    ellipse(constrain(xmouse+74.5, 300, 1175), ymouse+70.5, 7.5, 7.5);//escudo de la nave

    if (loseshieldy == true)
    {
      g = g+10;
      b--;
    }
  }
}
