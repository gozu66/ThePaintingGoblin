void setup()
{
  size(960, 540);
  
  gob = new Goblin(width / 2, height / 2);
  
  easelSpot = new PVector(width * 0.8, height - 110);
  easel = new Appliance(easelSpot, "easel");
  
  bedSpot = new PVector(width * 0.2f, height - 110);
  bed = new Appliance(bedSpot, "bed");
  
  kitchenSpot = new PVector(width * 0.8f, 110);
  kitchen = new Appliance(kitchenSpot, "kitchen");
}

Goblin gob;

Appliance easel, bed, kitchen;

PVector easelSpot, bedSpot, kitchenSpot;

boolean paused;

color grey = color(100, 100, 100);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);  

void draw()
{
  if(!paused)
  {

    background(100);
    rectMode(CENTER);
    fill(255);
    rect(width / 2, height / 2, 700, 440);
  
    time();
    easel.update();
    bed.update();
    kitchen.update();
    gob.update();
    
    
    showPaintingProgress();
    showStatus();
  }
  inputs();
}

void showStatus()
{
  textSize(15);
  fill(0);
  text("Currently feeling " + gob.currentUT._name, 10, height - 10);
}