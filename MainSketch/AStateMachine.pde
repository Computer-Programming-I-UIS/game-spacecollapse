int gameStatus = 0;

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

    window.credits();


    break;

  case 3:


    noCursor();

    window.waveShow();
    drawStars();
    player.nave();
    player.keyPressed();

    loading.pause();
    main.pause();
    inGame.play();

    pushMatrix();
    scale(0.5);
    text("Asteroids "+str(meteoritos.size()), 180, 700);
    popMatrix();
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
      //println("meteoritos.size() = " + str(meteoritos.size()));
    }
    if (meteoritos.size() <= 2)
    {
      genAsteroids = false;
    }
    fill(255);
    textSize(30);
    textAlign(CENTER, BOTTOM);
    text(" Score " + playerScore, 70, 100 ); //width/2,this.by+65
    noFill();

    //xmouse = constrain(mouseX, 300, 1150);
    //ymouse = mouseY - 16;

    break;
  case 4://loading

    window.screenLoading();
    loading.play();
    main.pause();

    break;
  case 5://Tutorial

    window.tutorial();

    break;

  case 10:

    cursor();
    window.pause();

    break;

  case 11:

    exit();

    break;
  }
  pushMatrix();
  window.changeScreen();
  popMatrix();
}
