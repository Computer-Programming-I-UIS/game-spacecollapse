int status = 1;

void nave()
{
  float xmouse = constrain(mouseX - 50, 300, 1150);
  float ymouse = mouseY - 16;



  //fill(r, g, b);
  //rect(xmouse+10, ymouse+30, 10, 30);//vida de la nave

  switch (status)
  {
  case 1:
    image(shi,constrain(xmouse,300,1100), ymouse);
    
    break;
  case 2:
  image(shi3,constrain(xmouse,300,1100), ymouse);
     
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
    bullets.add(new Bullet(constrain(mouseX, 350, 1150), mouseY, bulletWidth));
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
  } 
  if (key == 'S'|| key == 's')
  {//
   
    gameStatus = 1;
  }
}
//}
