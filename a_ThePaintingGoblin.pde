void setup()
{
  size(960, 540);
  //frameRate(60);
  
  gob = new Goblin(width / 2, height / 2);
  
  easelSpot = new PVector(width * 0.8, height - 110);
  easel = new Appliance(easelSpot.x, easelSpot.y, "easel");
  
  bedSpot = new PVector(width * 0.2f, height - 110);
  bed = new Appliance(bedSpot.x, bedSpot.y, "bed");
}

Goblin gob;

Appliance easel, bed;
PVector easelSpot, bedSpot;

void draw()
{ 
  background(100);
  fill(255);
  rect(130, 50, 700, 440);
  
  time();
  inputs();
  easel.update();
  bed.update();
  gob.update();
  
  showPaintingProgress();
}