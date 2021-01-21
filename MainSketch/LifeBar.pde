class LifeBar
{

   float x;
   float y;
   int w;
   int h;
   
   int r;
   int g = 255;
   int b;
   
   Boolean loselify = false;
   
  
  LifeBar(float initx, float inity, int initw, int inith)
  {
    x = initx+10;
    y = inity+10;
    w = initw+10;
    h = inith+10;
  }
  
  void lifebar()
  {
    fill(r, g, b);
    rect(xmouse, ymouse, 10, 30);//vida de la nave
    
    if (loselify == true)
    {
      r++;
      g--;
    }
    
    
  }
}
