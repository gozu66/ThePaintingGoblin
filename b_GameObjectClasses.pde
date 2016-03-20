class GameObject
{
  float w, h, _w, _h;
  
  PVector forward, pos;
  float theta = 0, speed = 5f;
  
  PImage sprite;
  
  GameObject(float x, float y)
  {
    //CHOOSE RANDOM SPRITES
    //HEAD EYES MOUTH BODY COLOR
    pos = new PVector(x, y);
    forward = new PVector(0, -1);

    w = 20;
    h = 30;
    _w = w / 2;
    _h = h / 2;
    
  }
}

class Goblin extends GameObject
{
  int state = 0;
  
  Goblin(float x, float y)
  {
    super(x, y);
  }
  
  void render()
  {
   beginShape();
   vertex(0, 0 - _h);
   vertex(0 + _w, 0 + _h);
   vertex(0 - _w, 0 + _h);
   vertex(0, 0 - _h);
   endShape();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);

    forward.mult(speed);

    
    switch(state)
    {
      case 0:
      
      //WANDER
      
      break;
    }
    
    pushMatrix();
    
      translate(pos.x, pos.y);
      rotate(theta);
      
      this.render();
      
    popMatrix();
  }
  
  void move(int i)
  {
    if(i == 0){
      pos.add(forward);
    }else{
      pos.sub(forward);
    }
  }
  
  void rotation(int i)
  {
    theta = (i == 0) ? theta + 0.05 : theta - 0.05;
  }

}