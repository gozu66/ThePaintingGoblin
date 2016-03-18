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


float value = 0;
float utility = 0;
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
     
     utility  = abs(value - 10);
                    
     break;
     
     case 1:
     //STEP
     utility = (value > 5) ? 10 : 0; 
     break;
     
     case 2:
     //EXPONENTIAL Increase
     //y = x^a where a>1
     
     float exp1 = 1.05f;
     utility = pow(value, exp1);
     break;
     
     
     case 3:
     //LOGARITHMIC Increase
     //y = x^a where 0 < a < 1
     
     float exp2 = 0.47f;
     utility = pow(value, exp2);
     
     break;
     
     
     case 4:
     //SIGNOID CURVE
     break;
   }

   noStroke();
   fill(255, 0, 0);
   ellipse(100 + (value * 50), (height - 100) - (utility * 50), 5, 5);

   value += 0.1f;
}

void keyPressed()
{
  if(key == ' ')
  {
    setupUT();
    value = 0;
    utility = 0;
    state = (state > 4) ? 0 : state + 1;
  }
}