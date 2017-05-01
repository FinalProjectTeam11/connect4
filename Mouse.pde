class Mouse extends GameRunner{
  
  public Mouse(){
  }
  
  public void displayCoin(boolean starter){
    if (mouseX > 250 && mouseX < 950 && mouseY < 700 && mouseY > 50){
      if (starter) fill(#000000);
      else fill(#FF0000);
      ellipse(mouseX, mouseY, gridLength-10, gridLength-10);
    }
  }
  
  public void overColumn(float bounce){
    if (mouseX > 250 && mouseX < 950 && mouseY < 700 && mouseY > 50){
      for (int i = 0; i < column_length; i++){
        if (mouseX > 250 + (i*100) && mouseX < 250 + ((i+1)*100)){
          //triangle
          noStroke();
          fill(255);
          triangle(250 + (i * 100) + 50, 90 + bounce, 250 + (i * 100), 60 + bounce, 250 + ((i+1)*100), 60 + bounce);
        
          //square
          rect(250 + (i * 100) + 25, 20 + bounce, 50, 40);
        }
      }
    }
  }
  
  void mousePressed(){
  }
}