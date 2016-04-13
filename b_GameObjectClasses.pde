class GameObject
{
  float w, h, _w, _h;
  
  PVector forward, pos;
  float theta = 0, speed = 2f;
  
  PImage sprite;
  
  GameObject(float x, float y)
  {
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
  String name;
  
  Appliance(PVector appPos, String _name)
  {
    super(appPos.x, appPos.y);
    name = _name;
  }
  
  void update()
  {
     render(); 
  }
  
  void render()
  {
    fill(150, 100, 0);
    rect(pos.x, pos.y, 50, 50);
    fill(0);
    textAlign(BOTTOM);
    text(name, pos.x + 5, pos.y + 20);
  }
}