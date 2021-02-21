
class ShieldBar 
{

  PImage shield1 = loadImage("Shield1.png");
  PImage shield2 = loadImage("Shield2.png");
  PImage shield3 = loadImage("Shield3.png");
  PImage shield4 = loadImage("Shield4.png");
  PImage shield5 = loadImage("Shield5.png");

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
    //for debug shields
    //fill(0,255,0,50);
    //ellipse(player.xmouse+50, player.ymouse+50, 110, 150);

    if (frameCount % 5 == 0)
      cnt ++;
    //    image(shield1, player.xmouse-50, player.ymouse-50);
    if (cnt == 0 || cnt == 4 || cnt == 8 || cnt == 10 || cnt == 12) {
      switch(shieldStatus)
      {
      case 0:

        image(shield1, player.xmouse-50, player.ymouse-50);
        r = 0;
        g = 255;
        b = 214;

        break;

      case 1:
        image(shield2, player.xmouse-50, player.ymouse-50);
        r = 0;
        g = 255;
        b = 0;

        break;

      case 2:
        image(shield3, player.xmouse-50, player.ymouse-50);
        r = 251;
        g = 255;
        b = 0;

        break;

      case 3:
        image(shield4, player.xmouse-50, player.ymouse-50);
        r = 255;
        g = 173;
        b = 0;

        break;
      case 4:
        image(shield5, player.xmouse-50, player.ymouse-50);
        r = 255;
        g = 0;
        b = 0;

        break;
      default:

        player.shipStatus = 2;

        break;
      }
    }
  }
  void shieldbar()
  {    


    fill(r, g, b);
    noStroke();
    //puntos para la barra de vida del escudo
    ellipse(constrain(player.xmouse+33.3, 300, 1134), constrain(player.ymouse+30.2, -500, height-70), 8.5, 8.5);//escudo de la nave
    ellipse(constrain(player.xmouse+66.3, 300, 1167), constrain(player.ymouse+30.2, -500, height-70), 8, 8);//escudo de la nave

    ellipse(constrain(player.xmouse+34.9, 300, 1135), constrain(player.ymouse+22.1, -500, height-78.1), 3.9, 3.9);
    ellipse(constrain(player.xmouse+64.9, 300, 1165), constrain(player.ymouse+22.1, -500, height-78.1), 3.9, 3.9);

    ellipse(constrain(player.xmouse+26.5, 300, 1126), constrain(player.ymouse+70.5, -500, height-30), 7.5, 7.5);//escudo de la nave
    ellipse(constrain(player.xmouse+74.5, 300, 1175), constrain(player.ymouse+70.5, -500, height-30), 7.5, 7.5);//escudo de la nave
  }
}
