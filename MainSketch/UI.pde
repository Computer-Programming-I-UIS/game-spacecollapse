class UI {
  //Atributos

  PImage SC = loadImage("Logo.png");
  PImage Credits = loadImage("Creditos.png");
  PImage RP = loadImage("RP.png");
  PImage space = loadImage("Space.png");
  PImage roll = loadImage("LogoRot.png");

  PImage[] load = new PImage[6];

  int rotateS = 0;
  int clx = 0 ;
  int clx2 = 0 ;

  int txWh = 0;
  int counterSkip = 0;
  int wave = 1;

  boolean endSkip = false;
  boolean abierto = true;
  boolean abierto2 = true;
  boolean change = false;




  //constructor
  UI()
  {
    load[0] = loadImage( "Loading1.png" );
    load[1] = loadImage( "Loading2.png" );
    load[2] = loadImage( "Loading3.png" );
    load[3] = loadImage( "Loading4.png" );
    load[4] = loadImage( "Loading5.png" );
    load[5] = loadImage( "Loading6.png" );
  }
  //metodos
  void mainmenu()
  {
    ShowCubes();

    image(SC, width/2-298.5, 100);//width/2-298.5, 100

    pushMatrix();
    translate(770, 159);
    rotate(rotateS/2);
    scale(0.3);
    image(roll, 0-roll.width/2, 0-roll.height/2);
    rotateS++;
    popMatrix();
    pushMatrix();
    scale(0.5);
    image(window.RP, 100, 1500);
    popMatrix();

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

    if ( window.change != true) 
    {
      strokeJoin(ROUND);
      stroke(255, 0, 248);
      strokeWeight(10);
      fill(0);

      rect(width/2-250, height/2.5, w, h);

      textSize(50);
      fill(255, 255, 0);
      textAlign(CENTER, BOTTOM);

      text("ARE YOU SURE?", width/2, height/2);
      no.showbuttom();
      yes.showbuttom();
      //filter( BLUR, 4);
    }
  }
  void screenLoading ()
  {
    if (frameCount %7 == 0)
    {
      frame = (frame+1)%6;
    }
    pushMatrix();
    scale(0.3);
    image( load[frame], width*2.8, height*2.5 );
    popMatrix();

    if (frameCount % 320 == 0)
    {
      gameStatus = 3;
      change = true;
    }
  }

  int framesShake = 0;

  void toShake()
  {
    if (shaking == true)
    {
      if (framesShake< 15) {
        shakeScreen();
        framesShake++;
      } else
      {
        framesShake = 0;
        shaking = false;
      }
    }
  }
  int framesShakemini = 0;
  void toShakemini()
  {
    if (shakingmini == true)
    {
      if (framesShakemini< 15) {
        shakeScreenmini();
        player.loseshieldy = true;

        framesShakemini++;
      } else
      {
        framesShakemini = 0;
        shakingmini = false;
      }
    }
  }
  void shakeScreen()
  {
    // println("shaking");

    translate(random(-5, 5), random(-5, 5));
  }
  void shakeScreenmini()
  {
    //println("shaking");

    translate(random(-1, 1), random(-1, 1));
  }
  void changeScreen()
  {

    if (change == true) {
      if (abierto == true)
      {
        endSkip = false;
        clx+= 1000;
        clx2-= 1000;
        if (clx2 <= -width/2 && clx >= width/2)
        {
          abierto = false;
        }
      } else
      {
        clx-= 50;
        clx2+= 50;
        if (clx2 == 0  && clx == 0)
        {
          abierto =true;
          endSkip = true;
          change = false;
          woosh.play();
          if ( woosh.isPlaying() == true)
          {
            woosh.rewind();
          }
        }
      }
    } else
    {
      change = false;
     
    }

    fill(123);
    noStroke();
    rect(0, 0, constrain(clx, 0, width/2), height);
    rect(width, 0, constrain(clx2, -width/2, 0), height);
  }
  void waveShow()
  {

    if (gameStatus == 3 && endSkip == true ) {
      if (abierto2 == true && counterSkip == 0)
      {
        //endSkip = false;

        txWh += 100;
        if ( txWh >= width/2)
        {
          txWh = width/2;
          if (frameCount %110 == 0)
          {
            abierto2 = false;
          }
        }
      } else
      {
        txWh-= 20;

        if (txWh <= 0 )
        {
          abierto2 = true;
          counterSkip++;
          woosh.play();
          if ( woosh.isPlaying() == true)
          {
            woosh.rewind();
          }
        }
      }
    }

    fill(255);
    textSize(50);
    textAlign(CENTER, BOTTOM);
    text("WAVE" + " " + wave, txWh, height/2 ); //width/2,this.by+65
  }
}
