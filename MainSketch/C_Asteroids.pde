class Asteroid {
  float d = random(0.5, 0.8);

  float x;
  float y;
  float i;// rotacion
  float rr = random(-0.1, 0.1);
  float pl = random(-1, 1);
  float vel= 3;
  float xd = constrain(random(1500), 300, 1200);
  float yd = constrain(random(height), -100, -300);

  void caida() {


    yd = yd+vel;//velocidad
    i = i+rr*pl;//rotacion
    fill(255);
    pushMatrix();

    translate(xd, yd);
    rotate(i);
    scale(d);
    image(asteroid, this.x-asteroid.width/2, this.y-asteroid.height/2);
    popMatrix();

    if (i >= 1)
    {
      this.vel = 8 ;
    } else
    {
      this.vel = 5;
    }
    // println(asteroid.height*d);

    if (yd>height+asteroid.height) {
      xd = constrain(random(1500), 300, 1200);
      yd = random(-250);
    }
    if (xd <= 300 || xd >= 1200) {

      xd = constrain(random(1500), 300, 1200);
    }
  }
  void collision(ArrayList<Bullet> theBullets)
  {
  
    for ( Bullet myBullet : theBullets ) {
      //if (myBullet.y  < yd+asteroid.height*d  && myBullet.y  > yd+asteroid.height*d  && myBullet.x > xd+asteroid.height*d && myBullet.x < xd-asteroid.height*d )
      //{
      //    println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      //}
      if (myBullet.x > xd-(height*d)/8 && myBullet.x < xd+(height*d)/8 )
      {
        //meteoritos.remove();
        numAsteroids= numAsteroids-1;
        
        meteoritos.remove(numAsteroids);
      }
    }
  }
}
// void collision(ArrayList<Bullet> theBullets)
//{
//  int i = 1;
//  for ( Bullet myBullet : theBullets ) {
//    // if(posx)
//    println(myBullet.y);
//    i++;
//  }
//  if (i > 1) {
//    println(" ");
//    println(" ");
//    println(" ");
//    i ++;
//  }

//  /*/*
//   if(bullets.get() )
//   {



//   }
//   */
//}
//}
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
