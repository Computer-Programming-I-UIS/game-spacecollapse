class Asteroid {
  float d = random(0.5, 0.8);

  float i;// rotacion
  float rr = random(-0.1, 0.1);
  float pl = random(-1, 1);
  float vel= 3;
  PVector velocidad;
  float xd = constrain(random(1500), 300, 1200);
  float yd = random(height*-1, 0 );
  boolean collition = false;
  float masa;
  float r;

  Asteroid(  )
  {

    velocidad = new PVector(random(-1.5, 1.5), random(2, 5));
    masa = 2*asteroid.width;
    r = asteroid.width*d/2;
}



  void caida() {


    yd = yd+velocidad.y;//velocidad
    xd = xd+velocidad.x;//velocidad
    i = i+rr*pl;//rotacion
    fill(255);
    pushMatrix();

    translate(xd, yd);
    rotate(i);
    scale(d);
    image(asteroid, 0-asteroid.width/2, 0-asteroid.height/2);
    popMatrix();

    //if (i >= 1)
    //{
    //  this.vel = 8 ;
    //} else
    //{
    //  this.vel = 5;
    //}
    // println(asteroid.height*d);

    if (yd>height+asteroid.height*d/2) {
      xd = random(300, 1200);
      yd = random(-250);
    }
    if (xd <= 100 || xd >= 1400) {

      yd=random(-250);
      //xd = constrain(random(1500), 300, 1200);
    }
  }
  void rebote(Asteroid meteoritoAcercandose) {

    float v2_inicial = this.velocidad.x;
    float v1_inicial = meteoritoAcercandose.velocidad.x;
    float m1 = meteoritoAcercandose.masa;
    float m2 = this.masa;

    float dv = v2_inicial - v1_inicial;
    float E1 = pow(v1_inicial, 2)*m1/2;
    float E2 = pow(v2_inicial, 2)*m2/2;
    float Et = E1+E2;

    float a = m1/2;
    float b = (m1*dv) + (m2/2);
    float c = (m1*pow(dv, 2)/2) - Et;

    float V2_final_1 = ( -b + sqrt( pow(b, 2) - (4*a*c) ) ) / (2*a);
    //float V1_final_1 = dv + V2_final_1;


    this.velocidad.x = V2_final_1*0.3;
  }



  int collision(ArrayList<Bullet> theBullets)
  {
    collition = false;
    int cnt = 0;
    for ( Bullet myBullet : theBullets ) {
      if (myBullet.x > xd-(asteroid.height*d/2) && myBullet.x < xd+(asteroid.height*d/2) &&
        myBullet.y > yd-(asteroid.height*d/2.05) && myBullet.y < yd+(asteroid.height*d/2.05) )
      {
        //xd = constrain(random(1500), 300, 1200);
        //yd = random(-550, -200);
        myBullet.desaparecer = true;
        collition = true;
        break;
      } else {

        collition = false;
      }
      cnt++;
    }


    return cnt;
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
