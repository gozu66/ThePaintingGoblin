import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music;

boolean startScreen = true;

void setup()
{
  size(960, 540);
  
  minim = new Minim(this);
  music = minim.loadFile("audio\\goblinTheme.wav");
  music.setGain(100);
  
  loadSprites();
  
  gob = new Goblin(width / 2, height / 2, gobSprite);
  
  easelSpot = new PVector(width * 0.79, height - 125);
  easel = new Appliance(easelSpot, "easel", easelSprite);
  
  bedSpot = new PVector(width * 0.2f, height - 125);
  bed = new Appliance(bedSpot, "bed", bedSprite);
  
  kitchenSpot = new PVector(width * 0.79f, 125);
  kitchen = new Appliance(kitchenSpot, "kitchen", kitchenSprite);  
}

PImage floorSprite, easelSprite, bedSprite, kitchenSprite, gobSprite;

void loadSprites()
{
  floorSprite = loadImage("textures\\floor.png");
  easelSprite = loadImage("textures\\easel.png");
  bedSprite = loadImage("textures\\bed.png");
  kitchenSprite = loadImage("textures\\kitchen.png");
  gobSprite = loadImage("textures\\artist.png");
}

Goblin gob;

Appliance easel, bed, kitchen;

PVector easelSpot, bedSpot, kitchenSpot;

boolean paused;

color grey = color(100, 100, 100);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);  

PFont font;
void draw()
{
  if(startScreen)
  {
    background(200);
    textAlign(CENTER);
    font = createFont("fonts\\Dragon is coming.otf", 200);
    textFont(font);
    fill(0);
    text("The Painting Goblin", width / 2, height * 0.5f);
    textSize(50);
    text("Press Enter to Start", width / 2, height * 0.6f);
    
    if(keyPressed)
    {
      startScreen = false;
      font = createFont("fonts\\Fragmentcore.otf", 200);
      music.play();
      music.loop();
    }
  }else{
  
  if(!paused)
  {

    background(100);
    imageMode(CENTER);
    rectMode(CENTER);
    fill(255);
    //rect(width / 2, height / 2, 700, 440);
    tint(255);
    image(floorSprite, width / 2, height / 2, 700, 440);
  
    time();
    easel.update();
    bed.update();
    kitchen.update();
    gob.update();
    
    showPaintingProgress();
    showStatus();
  }
  else
  {
    gob.render();
  }
    inputs();
  }
}
void showStatus()
{
  textFont(font);
  textSize(40);
  fill(0);
  text("Currently feeling " + gob.currentUT._name, 500, height - 10);
}