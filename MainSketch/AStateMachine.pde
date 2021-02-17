void stateMachine()
{  
  switch (gameStatus)
  {
  case 0:

    //fullScreen(P3D);
    this.mainmenu();
    scale(0.5);
    image(RP,100,1500);

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
    player.nave();
    player.keyPressed();


    //xmouse = constrain(mouseX, 300, 1150);
    //ymouse = mouseY - 16;

    break;

  case 11:

    exit();

    break;
  }
}
