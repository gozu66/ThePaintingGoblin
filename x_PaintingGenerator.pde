//PImage[] images;
//PImage bg;
//int num = 1;

//void setup()
//{  
//  size(256, 256);
//  noStroke();
//  frameRate(1);
//  int rnd = 3;
//  images = new PImage[rnd];
  
//  int r = (int)random(20, 255), g = (int)random(20, 255), b = (int)random(20, 255);
//  background(r, g, b);
  
//  for(int i = 0; i < images.length; i++)
//  {
//      String name = str((int)random(40) + 1);
//      images[i] = loadImage("img (" + name + ").png");
//      int a = (int)random(45, 75);
//      tint(r,g,b,a);
//      image(images[i], 0, 0, 256, 256);
//  }
//  save("\\data\\currImage.png");
//  bg = loadImage("currImage.png");
//  image(bg, 0, 0, 256, 256);
//  addNoise();
//}

//void scanLines(int vertHoriz)
//{
//  if(vertHoriz == 0)
//  {
    
//  }
//  else
//  {
    
//  }
//  //Add verticle rects
//  //Effect pixels below
//}

//void addNoise()
//{
//  loadPixels();
//  bg.loadPixels();
//  for(int x = 0; x < width; x++)
//  {
//    for(int y = 0; y < height; y++)
//    {
//      int index = x+y*width;
//      //select random x + y to ignore / draw
//      bg.pixels[index] = bg.pixels[index]/2;
//    }
//  }
//  bg.updatePixels();
//  updatePixels();
  
//  tint(255,255,255, 100);
//  image(bg, 0, 0, 256, 256);
//}

//void ellipses()
//{
//  //add ellipses and 
//}

//void draw()
//{
  
//}

//void keyPressed()
//{
//  if(key == 'r')
//  {
//    setup();
//  }
//  if(key == ' ')
//  {
//   selectFolder("Select a folder to process:", "folderSelected");
//  }
//}

//void folderSelected(File selection) 
//{
// if (selection == null) 
// {
//   return;
// } 
// else 
// {
//   String dir2 = selection.getPath()+ "\\";
//   save(dir2 + "Painting("+num+").jpg");
//   num++;
// }
//}