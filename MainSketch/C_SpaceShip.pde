int status = 1;

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
    //print("              ", meteoritos.size(), "                         ");
    colitionBulletIndex = mymeteorito.collision(bullets);
    if (mymeteorito.collition == true && mymeteorito.life <= 0)
    {
      bullets.remove(colitionBulletIndex);
      meteoritos.remove(i);
    } else if (mymeteorito.collition == true)
    {
      bullets.remove(colitionBulletIndex);
      // noTint();
     //tint(255, 0, 0);
    }
    for (int j = meteoritos.size()-1; j >= 0; j--)
    {
      if (i != j) {
        Asteroid mymeteorito2 = meteoritos.get(j);
        if (dist(mymeteorito.location.x, mymeteorito.location.y, mymeteorito2.location.x, mymeteorito2.location.y) <= mymeteorito.radius + mymeteorito2.radius)
        {
          mymeteorito2.rebote(mymeteorito);
          mymeteorito.collition = true;
          
        }
      }
    }
  }

  if (mousePressed) {
    bullets.add(new Bullet(constrain(mouseX+50, 350, 1150), constrain(mouseY, -100, height-75), bulletWidth));
  }
  shiplife.lifebar();

  switch (status)
  {
  case 1:

    shipshield.shieldbar();
    
    image(shi, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));

    break;
  case 2:

    image(shi3, constrain(xmouse, 300, 1100), constrain(ymouse, -500, height-100));

    break;
  }
}


void toDoKeyPressed() {

  if (key == 'A'|| key == 'a')
  {//
    status = 2;
  } 
  if (key == 'D'|| key == 'd')
  {//
    status = 1;
  } 
  if (key == 'W'|| key == 'w')
  {//
    shiplife.loselify = true;
    shipshield.loseshieldy = true;
  } 
  if (key == 'S'|| key == 's')
  {//

    //gameStatus = 1;
  }
}
