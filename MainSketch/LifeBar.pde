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
