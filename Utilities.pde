void setupUT()
{
  background(200);

  fill(0);
  int utilityNum = 10;
  int valueNum = 1;
  
  rectMode(CENTER);
  for (int i = 100; i < 600; i += 50)
  {
    text(utilityNum, 50, i + 25);
    utilityNum--;
    
    text(valueNum, i + 25, width - 50);
    valueNum++;

    stroke(150);
    line(i + 25, height - 100, i + 25, 100);
    line(100, i, 600, i);
  }
  
  rectMode(CORNERS);
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(100, 100, 600, 600);
  strokeWeight(1);
  rectMode(CORNER);
}


float value = 0, prevValue = 0;
float utility = 0, prevUT = 0;
int state = 0;

void drawUT()
{
  if(value > 10 || value < 0)
  {
    value = (value > 10) ? 10 : 0;
  }
  
   switch(state)
   {
     case 0:
     //LINEAR EQUATION  
     //Y = MC+X
     
     prevUT = utility;
     utility  = abs(value - 10);
     
     noStroke();
     fill(255, 0, 0);
     ellipse(100 + (value * 50), (height - 100) - (utility * 50), 5, 5);
          
     value += 1;
     
     break;
     
     
     case 1:
     //EXPONENTIAL 
     break;
     
     
     case 2:
     //LOGARITHMIC 
     break;
     
     
     case 3:
     //SIGNOID CURVE
     break;
   }
}