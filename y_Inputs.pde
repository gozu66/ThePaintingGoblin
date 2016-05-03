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
    folderSelect = false;
    paused = false;
  }
}