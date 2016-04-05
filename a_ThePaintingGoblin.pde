void setup()
{
  size(960, 540);
  //frameRate(60);
  //drawGrid();    //UT TEST
  
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
  //if(play)
  //{
  //  drawUT();    //UT TEST
  //}
  
  background(100);
  fill(255);
  rect(130, 50, 700, 440);
  
  time();
  inputs();
  gob.update();
  easel.update();
  bed.update();
  
  showPaintingProgress();
}