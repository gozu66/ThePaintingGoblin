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
  
  PVector currentTarget;
  float distToTarget;
  
  void goblinStart()
  {
    hungerUT = new Utility("hungry", 0.0f);
    sleepUT = new Utility("sleepy", 0.0f);
    creativity = new Utility("creative", 0.1f);
    currentUT = creativity;
  }
  
  void update()
  {
    if(currentTarget != null)
    {
      distToTarget = currentTarget.dist(pos);
    }
    
    forward.x = sin(theta);
    forward.y = -cos(theta);
    forward.mult(speed);

    if(distToTarget > 1)
      pos.add(forward);

    timedUtilities();
    
    switch(currentUT._name)
    {
      case "hungry":
        //
        currentTarget = kitchen.pos;
        //rotateTowards()
      break;
      
      case "sleepy":
        //
        currentTarget = bed.pos;
        //rotateTowards(bed.pos);
        sleep();
        
      break;
      
      case "creative":
        //GO TO EASEL AND PAINT
        
        bePainting();
        
        currentTarget = easel.pos;
        //rotateTowards(easel.pos);
      break;
    }
    
    rotateTowards(currentTarget);
    
    pushMatrix();  
    translate(pos.x, pos.y);
    rotate(theta);
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
    
  void timedUtilities()
  {
    rectMode(CORNER);
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
  
  void rotateTowards(PVector position)
  {
    float xDif = position.x - gob.pos.x;
    float yDif = gob.pos.y - position.y;
    theta = radians(atan2(xDif, yDif) * 180 / PI);
  }
    
  float sleepProgress = 0, maxSleepProgress = 100;
  
  void sleep()
  {
      float x = bed.pos.x - 25; 
      float y = bed.pos.y - 40;
      fill(20);
      rect(x, y, 50, 10);
      fill(15, 200, 15);
      rect(x, y, sleepProgress / 2, 10);

    if(frameCount % 100 == 0)
    {
      sleepProgress += 10;
      
      if(sleepProgress >= maxSleepProgress)
      {
        sleepProgress = 0;
        sleepUT.current = 0;
      }
    }
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