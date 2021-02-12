int status = 1;

void nave()
{
  for (int i = bullets.size()-1; i >= 0; i--)
  {
    Bullet bullet = bullets.get(i);
   // print("              ", bullets.size(), "                         ");
    bullet.move();
    bullet.display();
    if (bullet.finished())
    {
      bullets.remove(i);
    }
  }
  for (int i = meteoritos.size()-1; i >= 0; i--)
  {
    Asteroid mymeteorito = meteoritos.get(i);
    print("              ", meteoritos.size(), "                         ");
    mymeteorito.collision(bullets);
    if (mymeteorito.collition == true)
    {
      meteoritos.remove(i);
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
