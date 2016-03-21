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

class Appliance extends GameObject
{
  
  Appliance(float x, float y)
  {
    super(x, y);
  }
  
  void update()
  {
    
  }
}