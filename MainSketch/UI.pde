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
