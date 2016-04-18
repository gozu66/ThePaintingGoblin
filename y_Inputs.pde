boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode] = true;
}
void keyReleased()
{
  keys[keyCode] = false;
}

boolean folderSelect = false;
void inputs()
{
  if(keys[' '] && paused && !folderSelect)
  {
    folderSelect = true;
    selectFolder("Select a folder to process:", "folderSelected");
  }
  
  if(keys['r'] && paused && !folderSelect)
  {
    //folderSelect = false;
    paused = false;
  }
  
  //if(keys[UP] || keys['W'])
  //{
  //  gob.move(0);
  //}
  //if(keys[DOWN] || keys['S'])
  //{
  //  gob.move(1);
  //}
  //if(keys[LEFT] || keys['A'])
  //{
  //  gob.rotation(1);
  //}
  //if(keys[RIGHT] || keys['D'])
  //{
  //  gob.rotation(0);
  //}    
}