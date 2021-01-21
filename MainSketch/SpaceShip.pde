int status = 1;

void nave()
{
  //fill(r, g, b);

  shiplife.lifebar();

  switch (status)
  {
  case 1:

    shipshield.shieldbar();
    image(shi, constrain(xmouse, 300, 1100), ymouse);


    break;
  case 2:
    image(shi3, constrain(xmouse, 300, 1100), ymouse);

    break;
  }

  for (int i = bullets.size()-1; i >= 0; i--)
  {
    Bullet bullet = bullets.get(i);
    bullet.move();
    bullet.display();
    if (bullet.finished())
    {
      bullets.remove(i);
    }
  }
  if (mousePressed) {
    bullets.add(new Bullet(constrain(mouseX+50, 350, 1150), mouseY, bulletWidth));
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

    gameStatus = 1;
  }
}
