class Goblin extends GameObject
{
  Goblin(float x, float y)
  {
    super(x, y);
    goblinStart();
  }
  
  Utility currentUT;
  Utility hungerUT;
  Utility sleepUT;
  Utility creativity;
  
  float easelDir = QUARTER_PI * 3;
  float bedDir = PI * 1.25f;

  void goblinStart()
  {
    hungerUT = new Utility("hunger", 0.0f);
    sleepUT = new Utility("sleep", 0.0f);
    creativity = new Utility("creativity", 0.1f);
    currentUT = creativity;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    forward.mult(speed);

    timedUtilities();
    
    switch(currentUT._name)
    {
      case "hunger":
        //
      break;
      
      case "sleep":
        //
        //theta = bedDir;
        moveTo(bed.pos);
      break;
      
      case "creativity":
        //GO TO EASEL AND PAINT
        
        bePainting();
        //theta = easelDir;
        //moveTo(easel.pos, easelDir);
        moveTo(easel.pos);
      break;
    }
    

    
    pushMatrix();  
    translate(pos.x, pos.y);
    rotate(angle);
    this.render();
    popMatrix();

  }
    
  void render()
  {
    fill(150, 150, 10);
    
    beginShape();
    vertex(0, 0 - _h);
    vertex(0 + _w, 0 + _h);
    vertex(0 - _w, 0 + _h);
    vertex(0, 0 - _h);
    endShape();
  }
  
  //void move(int i)
  //{
  //  if(i == 0)
  //  {
  //    pos.add(forward);
  //  }
  //  else
  //  {
  //    pos.sub(forward);
  //  }
  //}
  
  //void rotation(int i)
  //{
  //  theta = (i == 0) ? theta + 0.05 : theta - 0.05;
  //}
  
  void timedUtilities()
  {
    if(frameCount % 100 == 0)
    {
      hungerUT.current += 0.01f;
      sleepUT.current += 0.025f;
      hungerUT.current = clamp(hungerUT.current, 0, 1);
      sleepUT.current = clamp(sleepUT.current, 0, 1);
      currentUT = getCurrentUT();
      println(currentUT._name);
    }
    
    fill(100, 100, 100);
    rect(10, 10, 50, 10);
    rect(10, 30, 50, 10);
    rect(10, 50, 50, 10);
    fill(255, 0, 0);
    rect(10, 10, hungerUT.current * 50, 10);
    fill(0, 0, 255);
    rect(10, 30, sleepUT.current * 50, 10);
    fill(0, 255, 0);
    rect(10, 50, creativity.current * 50, 10);  
    
    
  }
  
  float clamp(float value, float min, float max)
  {
    if(value > max || value < min)
    {
      value = (value > max) ? max : min;
    }
    return value;
  }
  
  Utility getCurrentUT()
  {
    Utility u = hungerUT;
    if(u.current < sleepUT.current)
    {
      u = sleepUT;
    }
    if(u.current < creativity.current)
    {
      u = creativity;
    }
    return u;
  }
}

class Utility
{
  String _name;
  float current, min, max;
  
  Utility(String name, float amount)
  {
    _name = name;
    current = amount;
  }
}