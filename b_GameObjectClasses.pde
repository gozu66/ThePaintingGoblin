class GameObject
{
  float x, y, w, h, _w, _h;
  
  PVector pos, forward;
  float theta;
  
  PImage sprite;
  
  GameObject()
  {
    //CHOOSE RANDOM SPRITES
    //HEAD EYES MOUTH BODY COLOR
    
    x = width / 2; 
    y = height /2;
    w = 20;
    h = 30;
    _w = w / 2;
    _h = h / 2;
    
  }
}

class Goblin extends GameObject
{
  int state = 0;
  
  Goblin()
  {
    
  }
  
  void render()
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
    //if(frameCount % 300 == 0)
    //{
    // println("call");
    //}
    
    switch(state)
    {
      case 0:
      
      //WANDER
      
      break;
    }
    
    move();  //MOVE AROUND
    
    
    this.render();
  }
  
  void move()
  {
    pushMatrix();
    
      
      
    popMatrix();
  }
}

//class Appliance extends GameObject
//{
//  Appliance()
//  {
    
//  }
//}