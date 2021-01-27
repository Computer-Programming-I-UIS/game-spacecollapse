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

  boolean overBox = false;


  //bx,by,bW,bH,strokeW(int),stroke(color),rectcolorFill(color),SStrokeW(int),Sstroke(color),SrectcolorFill(color),MousePressFill(color),String(nombre), Tx(float),Ty(float),Tcolor,gamestatus)
  Buttom(float initbx, float initby, float initboxW, float initboxH, float initBorP, color initcolBorP, color initrectColP, 
    float initBorS, color initcolBorS, color initrectColS, color initpressCol, 
    String initname, float initTx, float initTy,color initColorR ,color initColorG,color initColorB ,color initalpha,int initTS,int initgamest, int initMX, int initMY,float initbcP, float initbcS )
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
        //this.pressed();
        
        fill(this.pressCol);
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

    fill(this.theColorR,this.theColorG,this.theColorB,this.alpha);
    textSize(Ts);
    textAlign(CENTER, BOTTOM);
    text(this.name, this.Tx, this.Ty ); //width/2,this.by+65
  }
  public void centerCursor() throws Exception {
  
  Robot robot = new Robot();
  robot.mouseMove(mouseMX,  mouseMY);
  
}
}
//class ButtomStart extends Buttom
//{
//  float boxW; //70
//  float boxH;

//  float bx; //= width/2-boxSize/2;
//  float by;//= height/3;


//  boolean overBox = false;

//  ButtomStart(float initbx, float initby, float initboxW, float initboxH)
//  {
//    this.bx = initbx;
//    this.by = initby;
//    this.boxH = initboxH;
//    this.boxW = initboxW;
//    this.name = "START";
//    this.theColor = color(0, 255, 255);
//  }

//  // Sobreescribe el método de la superClase
//  void pressed() {
//    fill(255, 155);
//    gameStatus = 3;
//     try {
//      centerCursor();
//    }
//    catch(Exception e) {
//      //  Block of code to handle errors
//    }
//  }
//}
//class ButtomConfig extends Buttom
//{
//  /*
//  float boxW; //70
//   float boxH;

//   float bx; //= width/2-boxSize/2;
//   float by;//= height/3;


//   boolean overBox = false;
//   */

//  ButtomConfig(float initbx, float initby, float initboxW, float initboxH)
//  {
//    this.bx = initbx;
//    this.by = initby;
//    this.boxH = initboxH;
//    this.boxW = initboxW;
//    this.name = "OPTIONS";
//    this.theColor = color(255, 255, 0);
//  }
/*
  void showbuttom()
 {
 
 if (mouseX > bx-boxW && mouseX < bx+boxW && 
 mouseY > by-boxH && mouseY < by+boxH) {
 overBox = true;  
 
 strokeJoin(ROUND);
 strokeWeight(10);
 stroke(0, 255, 255); 
 fill(0);
 } else 
 {
 strokeJoin(ROUND);
 strokeWeight(10);
 stroke(255);
 fill(0);
 
 overBox = false;
 }
 
 if (mousePressed)
 { 
 if (overBox) { 
 fill(255, 155);
 gameStatus = 2;
 }
 }
 
 rect(bx, by, boxW, boxH);
 
 fill(255, 255, 0);
 textSize(50);
 textAlign(CENTER, BOTTOM);
 text("OPTIONS", width/2, by+65);
 }*/
//}
//class ButtomExit extends Buttom
//{
//  /*
//  float boxW; //70
//   float boxH;

//   float bx; //= width/2-boxSize/2;
//   float by;//= height/3;

//   boolean overBox = false;
//   */

//  ButtomExit(float initbx, float initby, float initboxW, float initboxH)
//  {
//    this.bx = initbx;
//    this.by = initby;
//    this.boxH = initboxH;
//    this.boxW = initboxW;
//    this.name = "EXIT";
//    this.theColor = color(255, 0, 0);
//  }
//  /*
//  void showbuttom()
//   {

//   if (mouseX > bx-boxW && mouseX < bx+boxW && 
//   mouseY > by-boxH && mouseY < by+boxH) {
//   overBox = true;  

//   strokeJoin(ROUND);
//   strokeWeight(10);
//   stroke(0, 255, 255); 
//   fill(0);
//   } else 
//   {
//   strokeJoin(ROUND);
//   strokeWeight(10);
//   stroke(255);
//   fill(0);

//   overBox = false;
//   }

//   if (mousePressed)
//   { 
//   if (overBox) { 
//   fill(255, 155);
//   gameStatus = 1;
//   }
//   }

//   rect(bx, by, boxW, boxH);

//   fill(255, 0, 0);
//   textSize(50);
//   textAlign(CENTER, BOTTOM);
//   text("EXIT", width/2, by+65);
//   }
//   */
//}
//class ButtomYes extends Buttom
//{

//  float boxSize; //= 70;

//  float bx ;//= width/2-boxSize*2;
//  float by ;//= height/2+boxSize/2;

//  boolean overBox = false;

//  ButtomYes(float initbx, float initby, float initboxSize)
//  {
//    bx = initbx;
//    by = initby;
//    boxSize = initboxSize;
//  }

//  void showbuttom()
//  {
//    int f;

//    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
//      mouseY > by-boxSize && mouseY < by+boxSize) {
//      overBox = true;  

//      stroke(255, 0, 0); 
//      fill(0);
//      f=255;
//    } else 
//    {
//      stroke(255);
//      fill(255, 0, 0);
//      overBox = false;
//      f = 0;
//    }

//    if (mousePressed)
//    { 
//      if (overBox) { 
//        fill(255, 155);
//        gameStatus = 11;
//      }
//    }
//    rect(bx, by, boxSize, boxSize);
//    fill(f);
//    textSize(35);
//    textAlign(CENTER, BOTTOM);
//    text("YES", width/2-105, by+55);
//  }
//}
//class ButtomNo extends Buttom
//{

//  float boxSize;//= 70;

//  float bx;// = width/2+boxSize;
//  float by;// = height/2+boxSize/2;

//  boolean overBox = false;

//  ButtomNo(float initbx, float initby, float initboxSize)
//  {
//    bx = initbx;
//    by = initby;
//    boxSize = initboxSize;
//  }
//  void showbuttom()
//  {  
//    int f;

//    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
//      mouseY > by-boxSize && mouseY < by+boxSize) {
//      overBox = true;  

//      stroke(0, 255, 0);
//      fill(0, 0, 0);
//      f = 255;
//    } else 
//    {
//      stroke(255);
//      fill(0, 255, 0);
//      overBox = false;
//      f = 0;
//    }

//    if (mousePressed)
//    { 
//      if (overBox) { 
//        fill(255, 155);
//        gameStatus = 10;
//      }
//    }

//    rect(bx, by, boxSize, boxSize);
//    fill(f);
//    textSize(35);
//    textAlign(CENTER, BOTTOM);
//    text("NO", width/2+106, by+55);
//  }
//}
