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

    window.options();


    break;

  case 3:


    noCursor();
    //this.scrollspace(); 
    loading.pause();
    main.pause();
    window.waveShow();
    drawStars();
    player.nave();
    player.shipPoints();
    player.keyPressed();

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
