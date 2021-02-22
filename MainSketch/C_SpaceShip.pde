class SpaceShip {
  //Atributos
  PImage shi = loadImage("ShipI.png");
  PImage shi2 = loadImage("ShipII.png");
  PImage shi3 = loadImage("ShipIII.png");

  PImage shield1 = loadImage("Shield1.png");
  PImage shield2 = loadImage("Shield2.png");
  PImage shield3 = loadImage("Shield3.png");
  PImage shield4 = loadImage("Shield4.png");
  PImage shield5 = loadImage("Shield5.png");



  PImage[] exp = new PImage[3];

  int shipStatus = 1;
  int xmouse = width/2;
  float ymouse = height/1.2;
  float deadx, deady;
  int shipLife = 50;

  int r=0;
  int g = 255;
  int b =0;
  int h = -30;

  int r2;
  int g2;
  int b2 = 255;
  int h1 = 120;
  int w1 = 80;
  int time;
  int shieldStatus = 0;
  int cnt = 0;



  Boolean isDead = false;
  Boolean myColl = false;
  boolean lockShoot = false;
  Boolean lockMouse = false;
  boolean ismovR = false;
  boolean ismovL = false;
  Boolean loseshieldy = false;

  //Constructor
  SpaceShip()
  {
    exp[0] = loadImage( "Exp_1.png" );
    exp[1] = loadImage( "Exp_2.png" );
    exp[2] = loadImage( "Exp_3.png" );
  }

  //Metodos
  void nave()
  {
    for (int i = bullets.size()-1; i >= 0; i--)
    {
      Bullet bullet = bullets.get(i);
      // print("              ", bullets.size(), "                         ");
      bullet.move();
      bullet.display();
      bullet.finished(); // Verificando si la bala se salio de la pantalla;
      if (bullet.desaparecer) 
      {
        bullets.remove(i);
      }
    }
    int colitionBulletIndex;
    for (int i = meteoritos.size()-1; i >= 0; i--)
    {
      Asteroid mymeteorito = meteoritos.get(i);
      // print("              ", mymeteorito.life, "                         ");
      colitionBulletIndex = mymeteorito.collision(bullets);
      if (mymeteorito.collition == true && mymeteorito.life <= 0)
      {

        bullets.remove(colitionBulletIndex);
        //window.Fx();
        meteoritos.remove(i);
      } else if (mymeteorito.collition == true)
      {
        shakingmini = true;
        bullets.remove(colitionBulletIndex);
      }

      for (int j = meteoritos.size()-1; j >= 0; j--)
      {
        if (i != j) {
          Asteroid mymeteorito2 = meteoritos.get(j);
          if (dist(mymeteorito.location.x, mymeteorito.location.y, mymeteorito2.location.x, mymeteorito2.location.y) <= mymeteorito.radius + mymeteorito2.radius)
          {
            mymeteorito2.rebote(mymeteorito);
            mymeteorito.life -= 10;
            mymeteorito.collition = true;
            
          }
        }
        mymeteorito.shipCollition();
      }
    }
    lifebar();

    switch (shipStatus)
    {
    case 1:

      shieldbar();
      ShieldRange();

      image(shi, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));

      break;
    case 2:

      if (myColl == false)
      {
        image(shi3, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));
      } else
      {

        tint(255, 0, 0);
        image(shi3, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));
        noTint();
        if (frameCount % 40 ==0)
        {
          myColl = false;
        }
      }



      break;
    default:

      if (isDead == true)
      {
        lockMouse = true;
        if (frameCount %3 == 0)
        {
          frameFx = (frameFx+1)%3;
        }

        // scale(0.3);
        image( exp[frameFx], deadx, deady );
      }
    }
  }

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
      h = -15;
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
        r2 = 0;
        g2 = 255;
        b2 = 214;

        break;

      case 1:
        image(shield2, player.xmouse-50, player.ymouse-50);
        r2 = 0;
        g2 = 255;
        b2 = 0;

        break;

      case 2:
        image(shield3, player.xmouse-50, player.ymouse-50);
        r2 = 251;
        g2 = 255;
        b2 = 0;

        break;

      case 3:
        image(shield4, player.xmouse-50, player.ymouse-50);
        r2 = 255;
        g2 = 173;
        b2 = 0;

        break;
      case 4:
        image(shield5, player.xmouse-50, player.ymouse-50);
        r2 = 255;
        g2 = 0;
        b2 = 0;

        break;
      default:

        player.shipStatus = 2;

        break;
      }
    }
  }
  void shieldbar()
  {    


    fill(r2, g2, b2);
    noStroke();
    //puntos para la barra de vida del escudo
    ellipse(constrain(player.xmouse+33.3, 300, 1134), constrain(player.ymouse+30.2, -500, height-70), 8.5, 8.5);//escudo de la nave
    ellipse(constrain(player.xmouse+66.3, 300, 1167), constrain(player.ymouse+30.2, -500, height-70), 8, 8);//escudo de la nave

    ellipse(constrain(player.xmouse+34.9, 300, 1135), constrain(player.ymouse+22.1, -500, height-78.1), 3.9, 3.9);
    ellipse(constrain(player.xmouse+64.9, 300, 1165), constrain(player.ymouse+22.1, -500, height-78.1), 3.9, 3.9);

    ellipse(constrain(player.xmouse+26.5, 300, 1126), constrain(player.ymouse+70.5, -500, height-30), 7.5, 7.5);//escudo de la nave
    ellipse(constrain(player.xmouse+74.5, 300, 1175), constrain(player.ymouse+70.5, -500, height-30), 7.5, 7.5);//escudo de la nave
  }
  void reset()
  {
  }


  void keyPressed() {

    //  //shiplife.loselify = true;
    //  //shipshield.loseshieldy = true;
    if (keyPressed)
    {
      if (key == ' ' && lockShoot == false && lockMouse == false)
      {
        //if (directionY<0) { 
        bullets.add(new Bullet(constrain(xmouse+50, 350, 1150), constrain(ymouse, -100, height-75), bulletWidth));
        lockShoot = true;
        //}
      }
      // if (key == 'P' && lockMouse == false)
      //{


      //}
    }

    if (keyPressed && key == CODED)
    {

      if (keyCode == LEFT &&  lockMouse == false )
      {
        //if (directionX>0) { 
        xmouse -= 3;
        ismovL =true;
      }
      if (keyCode == RIGHT &&  lockMouse == false)
      {
        //if (directionX<0) {  
        xmouse += 3;
        ismovR = true;
        //}
      }  



      xmouse = constrain(xmouse, 300, 1200-shi.width);
      ymouse = constrain(ymouse, 0, height);
    }
  }
  void soundBoing()
  {

    shieldBoing.play();
    if ( shieldBoing.isPlaying() == true)
    {
      shieldBoing.rewind();
    }
  }


  void keyReleased()
  {

    lockShoot = false;
    ismovR = false;
    ismovL = false;
  }
}
