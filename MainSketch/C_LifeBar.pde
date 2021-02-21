class LifeBar
{
  int r;
  int g = 255;
  int b;

  float deadx, deady;

  int h = -30;

  int shipLife = 50;

  void lifebar()
  { 
    if (player.isDead == false) {
      fill(150);
      rect(constrain(player.xmouse+45, 300, 1145), constrain(player.ymouse+62, -500, height-70), 10, -30);
      fill(r, g, b);
      rect(constrain(player.xmouse+45, 300, 1145), constrain(player.ymouse+62, -500, height-70), 10, h);//vida de la nave
    }
    if (shipLife >= 50)
    {
      r=0;
      g=255;
      b = 0;
      h = -25;
    }
    if (shipLife <= 40)
    {
      r=248;
      g=255;
      b = 0;
      h = -20;
    }
    if (shipLife <= 30)
    {
      r=248;
      g=255;
      b = 0;
      h = -20;
    }
    if (shipLife <= 20)
    {
      r=255;
      g=161;
      b = 0;
      h = -10;
    }
    if (shipLife <= 10)
    {
      r=255;
      g=161;
      b = 0;
      h = -5;
    }
    if (shipLife <= 0)
    {

      h = -1;
      r=255;
      g = 0;
      b = 0;
      deadx = player.xmouse;
      deady = player.ymouse;
      player.shipStatus++;
      player.isDead = true;
      
      if (frameCount % 100 == 0)
      {
        cursor();
        gameStatus = 0;
      }
    }
  }
}
