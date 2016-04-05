void setup()
{
  size(960, 540);
  frameRate(60);
  //drawGrid();    //UT TEST
  
  gob = new Goblin(width / 2, height / 2);
  
  easelSpot = new PVector(width * 0.8, height - 110);
  easel = new Appliance(easelSpot.x, easelSpot.y);
}

Goblin gob;

Appliance easel;
PVector easelSpot;

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
  
  showPaintingProgress();
}