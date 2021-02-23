int gameStatus = 3;

void stateMachine()
{  
  switch (gameStatus)
  {
  case 0:


    window.mainmenu();




    break;
  case 1:


    window.areyousure();


    break;
  case 2:

    window.options();


    break;

  case 3:


    noCursor();
    //this.scrollspace(); 
    scale(0.5);
    translate(width/2,height/2*2);
    loading.pause();
    main.pause();
    window.waveShow();
    drawStars();
    player.nave();
    player.shipPoints();
    player.keyPressed();
    
    text(str(meteoritos.size()), 30, 700);
    
    if (genAsteroids == false)
    {
      genAsteroids = true;
      numAsteroids+=3;
      createAsteroids();
      window.txWh=0;
      window.waveShow();
      window.previousCount = frameCount;
      window.counterSkip = 0;
      window.abierto2 = true;
      window.endSkip = true;
      window.wave++;
      println("meteoritos.size() = " + str(meteoritos.size()));
    }
    if (meteoritos.size() <= 2)
    {
      genAsteroids = false;
    }
    fill(255);
    textSize(30);
    textAlign(CENTER, BOTTOM);
    text(" " + playerScore, 30, 100 ); //width/2,this.by+65
    noFill();
    player.ShipTrigger();
    //xmouse = constrain(mouseX, 300, 1150);
    //ymouse = mouseY - 16;

    break;
  case 4://loading

    window.screenLoading();
    loading.play();
    main.pause();

    break;

  case 11:

    exit();

    break;
  }
  pushMatrix();
  window.changeScreen();
  popMatrix();
}
