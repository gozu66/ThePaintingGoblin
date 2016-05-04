void showPaintingProgress()
{
  float x = easel.pos.x - 25; 
  float y = easel.pos.y - 40;
  fill(20);
  rect(x, y-30, 50, 10);
  fill(green);
  rect(x, y-30, paintingProgress / 2, 10);
}

int paintingProgress = 0;
int paintingComplete = 100;

void bePainting()
{
  if(frameCount % 100 == 0)
  {
    if(gob.atTarget)
    {
      paintingProgress += 8;
      //paintingProgress += 50;
    }
    if(paintingProgress >= paintingComplete)
    {
      paintingProgress = 0;
      makeGoodArt();
    }
  }
}