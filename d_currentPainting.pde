void showPaintingProgress()
{
  float x = easel.pos.x - 25; 
  float y = easel.pos.y - 40;
  fill(20);
  rect(x, y, 50, 10);
  fill(green);
  rect(x, y, paintingProgress / 2, 10);
}

int paintingProgress = 0;
int paintingComplete = 100;

void bePainting()
{
  if(frameCount % 100 == 0)
  {
    //paintingProgress += 8;
    paintingProgress += 100;
    
    if(paintingProgress >= paintingComplete)
    {
      paintingProgress = 0;
      makeGoodArt();
    }
  }
}