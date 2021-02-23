class Asteroid {
  float d = random(0.3, 0.5);

  float i;// rotacion
  float rr = random(-0.1, 0.1);
  float pl = random(-1, 1);

  float life = 10;

  PImage asteroid = loadImage("Asteroid.png");
  PImage asteroidDamaged = loadImage("Asteroid_Damaged.png");

  boolean collition = false;


  PVector location;
  PVector velocity;
  PVector last_velocity = new PVector(0, 0);

  float radius;
  float density = 0.0003; // [g/pixel³]
  float mass;
  float e = 1;  // restitution coeficient
  float xmin, xmax;

  int numColition = 0;

  Asteroid(float xmin, float xmax, PVector velocity)
  {
    this.location = new PVector(random(xmin, xmax), random(-1000, -500));
    this.velocity = velocity;
    //this.ballColor = ballColor;
    this.radius = asteroid.width*d/2;
    // mass = volume * density;
    this.mass = ( (4*PI*pow(this.radius, 3))/3 ) * density;
    this.xmin = xmin;
    this.xmax = xmax;
  }

  void reset() {
    this.location = new PVector(random(xmin, xmax), random(-1000, -500));
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



    if ( location.y>height+asteroid.height*d/2 && life >= 0  || location.y < 0-2*asteroid.height*d/2 && velocity.y <= -1 || player.isDead == true ) {
      location.x = random(xmin, xmax);
      location.y = random(-1000, -500);
      velocity.x = random(-1, 1);
      velocity.y = random(1, 2);
      life = 40;
    }
    if (location.x <= 310 || location.x >= 1190 || player.isDead == true) {

      //location.x = random(xmin, xmax);
      location.y=random(-1000, -500);
      velocity.x = random(-1, 1);
      velocity.y = random(1, 2);
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

    hit.play();
    if ( hit.isPlaying() == true)
    {
      hit.rewind();
    }
    // final velocity from this object
    this.velocity.x = ( m1*v01 + m2*v02 - e*m2*(v01-v02) ) / (m1 + m2);
    this.velocity.y = ( m1*vIy1 + m2*vIy2 - e*m2*(vIy1-vIy2) ) / (m1 + m2);

    //    this.velocity.x = constrain(this.velocity.x, -3, 3);
    //    this.velocity.y = constrain(this.velocity.y, -4, 4);

    this.numColition++;

    if (numColition > 100) {
      this.reset();
      this.numColition = 0;
    }
  }

  void shipCollition() {
    //for debug
    fill(0, 100, 20);
    //rect(location.x, location.y+asteroid.height*d/2, 10, 10); //for asteroids
    //rect(player.xmouse, player.ymouse+80, 5, 5);// for ship

    if (location.x+asteroid.height*d/2 > player.xmouse+15 && location.x - asteroid.height*d/2 < player.xmouse+90
      && location.y+asteroid.height*d/2 > player.ymouse-15 && location.y -asteroid.height*d/2 < player.ymouse+110 && player.shipStatus == 1 )
    {
      //ellipse(location.x,location.y, asteroid.height*d/2,asteroid.height*d/2);
      collition =true;
      shaking = true;



      player.soundBoing();
      //if (this.velocity.y > 0)
      //  this.location.y -= 3;
      //this.velocity.y =this.velocity.y*-1;
      //if (this.velocity.x < 0)
      //{
      //  this.location.x += 3;
      //  this.velocity.x = this.velocity.x*-1;
      //} else { 
      //  this.location.x -= 3;
      if (this.velocity.y > 0 && location.y+asteroid.height*d/2 > player.ymouse-50)
      {
        this.location.y -= 3;
        this.velocity.y = this.velocity.y*-1;
        println("frontal");
      }
      if (this.velocity.x > 0 )
      {
        this.location.x -= 3;
        this.location.y -= 3;
        this.velocity.x = this.velocity.x*-1;
        this.velocity.y = this.velocity.y*-1;
        println("izquierdo");
      }
      if (this.velocity.x < 0)
      {
        this.location.x += 3;
        this.location.y += 3;
        this.velocity.x = this.velocity.x*-1;
        this.velocity.y = this.velocity.y*-1;
        println("Derecho");
      }

      //if (mouseX > bx && mouseX < bx+boxW && 
      //  mouseY > by && mouseY < by+boxH) {


      //  this.velocity.y = this.velocity.y*-1;
      //  this.velocity.x = this.velocity.x*-1;
      //  //life -= 20;

      //  //player.loseshieldy = true;

      //  player.cnt = 0;
      //  player.shieldStatus = player.shieldStatus+ 1;
      //  player.loseshieldy = false;
      //  println(player.shieldStatus);

      //this.velocity.x -= 5;
      //considerando destruirlo en vez de redireccionarlos
      // }
    }
    //if (location.x+asteroid.height*d/2 > player.xmouse+45 && location.x - asteroid.height*d/2 < player.xmouse+55
    //  && location.y+asteroid.height*d/2 > player.ymouse+25 && location.y -asteroid.height*d/2 < player.ymouse+80 
    //  && player.shipStatus == 2)
    //{
    //  //ellipse(location.x,location.y, asteroid.height*d/2,asteroid.height*d/2);
    //  collition =true;
    //  player.myColl = true;
    //  shaking = true;



    //  if (this.velocity.y > 0 )
    //  {
    //    this.location.y -= 3;
    //    this.velocity.y = this.velocity.y*-2;
    //  }
    //  if (this.velocity.x < 0)
    //  {
    //    this.location.x += 3;
    //    this.velocity.x = this.velocity.x*-2;
    //  } else
    //  {
    //    this.location.x -= 3;
    //    this.velocity.y = this.velocity.y*-2;
    //    this.velocity.x = this.velocity.x*1;
    //    //life -= 20;
    //    player.shipLife -= 10;

    //    shipHit.play();
    //    if ( shipHit.isPlaying() == true)
    //    {
    //      shipHit.rewind();
    //    }
    //  }
    //}
  }


  int collision(ArrayList<Bullet> theBullets)
  {
    collition = false;
    int cnt = 0;
    for ( Bullet myBullet : theBullets ) {
      if (myBullet.x > location.x-(asteroid.height*d/2) && myBullet.x < location.x+(asteroid.height*d/2) &&
        myBullet.y > location.y-(asteroid.height*d/2.05) && myBullet.y < location.y+(asteroid.height*d/2.05) )
      {
        asteroidHit.play();
        if ( asteroidHit.isPlaying() == true)
        {
          asteroidHit.rewind();
        }

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
