class SpaceShip {

  int shipStatus = 1;
  int xmouse = width/2;
  float ymouse = height/1.2;
  boolean lockShoot = false;
  boolean ismovR = false;
  boolean ismovL = false;


  SpaceShip()
  {
  }
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

        meteoritos.remove(i);
      } else if (mymeteorito.collition == true)
      {

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
    }
  }

  void keyPressed() {

    //  //shiplife.loselify = true;
    //  //shipshield.loseshieldy = true;
    if (keyPressed)
    {
      if (key == ' ' && lockShoot == false)
      {
        //if (directionY<0) { 
        bullets.add(new Bullet(constrain(xmouse+50, 350, 1150), constrain(ymouse, -100, height-75), bulletWidth));
        lockShoot = true;
        //}
      }
    }

    if (keyPressed && key == CODED)
    {

      if (keyCode == LEFT )
      {
        //if (directionX>0) { 
        xmouse -= 3;
        ismovL =true;
      }
      if (keyCode == RIGHT)
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
