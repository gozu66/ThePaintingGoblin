//PImage[] images;
//int num = 1;

//void setup()
//{  
//  size(256, 256);
//  noStroke();
//  int rnd = 10;
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
//  println(r+g+b + " / " + (255*3));
//}

//void draw()
//{
  
//}

//void keyPressed()
//{
//  println("x");
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

//void verticalLines()
//{
//  //Add verticle rects
//  //Effect pixels below
//}

//void horizontalLines()
//{
//  //Add horizontal rects
//  //Effect pixels below
//}

//void ellipses()
//{
//  //add ellipses and 
//}