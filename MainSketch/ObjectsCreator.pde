void createButtoms()
{
  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus,MX,MY)
  start = new Buttom(width/2-150, height/3, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "START", width/2, height/2.5, 0, 255, 255, 0, 50, (4), 1920/2+100, 1080/2+100, 0, 0);
  config = new Buttom(width/2-150, height/2, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "CREDITS", width/2, height/1.77, 255, 255, 0, 0, 50, (2), 1920/2+100, 1080/2+100, 0, 0.1);
  exit = new Buttom(width/2-150, height/1.5, 300, 70, 12, #00ffff, 0, 10, #808080, 0, (133), "EXIT", width/2, height/1.37, 255, 0, 0, 0, 50, 1, 1920/2+100, 1080/2, 0, 0.50);

  yes = new Buttom(width/2-70*2, height/2+35, 70, 70, 12, #ff0000, 0, 10, #808080, 0, 133, "YES", width/2-104, height/2+95, 255, 0, 0, 0, 35, 11, 1920/2-75, 1080/2+75, 0, 0);
  no = new Buttom(width/2+70, height/2+35, 70, 70, 12, #0DFF00, 0, 10, #808080, 0, 133, "NO", width/2+104, height/2+95, 0, 255, 0, 0, 35, 0, 1920/2, 1080/2-300, 0, 0);
}

void awakeStars()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new StarPlus(color(255, 255, 255), 1.2, 1.5);
  }
  for (int i = 0; i < stars2.length; i++)
  {
    stars2[i] = new StarPlus(color(random(240, 255), 232, 0), 1.1, 1.6);
  }

  for (int i = 0; i < starsbig.length; i++) {
    starsbig[i] = new StarBig(color(255, 255, 255), 1.2, 1.3);
  }

  for (int i = 0; i < starsnorm.length; i++) {
    starsnorm[i] = new StarNorm(color(255, 255, 255), 0.9, 1.2 );
  }
  for (int i = 0; i < numAsteroids; i++) {
    //rock[i] = new Asteroids();
    int rango = (1200-300)/numAsteroids;
    meteoritos.add(new Asteroid((i*rango)+300+80, ((i+1)*rango)- 80 + 300, new PVector(random(-1.5, 1.5), random(3, 5))));//llamando el constructor
    /*
    (new PVector(random((i*rango)+300,(i+1)*rango + 300)
     */
  }
}

void drawStars()
{
  for (int i = 0; i < stars.length; i++) {
    stars[i].caida();
    stars[i].mouseMove();
  }
  for (int i = 0; i < stars2.length; i++) {

    stars2[i].caida();
    stars2[i].mouseMove();
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
    //tint(255,0,0);
    rock.caida();
   // noTint();
  }
  noStroke();
  fill(0);
  rect(0, 0, 310, height);
  rect(1190, 0, 310, height);
}  
