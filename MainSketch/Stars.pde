class Stars {
  float d;
  float nd = d;
  float sx = constrain(random(1500), 300, 1200);
  float y = random(height);
  float b;
  float g;

  void caida() {
    y = y + 5 ;   //VELOCIDAD
    fill(255);
    ellipse(sx, y, d, d);
    d = random(5);

    if (y>height) {
      sx = constrain(random(1500), 300, 1200);
      y = random(-100);
      d = random(10);
    }
    if (sx <= 300 || sx >= 1200) {
     
      sx = constrain(random(1500), 300, 1200);
      d = random(10);
    }
     if(xmouse <= 600)
      {// genera el efecto de movimiento
      sx = sx+1.5;
     }
     else
     {
       sx = sx+0.1;
     }
     if(xmouse >= 880)
      {
      sx = sx-1.5;
     }
     else
     {
       sx = sx-0.1;
     }
  }
}
