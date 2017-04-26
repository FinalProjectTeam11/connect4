import processing.sound.*;

//import sound file and use for background music
//background music starts with game and player can choose to turn it off
SoundFile bg_music; 

SoundFile drop_chip;
SoundFile connect4;
SoundFile winner;
SoundFile loser;

// initialize booleans so sound plays when any of them are true

boolean connect 4 = false; 
boolean drop_chip = false; 
boolean win = false;
boolean lost = false;

boolean stop_bg = true;

// void setup

bg_music = new SoundFile(this, "backgroundmusic.mp3"); //play and loop sound file 
  bg_music.loop();

/*
void mousePressed() {
  stop_bg = False;
  if (stop_bg == False) {
    bg_music.stop();
  }  
} */
  
