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
  int shieldStatus = 0;
  int cnt = 0;



  Boolean loseshieldy = false;


  void ShieldRange()
  {  
    //fill(0,255,0,150);
    //ellipse(player.xmouse+50, player.ymouse+50,140,190);    
    if (frameCount % 5 == 0)
      cnt ++;
    //    image(shield1, player.xmouse-50, player.ymouse-50);
    if (cnt == 0 || cnt == 4 || cnt == 8 || cnt == 10 || cnt == 12) {
      switch(shieldStatus)
      {
      case 0:

        image(shield1, player.xmouse-50, player.ymouse-50);

        break;

      case 1:
        image(shield2, player.xmouse-50, player.ymouse-50);
        break;

      case 2:
        image(shield3, player.xmouse-50, player.ymouse-50);
        break;

      case 3:
        image(shield4, player.xmouse-50, player.ymouse-50);
        break;
      case 4:
        image(shield5, player.xmouse-50, player.ymouse-50);
        break;
      }
    }
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
