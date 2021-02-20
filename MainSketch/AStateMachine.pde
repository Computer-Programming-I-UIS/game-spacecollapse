int gameStatus = 0;

void stateMachine()
{  
  switch (gameStatus)
  {
  case 0:

    //fullScreen(P3D);
    
    window.mainmenu();
   
    scale(0.5);
    image(window.RP, 100, 1500);


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
    main.pause();

    drawStars();
    player.nave();
    player.keyPressed();


    //xmouse = constrain(mouseX, 300, 1150);
    //ymouse = mouseY - 16;

    break;
  case 4://loading

    window.screenLoading();
    main.pause();

    break;

  case 11:

    exit();

    break;
  }
}
