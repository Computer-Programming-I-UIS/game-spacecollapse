class LifeBar
{
  int r;
  int g = 255;
  int b;

  Boolean loselify = false;

  void lifebar()
  {    
    fill(r, g, b);
    rect(constrain(player.xmouse+45, 300, 1145), constrain(player.ymouse+35, -500, height-70), 10, 30);//vida de la nave

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
  int h = 120;
  int w = 80;
  int time;
  
   
  
  Boolean loseshieldy = false;


  void ShieldRange()
  {
      image(shield1, player.xmouse-50, player.ymouse-50);
  }
  void shieldbar()
  {    


    fill(r, g, b);
    noStroke();
    ellipse(constrain(player.xmouse+33.3, 300, 1134), constrain(player.ymouse+30.2, -500, height-70), 8.5, 8.5);//escudo de la nave
    ellipse(constrain(player.xmouse+66.3, 300, 1167), constrain(player.ymouse+30.2, -500, height-70), 8, 8);//escudo de la nave

    ellipse(constrain(player.xmouse+34.9, 300, 1135), constrain(player.ymouse+22.1, -500, height-78.1), 3.9, 3.9);
    ellipse(constrain(player.xmouse+64.9, 300, 1165), constrain(player.ymouse+22.1, -500, height-78.1), 3.9, 3.9);

    ellipse(constrain(player.xmouse+26.5, 300, 1126), constrain(player.ymouse+70.5, -500, height-30), 7.5, 7.5);//escudo de la nave
    ellipse(constrain(player.xmouse+74.5, 300, 1175), constrain(player.ymouse+70.5, -500, height-30), 7.5, 7.5);//escudo de la nave




    if (loseshieldy == true)
    {
      g = g+10;
      b--;
    }
  }
}
