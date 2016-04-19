PImage[] images;
PImage bg;
int num = 1;
int r,g,b;

void makeGoodArt()
{  
  paused = true;
  int rnd = 4;
  images = new PImage[rnd];
  r = (int)random(100, 255); 
  g = (int)random(100, 255);
  b = (int)random(100, 255);
  fill(r,g,b);
  rect(width / 2 - 128, height / 2 - 128,256,256);
  
  for(int i = 0; i < images.length; i++)
  {
      String name = str((int)random(30) + 1);
      images[i] = loadImage("img (" + name + ").png");
      int a = (int)random(45, 150);
      tint(r,g,b,a);
      image(images[i], width / 2 - 128, height / 2 - 128, 256, 256);
  }
  
  grabImagePixels();
}

void scanLines(int vertHoriz)
{
  if(vertHoriz == 0)
  {
    
  }
  else
  {
    
  }
}

void grabImagePixels()
{
  int[] randPixelCoordsW = new int[3];
  for(int i = 0; i < 3; i++)
  {
    randPixelCoordsW[i] =  width / 2 - 128 + (int)random(256);
  }
  
  int[] randPixelCoordsH = new int[3];
  for(int i = 0; i < 3; i++)
  {
    randPixelCoordsH[i] =  height / 2 - 128 + (int)random(256);
  }  
  
  int[] randWidth = new int[3];
  for(int i = 0; i < 3; i++)
  {
    randWidth[i] =  (int)random(30, 100);
  }

  int[] randHeight = new int[3];
  for(int i = 0; i < 3; i++)
  {
    randHeight[i] = (int)random(30, 100);
  }

  //int rndImage = (int)random(images.length - 1);
  //images[rndImage].loadPixels();
  for(int i = 0; i < images.length; i++)
  {
    images[i].loadPixels();
  }
  
  loadPixels();
  for(int x = 0; x < width; x++)
  {
    int rndImage = (int)random(images.length - 1);
    for(int y = 0; y < height; y++)
    {
      int index = x+y*width;
      int imageIndex = (x - (width / 2 - 128)) + (y - (height / 2 - 128)) * 255;
            
      if(x > width / 2 - 128 && x < width / 2 + 128 && y > height / 2 - 128 && y < height / 2 + 128)
      {
        //if(x > randPixelCoordsW[0] - randWidth[0] && x < randPixelCoordsW[0] + randWidth[0] && y > randPixelCoordsH[0] - randHeight[0] && y < randPixelCoordsH[0] + randHeight[0])
        {
          pixels[index] = images[rndImage].pixels[imageIndex];
        }
        //if(x > randPixelCoordsW[1] - randWidth[1] && x < randPixelCoordsW[1] + randWidth[1] && y > randPixelCoordsH[1] - randHeight[1] && y < randPixelCoordsH[1] + randHeight[1])
        //{
        //  pixels[index] = images[rndImage].pixels[imageIndex];
        //}
        //if(x > randPixelCoordsW[2] - randWidth[2] && x < randPixelCoordsW[2] + randWidth[2] && y > randPixelCoordsH[2] - randHeight[2] && y < randPixelCoordsH[2] + randHeight[2])
        //{
        //  pixels[index] = images[rndImage].pixels[imageIndex];
        //}
      }
    }
  }
  updatePixels();
}

void ellipses()
{
  //add ellipses and 
}

void folderSelected(File selection) 
{
 keys[' '] = false; 
 if (selection == null) 
 {
   paused = false;
   folderSelect = false;
   return;
 } 
 else 
 {
   String dir2 = selection.getPath()+ "\\";
   save(dir2 + "Painting("+num+").jpg");
   num++;
   paused = false;
   folderSelect = false;
 }
}