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
  boolean atTarget;
  
  void goblinStart()
  {
    hungerUT = new Utility("hungry", 0.0f);
    sleepUT = new Utility("sleepy", 0.0f);
    creativity = new Utility("creative", 0.5f);
    currentUT = creativity;
  }
  
  void update()
  {
    if(currentTarget != null)
    {
      distToTarget = currentTarget.dist(pos);
      
      if(distToTarget < 1)
      {
        atTarget = true;
      }
      else
      {
        atTarget = false;
      }
    }
    
    forward.x = sin(theta);
    forward.y = -cos(theta);
    forward.mult(speed);

    if(!atTarget)
    {
      pos.add(forward);
    } 

    timedUtilities();
    
    switch(currentUT._name)
    {
      case "hungry":
        currentTarget = kitchen.pos;
        if(atTarget)
        {
          eat();
        }
      break;
      
      case "sleepy":
        currentTarget = bed.pos;
        if(atTarget)
        {
          sleep();
        }
      break;
      
      case "creative":
        currentTarget = easel.pos;
        if(atTarget)
        {
          bePainting();
        }
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
      hungerUT.current += 0.05f;
      sleepUT.current += 0.01f;
      
      hungerUT.current = clamp(hungerUT.current, 0, 1);
      sleepUT.current = clamp(sleepUT.current, 0, 1);
      
      currentUT = getCurrentUT();
    }
    
    fill(grey);
    rect(10, 10, 50, 10);
    rect(10, 30, 50, 10);
    rect(10, 50, 50, 10);
    fill(red);
    rect(10, 10, hungerUT.current * 50, 10);
    fill(blue);
    rect(10, 30, sleepUT.current * 50, 10);
    fill(green);
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
      fill(blue);
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

  float eatProgress = 0, maxEatProgress = 100;
  void eat()
  {
      float x = kitchen.pos.x - 25; 
      float y = kitchen.pos.y - 40;
      fill(20);
      rect(x, y, 50, 10);
      fill(red);
      rect(x, y, eatProgress / 2, 10);

    if(frameCount % 100 == 0)
    {
      eatProgress += 25;
      
      if(eatProgress >= maxEatProgress)
      {
        eatProgress = 0;
        hungerUT.current = 0;
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