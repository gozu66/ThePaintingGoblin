//PImage[] images;
//int num = 1;

//void setup()
//{  
//  size(256, 256);
//  background(255);
//  noStroke();
//  int rnd = 10;
//  images = new PImage[rnd];
  
//  int r = (int)random(20, 255), g = (int)random(20, 255), b = (int)random(20, 255);
//  for(int i = 0; i < images.length; i++)
//  {
//      String name = str((int)random(40) + 1);
//      images[i] = loadImage("img (" + name + ").png");
//      int a = (int)random(75, 150);
//      tint(r,g,b,a);
//      image(images[i], 0, 0, 256, 256);
//  }
//}

//void keyPressed()
//{
//  if(key == 'r')
//  {
//    println("x");
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