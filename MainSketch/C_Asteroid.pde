class Asteroid {
  float d = random(0.5, 0.8);

  float i;// rotacion
  float rr = random(-0.1, 0.1);
  float pl = random(-1, 1);

  float life = 40;

  boolean collition = false;

  PVector location;
  PVector velocity;
  PVector last_velocity = new PVector(0, 0);

  float radius;
  float density = 0.0003; // [g/pixel³]
  float mass;
  float e = 1;  // restitution coeficient
  float xmin, xmax;

  Asteroid(float xmin, float xmax, PVector velocity)
  {
    this.location = new PVector(random(xmin, xmax), random(-10, -500));
    this.velocity = velocity;
    //this.ballColor = ballColor;
    this.radius = asteroid.width*d/2;
    // mass = volume * density;
    this.mass = ( (4*PI*pow(this.radius, 3))/3 ) * density;
    this.xmin = xmin;
    this.xmax = xmax;
  }

  void caida() {

    location.add(velocity);
    i = i+rr*pl;//rotacion
    fill(255);
    pushMatrix();

    translate( location.x, location.y);
    rotate(i);
    scale(d);
    if (collition == true)
    {
      image(asteroidDamaged, 0-asteroid.width/2, 0-asteroid.height/2);
    } else
    {

      image(asteroid, 0-asteroid.width/2, 0-asteroid.height/2);
    }

    popMatrix();


    if ( location.y>height+asteroid.height*d/2 && life > 0) {
      location.x = random(xmin, xmax);
      location.y = random(-10, -500);
      velocity.x = random(-1.5, 1.5);
      velocity.y = random(3, 5);
      life = 40;
    }
    if (location.x <= 100 || location.x >= 1400 && life >0) {

      location.y=random(-10, -500);
      velocity.x = random(-1.5, 1.5);
      velocity.y = random(3, 5);
      life = 40;
      //location.y = constrain(random(1500), 300, 1200);
    }
    last_velocity.x = velocity.x;
    last_velocity.y = velocity.y;
  }
  void rebote(Asteroid meteoritoAcercandose) {
    // Mass and velocity from this object
    float m1 = this.mass;
    float v01 = this.last_velocity.x;
    float vIy1 = this.last_velocity.y;
    // Mass and velocity from second object
    float m2 = meteoritoAcercandose.mass;
    float v02 = meteoritoAcercandose.last_velocity.x;
    float vIy2 = meteoritoAcercandose.last_velocity.y;
    //

    // final velocity from this object
    this.velocity.x = ( m1*v01 + m2*v02 - e*m2*(v01-v02) ) / (m1 + m2);
    this.velocity.y = ( m1*vIy1 + m2*vIy2 - e*m2*(vIy1-vIy2) ) / (m1 + m2);
  }

  void shipCollition() {
    //fill(0, 100, 20);
    //rect(location.x, location.y+asteroid.height*d/2, 10, 10);
    //rect(player.xmouse, player.ymouse-50, 10, 10);
    
    if (location.x+asteroid.height*d/2 > player.xmouse && location.x - asteroid.height*d/2 < player.xmouse+105
    && location.y+asteroid.height*d/2 > player.ymouse-50 && location.y -asteroid.height*d/2 < player.ymouse+145)
    {
      print (" ", "romper escudo", " ", " ");
      //stop();
      shipshield.shieldStatus += 1;
      collition =true;
      
      this.velocity.y -= 5;
      //this.velocity.x += 5;
      //considerando destruirlo en vez de redireccionarlos
    }
  }


  int collision(ArrayList<Bullet> theBullets)
  {
    collition = false;
    int cnt = 0;
    for ( Bullet myBullet : theBullets ) {
      if (myBullet.x > location.x-(asteroid.height*d/2) && myBullet.x < location.x+(asteroid.height*d/2) &&
        myBullet.y > location.y-(asteroid.height*d/2.05) && myBullet.y < location.y+(asteroid.height*d/2.05) )
      {
        myBullet.desaparecer = true;
        collition = true;
        life = life - 5;
        this.velocity.y -= 1;
        break;
      } else {

        collition = false;
      }
      cnt++;
    }


    return cnt;
  }
}
