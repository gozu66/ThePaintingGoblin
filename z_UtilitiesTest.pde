boolean play; 

void drawGrid()
{  
  background(200);
  textSize(12);

  fill(0);
  float  utilityNum = 1.0;
  float valueNum = 0.1;
  
  rectMode(CENTER);
  
    for (int i = 100; i < 600; i += 50)
    {
      stroke(150);
      line(i, height - 50, i, 100);
      line(50, i, 600, i);

      text(utilityNum, 50, i);
      utilityNum -= 0.1f;
      
      text(valueNum, i + 25, width - 50);
      valueNum += 0.1;  
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
String functionType = "Linear";

void drawUT()
{
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text(functionType, width / 2, 50);
  textAlign(BASELINE);
  textSize(15);
  
  if(value > 1)
  {
    value = 1;
  }
  
   switch(state)
   {
     case 0:
     //LINEAR EQUATION  
     //Y = MC+X
     
     utility  = abs(value - 1);
     value += 0.01f;
                    
     break;
     
     case 1:
     //STEP
     //if x > 0.5 then UT = 1.0 else UT = 0
     utility = (value >= 0.5f) ? 1 : 0;
     value += 0.01f;
     
     break;
     
     case 2:
     //EXPONENTIAL Increase
     //y = x^a where a>1
     // F(x) =  y  =  ab^x
     
     float exp1 = 2f;
     utility = pow(value, exp1);
     value += 0.01f;
     
     break;
     
     
     case 3:
     //LOGARITHMIC Increase
     //y = x^a where 0 < a < 1
     
     float exp2 = 0.5f;
     utility = pow(value, exp2);
     value += 0.01f;
     
     break;
     
     case 4:
     //EXPONENTIAL decay
     //y = a^x where 0 < a < 1
     
     float exp3 = 0.1f;
     utility = pow(exp3, value);
     value += 0.01f;
     
     break;
     
     case 5:
     //SIGNOID CURVE
     //y = 1/(1+e^x) (or y = 1/1+e^-x for reverse)
          
     utility = 1/(1 + exp(4*value)); 
     value += 0.01f;
     fill(255,0,0);
     ellipse(350 + (value * 250), (height - 100) - (utility * 500), 5, 5); 
     
     break;
     
     case 6:
     //LOGARITHMIC Decay
           
//     utility = -log(value)/ -log(exp4);
//     utility = utility / 9;
//     value += 0.01f;  
          
//     utility = -exp(value);
//     value += 0.01f;


     break;
   }

   noStroke();
   fill(255, 0, 0);

   if(state != 5)
   {
     ellipse(100 + (value * 500), (height - 100) - (utility * 500), 5, 5);
     line(prevX, prevY, 100 + (value * 500), (height - 100) - (utility * 500));


     prevX = 100 + (value * 500);
     prevY = (height - 100) - (utility * 500);
     
   }
}
float prevX = 0, prevY = 0;


//void keyPressed()
//{
//  if(key == ' ')
//  {
//    if(!play)
//    {
//      play = true;
//      return;
//    } 
//    
//    drawGrid();
//    
//    state = (state >= 5) ? 0 : state + 1;
//    
//    if(state == 5)
//    {
//      value = -1;
//    }
//    else 
//    {
//      value = 0;
//    }
//    switch(state)
//    {
//      case 0:
//        functionType = "Linear";
//      break;
//      
//      case 1:
//        functionType = "Step Function";
//      break;
//      
//      case 2:
//        functionType = "Exponential Increase";
//      break;
//      
//      case 3:
//        functionType = "Logarithmic Increase";
//      break;
//      
//      case 4:
//        functionType = "Exponential Decay";
//      break;
//      
//      case 5:
//        functionType = "Signoid Curve";
//      break;
//      
//      case 6:
//        functionType = "Logarithmic Decay";
//      break;
//    }
//  }
//  if(key == 'p')
//  {
//    play = !play;
//  }
//}
