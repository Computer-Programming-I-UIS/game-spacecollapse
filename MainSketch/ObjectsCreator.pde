void createButtoms()
{
  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus,MX,MY)
  start = new Buttom(width/2-150, height/3, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "START", width/2, height/2.5, 0, 255, 255, 0, 50, 3, 1920/2-50, 1080/2, 0, 0);
  config = new Buttom(width/2-150, height/2, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "OPTIONS", width/2, height/1.77, 255, 255, 0, 0, 50, 2, 1920/2, 0, 0, 0.1);
  exit = new Buttom(width/2-150, height/1.5, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "EXIT", width/2, height/1.37, 255, 0, 0, 0, 50, 1, 1920/2+100, 1080/2+100, 0, 0.50);

  yes = new Buttom(width/2-70*2, height/2+35, 70, 70, 12, #ff0000, 0, 10, #808080, 0, 133, "YES", width/2-104, height/2+95, 255, 0, 0, 0, 35, 11, 1920/2-75, 1080/2+75, 0, 0);
  no = new Buttom(width/2+70, height/2+35, 70, 70, 12, #0DFF00, 0, 10, #808080, 0, 133, "NO", width/2+104, height/2+95, 0, 255, 0, 0, 35, 0, 1920/2, 1080/2-300, 0, 0);
}
void awakeStars()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new StarsPlus();
  }

  for (int i = 0; i < starsbig.length; i++) {
    starsbig[i] = new StarsBig();
  }

  for (int i = 0; i < starsnorm.length; i++) {
    starsnorm[i] = new StarsNorm();
  }
  for (int i = 0; i < numAsteroids; i++) {
    //rock[i] = new Asteroids();
    meteoritos.add(new Asteroid());//llamando el constructor (colocar argumentos del constructor)
  }
}

void drawStars()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i].caida();
    //stars[i].mouseMove();
  }
  for (int i = 0; i < starsnorm.length; i++) {
    starsnorm[i].caida();
    starsnorm[i].mouseMove();
  }
  for (int i = 0; i < starsbig.length; i++) {
    starsbig[i].caida();
    starsbig[i].mouseMove();
  }
  for (Asteroid rock : meteoritos) {
    rock.caida();
   
  }
}  
