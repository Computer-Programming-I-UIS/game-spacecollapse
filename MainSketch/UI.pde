class UI {
  //Atributos

  PImage SC = loadImage("data/UI/Logo.png");
  PImage ESBR = loadImage("data/UI/ESBR.png");
  PImage PEGI = loadImage("data/UI/PEGI.png");
  PImage control = loadImage("data/UI/Control.png");
  PImage roll = loadImage("data/UI/LogoRot.png");
  PImage border = loadImage("data/UI/Border.png");
  PImage borderef = loadImage("data/UI/Borderef.png");

  PImage[] load = new PImage[6];

  int rotateS = 0;
  int clx = 0 ;
  int clx2 = 0 ;
  int yslide = 0;

  int txWh = 0;
  int counterSkip = 0;
  int wave = 1;

  boolean endSkip = false;
  boolean abierto = true;
  boolean abierto2 = true;
  boolean change = false;

  int previousCount = 0;


  //constructor
  UI()
  {
    load[0] = loadImage( "data/sprites/Loading1.png" );
    load[1] = loadImage( "data/sprites/Loading2.png" );
    load[2] = loadImage( "data/sprites/Loading3.png" );
    load[3] = loadImage( "data/sprites/Loading4.png" );
    load[4] = loadImage( "data/sprites/Loading5.png" );
    load[5] = loadImage( "data/sprites/Loading6.png" );
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
    image(window.ESBR, 100, 1500);
    image(window.PEGI, 300, 1500);
    popMatrix();

    start.showbuttom();
    tutorial.showbuttom();
    credits.showbuttom();
    // config.showbuttom();
    exit.showbuttom();
  }
  void credits()
  {
    background(0);
    // image(Credits, 0, 0);
    textAlign(CENTER, CENTER);
    main.setGain(-10);
    image(SC, width/2-298.5, 100 + yslide);

    text("ESPECIAL GRETINGS:", width/2, -1500+ yslide);

    text("Alex Mantilla Rios ", width/2, -1400+ yslide);
    text(" @Alessandrocapra ", width/2, -1350+ yslide);
    text(" @Sinestesia ", width/2, -1300+ yslide);
    text(" @Thiebaut ", width/2, -1250+ yslide);

    text("TESTERS:", width/2, -1100+ yslide);
    text("@Biomehanik0", width/2, -1000+ yslide);
    text("Fabian Romero", width/2, -950+ yslide);
    text("@L3onav", width/2, -900+ yslide);
    text("'thanks for the feed guys'", width/2, -850+ yslide);


    text("PROGRAMING:", width/2, -650+ yslide);
    text("@Jerok", width/2, -600+ yslide);
    text("Alex Mantilla Rios ", width/2, -550+ yslide);

    text("ARTIST:", width/2, -400+ yslide);
    text("@Jerok", width/2, -350+ yslide);

    text("MUSIC:", width/2, -200+ yslide);
    text("@Jerok", width/2, -150+ yslide);

    text("_______By David Romero_______", width/2, 0+ yslide);

    pushMatrix();
    scale(0.5);
    translate( width*2-(width/4), 1900);
    text("'Press any key to skip'", 0, 0);
    popMatrix();
    yslide+= 2;

    if ( keyPressed ||yslide >= 1800 )
    {
      change = true;
      gameStatus = 0;
      yslide = 0;
    }
  }
  void tutorial()
  {
    pushMatrix();

    image(control, 250, 100);

    popMatrix();

    pushMatrix();
    scale(0.5);
    translate( width*2-(width/2.5), 1900);
    text("'Press any key to skip'", 0, 0);
    popMatrix();
    yslide+= 2;

    if ( keyPressed ||yslide >= 1800 )
    {
      change = true;
      gameStatus = 0;
      yslide = 0;
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
  void pause()
  {
    image(SC, width/2-298.5, 100);//width/2-298.5, 100
    Pause.showbuttom();
    Continue.showbuttom();
    image(border, 0, 0);


    image(borderef, width/1.69+10, 0);
  
  }

  void screenLoading ()
  {
    if (frameCount %7 == 0)
    {
      frame = (frame+1)%6;
    }
    pushMatrix();
    scale(0.3);
    player.reset();
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
    //txWh=0;
    if (gameStatus == 3 && endSkip == true ) {
      if (abierto2 == true && counterSkip == 0)
      {
        //endSkip = false;

        txWh += 100;
        if ( txWh >= width/2)
        {
          txWh = width/2;
          if ((frameCount - previousCount) %110 == 0)
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
