class Asteroids {
  float d;
  float x;
  float y;
  float i;
  float xd = constrain(random(1500), 300, 1200);
  float yd = random(height);

  void caida() {
    yd = yd+1;
    i = i+0.01;//rotacion
    fill(255);
    pushMatrix();
    translate(xd, yd);
    rotate(0.1 + i);
    image(asteroid, this.x-asteroid.width/2, this.y-asteroid.height/2);
    popMatrix();

    if (yd>height) {
      xd = constrain(random(1500), 300, 1200);
      yd = random(-100);
      d = random(10);
    }
    if (xd <= 300 || xd >= 1200) {

      xd = constrain(random(1500), 300, 1200);
      d = random(10);
    }
  }
}
//class StarsPlus extends Stars
//{
// float value()
// {
//   float diam = random(2);
//   return diam;
// }
//}
//class StarsBig extends Stars
//{
//  float value()
// {
//   float diamx = 5;
//   return diamx;
// }
//}
//class StarsNorm extends Stars
//{
//  float value()
// {
//   float diamx = 4;
//   return diamx;
// }
//}
