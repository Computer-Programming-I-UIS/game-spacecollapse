class Buttom
{
  int boxSize = 70;

  float bx = width/2-boxSize/2;
  float by = height/3;

  boolean overBox = false;

  void showbuttom()
  {

    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;  

      stroke(255); 
      fill(153);
    } else 
    {
      stroke(153);
      fill(153);
      overBox = false;
    }

    if (mousePressed)
    { 
      if (overBox) { 
        fill(255, 255, 255);
        gameStatus = 3;
      }
    }
    rect(bx, by, boxSize, boxSize);
  }
}
class ButtomConfig extends Buttom
{
  int boxSize = 70;

  float bx = width/2-boxSize/2;
  float by = height/2;

  boolean overBox = false;

  void showbuttom()
  {

    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;  

      stroke(255); 
      fill(153);
    } else 
    {
      stroke(153);
      fill(153);
      overBox = false;
    }

    if (mousePressed)
    { 
      if (overBox) { 
        fill(255, 255, 255);
        gameStatus = 2;
      }
    }
    rect(bx, by, boxSize, boxSize);
  }
}
class ButtomExit extends Buttom
{
  int boxSize = 70;

  float bx = width/2-boxSize/2;
  float by = height/1.5;

  boolean overBox = false;

  void showbuttom()
  {
    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;  

      stroke(255); 
      fill(153);
    } else 
    {
      stroke(153);
      fill(153);
      overBox = false;
    }

    if (mousePressed)
    { 
      if (overBox) { 
        fill(255, 255, 255);
        gameStatus = 1;
      }
    }
    rect(bx, by, boxSize, boxSize);
  }
}
class ButtomYes extends Buttom
{

  int boxSize = 70;

  float bx = width/2-boxSize*2;
  float by = height/2+boxSize/2;

  boolean overBox = false;

  void showbuttom()
  {
    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;  

      stroke(255,0,0); 
      fill(0);
    } else 
    {
      stroke(153);
      fill(255,0,0);
      overBox = false;
    }

    if (mousePressed)
    { 
      if (overBox) { 
        fill(255, 255, 255);
        gameStatus = 10;
      }
    }
    rect(bx, by, boxSize, boxSize);
  }
}
class ButtomNo extends Buttom
{

  int boxSize = 70;

  float bx = width/2+boxSize;
  float by = height/2+boxSize/2;

  boolean overBox = false;

  void showbuttom()
  {
    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;  
        
      stroke(0,255,0);
      fill(0,0,0);
    } else 
    {
      stroke(153);
      fill(0,255,0);
      overBox = false;
    }

    if (mousePressed)
    { 
      if (overBox) { 
        fill(255, 255, 255);
        gameStatus = 10;
      }
    }
    rect(bx, by, boxSize, boxSize);
  }
}
