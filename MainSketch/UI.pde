

void mainmenu()
{
  ShowCubes();

  image(SC, width/2-298.5, 100);//width/2-298.5, 100

  start.showbuttom();
  config.showbuttom();
  exit.showbuttom();
}
void options()
{
  image(Credits, 0, 0);
  if (frameCount % 420 == 0)
  {
    gameStatus = 0;
  }
}
void areyousure()
{
  int w = 500;
  int h = 300;

  strokeJoin(ROUND);
  stroke(255, 0, 248);
  strokeWeight(10);
  fill(0);

  rect(width/2-250, height/2.5, w, h);

  textSize(50);
  fill(255, 255, 0);
  textAlign(CENTER, BOTTOM);

  text("ARE YOU SURE?", width/2, height/2);
  //filter( BLUR, 4);

  no.showbuttom();
  yes.showbuttom();
}
void screenLoading ()
{
  if (frameCount %7 == 0)
  {
    frame = (frame+1)%6;
  }
  
  scale(0.3);
  image( load[frame], width*2.8, height*2.5 );

  if (frameCount % 320 == 0)
  {
    gameStatus = 3;
  }
}

int framesShake = 0;
void toShake()
{
  if (shaking == true)
  {
    if (framesShake< 10) {
      shakeScreen();
      framesShake++;
    } else
    {
      framesShake = 0;
      shaking = false;
    }
  }
}
void shakeScreen()
{
  println("shaking");

  translate(random(-5, 5), random(-5, 5));
}
