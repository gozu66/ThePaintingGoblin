void setup()
{
  size(960, 540);
  frameRate(60);
  //drawGrid();    //UT TEST
  
  gob = new Goblin(50, 50);
}

Goblin gob;

void draw()
{
  //if(play)
  //{
  //  drawUT();    //UT TEST
  //}
  inputs();
  gob.update();
}
