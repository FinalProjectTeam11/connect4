import processing.sound.*;
SoundFile bg_music; //import sound file and use for background music

// void setup

bg_music = new SoundFile(this, "backgroundmusic.mp3"); //play and loop sound file 
  bg_music.loop();
  
void mousePressed() {
  bg_music.stop();
  }  
  
