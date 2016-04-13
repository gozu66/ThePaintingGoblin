int mins = 00, hours = 00;

void time()
{
  if(frameCount % 1 == 0)
  {
    mins += 1; 
    
    if(mins >= 60)
    {
      mins = 0;
      hours += 1;
      hours = hours % 24;
    }
  }
  
  String _hours = addZeros(hours);
  String _mins = addZeros(mins);
  textSize(20);
  text(_hours + ":" + _mins, width - 100, 20);
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