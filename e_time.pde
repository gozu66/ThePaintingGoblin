int mins = 00, hours = 00, day = 1;

void time()
{
  if(frameCount % 5 == 0)
  {
    mins += 1; 
    
    if(mins >= 60)
    {
      mins = 0;
      hours += 1;
      hours = hours % 24;
      if(hours == 0)
      {
        day++;
      }
    }
  }
  
  String _hours = addZeros(hours);
  String _mins = addZeros(mins);
  textSize(20);
  text(_hours + ":" + _mins, width - 100, 20);
  text("Day " + day, width - 100, 40);
  textSize(10);
}

String addZeros(int i)
{
  if(i < 10)
  {
     String ret = "0" + str(i);
     return ret;
  }
  return str(i);
}