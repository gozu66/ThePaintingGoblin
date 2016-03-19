void setup()
{
  size(960, 540);
  frameRate(60);
  //drawGrid();    //UT TEST
  
  gob = new Goblin();
}

Goblin gob;

void draw()
{
  //if(play)
  //{
  //  drawUT();    //UT TEST
  //}
  
  gob.update();
}