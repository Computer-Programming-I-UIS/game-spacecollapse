boolean locked = false; 
class Buttom 
{
  float bx; //= width/2-boxSize/2;
  float by;//= height/3;

  float boxW; //70
  float boxH;

  float BorP;
  color colBorP;
  color rectColP;

  float BorS;
  color colBorS;
  color rectColS;

  color pressCol;

  String name;

  float Tx;
  float Ty;

  color theColorR;
  color theColorG;
  color theColorB;
  color alpha;

  int Ts;

  int gamest;

  int mouseMX;
  int mouseMY;

  float bcP;
  float bcS;

  int counter;

  boolean overBox = false;


  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus)
  Buttom(float initbx, float initby, float initboxW, float initboxH, float initBorP, color initcolBorP, color initrectColP, 
    float initBorS, color initcolBorS, color initrectColS, color initpressCol, 
    String initname, float initTx, float initTy, color initColorR, color initColorG, color initColorB, color initalpha, int initTS, int initgamest, int initMX, int initMY, float initbcP, float initbcS )
  {
    this.bx = initbx;
    this.by = initby;
    this.boxH = initboxH;
    this.boxW = initboxW;

    this.BorP = initBorP;
    this.colBorP = initcolBorP;
    this.rectColP = initrectColP;

    this.BorS = initBorS;
    this.colBorS = initcolBorS;
    this.rectColS = initrectColS;

    this.pressCol = initpressCol;

    this.name = initname;
    this.Tx = initTx;
    this.Ty = initTy;

    //= color(0, 255, 255);
    this.theColorR = initColorR;
    this.theColorG = initColorG;
    this.theColorB = initColorB;
    this.alpha=  initalpha;

    this.Ts = initTS;

    this.gamest = initgamest;

    this.mouseMX = initMX;
    this.mouseMY = initMY;

    this.bcP  = initbcP;
    this.bcS  = initbcS;
  }

  void showbuttom()
  {
    if (mouseX > bx && mouseX < bx+boxW && 
      mouseY > by && mouseY < by+boxH) {
      overBox = true;  

      strokeJoin(ROUND);
      strokeWeight(this.BorP);
      stroke(this.colBorP); 
      this.alpha = 255;
      fill(this.rectColP);//color de fondo del boton

      specLow = bcS;
    } else 
    {
      //this.theColorTx = 0;
      strokeJoin(ROUND);
      strokeWeight(this.BorS);
      stroke(this.colBorS); 
      this.alpha = 190;
      fill(this.rectColS);

      specLow = bcP;

      overBox = false;
    }

    if (mousePressed && (mouseButton == LEFT) &&  !locked )
    { 

      if (overBox) { 

        noStroke();
        window.change = true;

        fill(this.pressCol);
        click.play();
        if ( click.isPlaying() == true)
        {
          click.rewind();
        }

        gameStatus = gamest;

        try {
          centerCursor();
        }
        catch(Exception e) {
          //  Block of code to handle errors
        }
        locked = true;
      }
    }

    rect(this.bx, this.by, this.boxW, this.boxH);

    fill(this.theColorR, this.theColorG, this.theColorB, this.alpha);
    textSize(Ts);
    textAlign(CENTER, BOTTOM);
    text(this.name, this.Tx, this.Ty ); //width/2,this.by+65
  }
  public void centerCursor() throws Exception {

    Robot robot = new Robot();
    robot.mouseMove(mouseMX, mouseMY);
  }
}
