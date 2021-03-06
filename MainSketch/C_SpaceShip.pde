class SpaceShip {
  //Atributos
  PImage shi = loadImage("data/player/ShipI.png");
  PImage shi2 = loadImage("data/player/ShipII.png");
  PImage shi3 = loadImage("data/player/ShipIII.png");

  PImage shield1 = loadImage("data/player/Shield1.png");
  PImage shield2 = loadImage("data/player/Shield2.png");
  PImage shield3 = loadImage("data/player/Shield3.png");
  PImage shield4 = loadImage("data/player/Shield4.png");
  PImage shield5 = loadImage("data/player/Shield5.png");

  PImage spritesheet = loadImage("data/sprites/ShipDestroy.png");
  PImage spritesheetAster = loadImage("data/sprites/AsteroidDestroy.png");

  int DIM = 8;
  int W = spritesheet.width/DIM;
  int H = spritesheet.height/DIM;

  int DIMA = 8;
  int WA = spritesheetAster.width/DIMA;
  int HA = spritesheetAster.height/DIMA;

  float lugarx;
  float lugary;

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

  int frameDuration = frameCount;

  Boolean isDead = false;
  Boolean isDeadA = false;
  Boolean myColl = false;
  boolean lockShoot = false;
  Boolean lockMouse = false;
  boolean ismovR = false;
  boolean ismovL = false;
  Boolean loseshieldy = false;


  PImage [] sprites = new PImage[DIM*DIM];
  PImage [] spritesAster = new PImage[DIMA*DIMA];


  //Constructor
  SpaceShip()
  {

    for (int i=0; i<sprites.length; i++) {
      int x = i%DIM*W;
      int y = i/DIM*H;
      sprites[i] = spritesheet.get(x, y, W, H);
    }

    for (int f=0; f<spritesAster.length; f++) {
      int a = f%DIMA*WA;
      int b = f/DIMA*HA;
      spritesAster[f] = spritesheetAster.get(a, b, WA, HA);
    }
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
      if (mymeteorito.collition == true && mymeteorito.life <= 0 || mymeteorito.life <= 0  )
      {

        // bullets.remove(colitionBulletIndex);
        isDeadA = true;
        lugarx = mymeteorito.location.x;
        lugary = mymeteorito.location.y;
        println("lugary =" + (lugary));
        println("lugarx =" + (lugarx));

        meteoritos.remove(i);
        playerScore++;
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
            mymeteorito.life -= 5;
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


      AsteroidExplotion();

      break;
    case 2:

      if (myColl == false)
      {
        image(shi3, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));
        AsteroidExplotion();
      } else
      {
        AsteroidExplotion();
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
        inGame.rewind();
        if (frameCount %20 == 0)
        {
          frameFx = (frameFx+1)%20;
        }

        // scale(0.3);

        image(sprites[frameCount%sprites.length], deadx-(50), deady-(50));
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
        noCursor();
        reset();
        gameStatus = 3;
        window.change = true;
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
    shipStatus = 1;
    xmouse = width/2;
    ymouse = height/1.2;
    shipLife = 50;

    r=0;
    g = 255;
    b =0;
    h = -30;

    r2 = 0;
    g2 = 0;
    b2 = 255;
    h1 = 120;
    w1 = 80;
    time = 0;
    playerScore = 0;
    shieldStatus = 0;
    numAsteroids = 5;
    cnt = 0;
    frameFxA = 0;

    window.counterSkip = 0;
    window.wave = 1;


    isDead = false;
    isDeadA = false;
    myColl = false;
    lockShoot = false;
    lockMouse = false;
    ismovR = false;
    ismovL = false;
    loseshieldy = false;
  }
  void AsteroidExplotion()
  {
    if (isDeadA == true)
    {  
      image(spritesAster[frameCount*2%spritesAster.length], lugarx-(110), lugary-(110));
      frameFxA++;
      println("frame = " + (frameFxA));
    } 
    if (frameFxA >= 30)
    {
      println("NOFRAME = " + (frameFxA));
      frameFxA=0;
      isDeadA = false;
    }
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
        shoot.play();
        if ( shoot.isPlaying() == true)
        {
          shoot.rewind();
        }
        if (inGame.isPlaying() != true)
        {
          inGame.rewind();
        }
      }
       if (key == 'P'||key == 'p' && lockMouse == false)
      {
       window.change = true;
       gameStatus = 10;
      }
      if (keyPressed && key == CODED)
      {

        if (keyCode == LEFT &&  lockMouse == false )
        {
          //if (directionX>0) { 
          xmouse -= 3;
          ismovL =true;
          move.play();
        }
        if (keyCode == RIGHT &&  lockMouse == false)
        {
          //if (directionX<0) { 
          move.play();

          xmouse += 3;
          ismovR = true;
          //}
        }  
        xmouse = constrain(xmouse, 300, 1200-shi.width);
        ymouse = constrain(ymouse, 0, height);
      }
    }
  }


  void shipExplotion()
  {
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
    move.rewind();
    ismovR = false;
    ismovL = false;
  }
}
