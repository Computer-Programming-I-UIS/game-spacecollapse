class SpaceShip {
  //Atributos
  PImage shi = loadImage("ShipI.png");
  PImage shi2 = loadImage("ShipII.png");
  PImage shi3 = loadImage("ShipIII.png");

  PImage[] exp = new PImage[3];

  int shipStatus = 1;
  int xmouse = width/2;
  float ymouse = height/1.2;

  Boolean isDead = false;
  boolean lockShoot = false;
  Boolean lockMouse = false;
  boolean ismovR = false;
  boolean ismovL = false;

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
    shiplife.lifebar();

    switch (shipStatus)
    {
    case 1:

      shipshield.shieldbar();
      shipshield.ShieldRange();

      image(shi, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));

      break;
    case 2:

      image(shi3, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));

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
        image( exp[frameFx], shiplife.deadx, shiplife.deady );
      }
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
  void keyReleased()
  {

    lockShoot = false;
    ismovR = false;
    ismovL = false;
  }
}
