void showPaintingProgress()
{
  fill(20);
  rect(easel.pos.x, easel.pos.y - 20, 50, 10);
  fill(15, 200, 15);
  rect(easel.pos.x, easel.pos.y - 20, paintingProgress / 2, 10);
}

int paintingProgress = 0;
int paintingComplete = 100;

void bePainting()
{
  if(frameCount % 100 == 0)
  {
    paintingProgress += 10;
    if(paintingProgress >= paintingComplete)
    {
      paintingProgress = 0;
    }
  }
}