class GameObject
{
  float x, y, w, h, _w, _h;
  PImage sprite;
  GameObject()
  {
    //CHOOSE RANDOM SPRITES
    //HEAD EYES MOUTH BODY COLOR
    
    x = width/2; 
    y = height/2;
    w = 35;
    h = 20;
    _w = w / 2;
    _h = h / 2;
    //sprite = createImage(32, 32, RGB);
    
  }
}

class Goblin extends GameObject
{
  int state = 0;
  
  Goblin()
  {
    
  }
  
  void draw()
  {
    beginShape();
    vertex(x, y - _h);
    vertex(x + _w, y + _h);
    vertex(x - _w, y + _h);
    vertex(x, y - _h);
    endShape();
  }
  
  void update()
  {
    if(frameCount % 300 == 0)
    {
     println("call");
    }
    
    switch(state)
    {
      case 0:
      
      //WANDER
      
      break;
    }
    
    this.draw();
  }
}

//class Appliance extends GameObject
//{
//  Appliance()
//  {
    
//  }
//}