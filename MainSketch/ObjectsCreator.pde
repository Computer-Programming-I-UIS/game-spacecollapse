void createButtoms()
{
  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus,MX,MY)
  start = new Buttom(width/2-150, height/3, 300, 50, 10, #00ffff, 0, 9, #808080, 0, (133), "START", 0, 255, 255, 0, 40, 90,(4),1920/2+100, 1080/2+100, 0, 0);
  config = new Buttom(width/2-150, height/3+100, 300, 50, 10, #00ffff, 0, 9, #808080, 0, (133), "OPTIONS", 255, 255, 0, 0, 40, 70, (6), 1920/2+100, 1080/2+100, 0, 0.1);
  tutorial = new Buttom(width/2-150, height/3+200, 300, 50, 10, #00ffff, 0, 9, #808080, 0, (133), "TUTORIAL", 200, 255, 0, 0, 40, 60, (5), 1920/2+100, 1080/2+100, 0, 0.1);
  credits = new Buttom(width/2-150, height/3+300, 300, 50, 10, #00ffff, 0, 9, #808080, 0, (133), "CREDITS", 255, 255, 0, 0, 40, 70, (2), 1920/2+100, 1080/2+100, 0, 0.1);
  exit = new Buttom(width/2-150, height/3+400, 300, 50, 10, #00ffff, 0, 9, #808080, 0, (133), "EXIT", 255, 0, 0, 0, 40, 110, (1), 1920/2+100, 1080/2, 0, 0.50);

  yes = new Buttom(width/2-70*2, height/2+35, 70, 40, 10, #ff0000, 0, 8, #808080, 0, 133, "YES", 255, 0, 0, 0, 30, 10, (11), 1920/2-75, 1080/2+75, 0, 0);
  no = new Buttom(width/2+70, height/2+35, 70, 40, 10, #0DFF00, 0, 8, #808080, 0, 133, "NO", 0, 255, 0, 0, 30, 12, (0), 1920/2, 1080/2-300, 0, 0);
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
  createAsteroids();
  genAsteroids = true;
}
void createAsteroids()
{
  for (int i = 0; i < numAsteroids; i++) {
    //rock[i] = new Asteroids();
    //1-190
    int rango = (1880-620)/numAsteroids;
    // meteoritos.add(new Asteroid((i*rango)+310+80, ((i+1)*rango)- 80 + 310, new PVector(random(-1.5, 1.5), random(5, 8))));//llamando el constructor
    meteoritos.add(new  Asteroid((i*rango)+310+80, ((i+1)*rango)- 80 + 310, new PVector(random(-1.5, 1.5), random(2, 5))));//llamando el constructor
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

  //cuadros negros
  fill(0);
  rect(0, 0, 310, height);
  rect(1190, 0, 310, height);
}  
