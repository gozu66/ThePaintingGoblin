PImage[] images;
PImage bg;
int num = 1;
int r,g,b;

void makeGoodArt()
{  
  //size(256, 256);
  //noStroke();
  //frameRate(1);
  paused = true;
  int rnd = 4;
  images = new PImage[rnd];
  r = (int)random(20, 255); 
  g = (int)random(20, 255);
  b = (int)random(20, 255);
  //background(r, g, b);
  fill(r,g,b);
  rect(0,0,256,256);
  
  for(int i = 0; i < images.length; i++)
  {
      String name = str((int)random(30) + 1);
      images[i] = loadImage("img (" + name + ").png");
      int a = (int)random(45, 75);
      tint(r,g,b,a);
      image(images[i], 0, 0, 256, 256);
  }
  
  addNoise();
}

void scanLines(int vertHoriz)
{
  if(vertHoriz == 0)
  {
    
  }
  else
  {
    
  }
  //Add verticle rects
  //Effect pixels below
}

void addNoise()
{
  int randPixelCoordW1 = (int)random(256);
  int randPixelCoordH1 = (int)random(256);
  int randWidth1 = (int)random(30, 40);
  int randHeight1 = (int)random(30, 40);
  int randPixelCoordW2 = (int)random(256);
  int randPixelCoordH2 = (int)random(256);
  int randWidth2 = (int)random(30, 40);
  int randHeight2 = (int)random(30, 40);
  int randPixelCoordW3 = (int)random(256);
  int randPixelCoordH3 = (int)random(256);
  int randWidth3 = (int)random(30, 40);
  int randHeight3 = (int)random(30, 40);
  
  for(int i = 0; i <images.length; i++)
  {
    images[i].loadPixels();
  }
  loadPixels();
  for(int x = 0; x < 128; x++)
  {
    for(int y = 0; y < 128; y++)
    {
      int index = x+y*width;
      if(x > randPixelCoordW1 - randWidth1 && x < randPixelCoordW1 + randWidth1 && y > randPixelCoordH1 - randHeight1 && y < randPixelCoordH1 + randHeight1){pixels[index] = 
    images[(int)random(images.length-1)].pixels[(int)random(16000)];}
      if(x > randPixelCoordW2 - randWidth2 && x < randPixelCoordW2 + randWidth2 && y > randPixelCoordH2 - randHeight2 && y < randPixelCoordH2 + randHeight2){pixels[index] = 
    images[(int)random(images.length-1)].pixels[(int)random(16000)];}
      if(x > randPixelCoordW3 - randWidth3 && x < randPixelCoordW3 + randWidth3 && y > randPixelCoordH3 - randHeight3 && y < randPixelCoordH3 + randHeight3){pixels[index] = 
    images[(int)random(images.length-1)].pixels[(int)random(16000)];}
    }
  }
  updatePixels();
  //String name = "currImage";
  //save("\\data\\"+name+".png");
  //bg = loadImage(name + ".png");

  //tint(r,g,b);
  //image(bg, 0, 0, 256, 256);
}

void ellipses()
{
  //add ellipses and 
}

//void draw()
//{
  
//}

//void keyPressed()
//{
//  if(key == 'r')
//  {
//    setup();
//  }
//  if(key == ' ' && paused)
//  {
//   selectFolder("Select a folder to process:", "folderSelected");
//  }
//}

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