void stateMachine()
{  
  switch (gameStatus)
  {
  case 0:

    //fullScreen(P3D);
    this.mainmenu();

    break;
  case 1:


    this.areyousure();

    break;
  case 2:

    this.options();

    break;

  case 3:


    noCursor();
    //this.scrollspace(); 
    main.pause();

    drawStars();
    nave();

    xmouse = constrain(mouseX, 300, 1150);
    ymouse = mouseY - 16;

    break;

  case 11:

    exit();

    break;
  }
}