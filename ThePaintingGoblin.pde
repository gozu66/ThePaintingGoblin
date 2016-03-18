void setup()
{
  size(700, 700);
  frameRate(100);
  drawGrid();
}

boolean play; 
void draw()
{
  if(play)
  {
    drawUT();
  }
  
  println(value + " value     " + utility + " utility");
}