class LifeBar
{
  int r;
  int g = 255;
  int b;

  Boolean loselify = false;

  void lifebar()
  {    
    fill(r, g, b);
    rect(constrain(xmouse+45, 300, 1145), constrain(ymouse+35, -500, height-70), 10, 30);//vida de la nave

    if (loselify == true)
    {
      r = r+10;
      g--;
    }
  }
}

class ShieldBar 
{
  int r;
  int g;
  int b = 255;

  Boolean loseshieldy = false;

  void shieldbar()
  {    
    fill(r, g, b);
    noStroke();
    ellipse(constrain(xmouse+33.3, 300, 1134), constrain(ymouse+30.2, -500, height-70), 8.5, 8.5);//escudo de la nave
    ellipse(constrain(xmouse+66.3, 300, 1167), constrain(ymouse+30.2, -500, height-70), 8, 8);//escudo de la nave

    ellipse(constrain(xmouse+34.9, 300, 1135),constrain(ymouse+22.1,-500,height-78.1), 3.9, 3.9);
    ellipse(constrain(xmouse+64.9, 300, 1165),constrain(ymouse+22.1,-500,height-78.1), 3.9, 3.9);

    ellipse(constrain(xmouse+26.5, 300, 1126), constrain(ymouse+70.5,-500,height-30), 7.5, 7.5);//escudo de la nave
    ellipse(constrain(xmouse+74.5, 300, 1175),constrain(ymouse+70.5,-500,height-30), 7.5, 7.5);//escudo de la nave

    if (loseshieldy == true)
    {
      g = g+10;
      b--;
    }
  }
}
