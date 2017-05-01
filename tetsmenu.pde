
import controlP5.*;

Boolean playPressed = false;
Boolean settingsPressed = false;
Boolean back = false;
ControlP5 cp5;
ControlP5 cp6;




String textValue = "";

 
int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
int rectW = 90;
int rectH = 30;
color rectColor,  baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;
boolean rectOver2 = false;
boolean rectOver3 = false;


{
   
}
 



 
 void setup(){
   cp5 = new ControlP5(this);
    cp6 = new ControlP5(this);
  size(640, 360);
  rectColor = color(255);
  rectHighlight = color(51);  
  baseColor = color(102);
  currentColor = baseColor;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  
  
  cp5.addTextfield("input2")
     .setPosition(20,100)
     .setSize(200,40)     
     .setFocus(true)
     .setColor(color(255,0,0));
 
  cp5.addButton("player1Input")
     .setValue(0)
     .setPosition(300,100)
     .setSize(50,50)
     ;
    
    
    
    
  cp6.addTextfield("input2")
     .setPosition(20,100)
     .setSize(400,40)     
     .setFocus(true)
     .setColor(color(255,0,0));
  
  cp6.addButton("player2Input")
     .setValue(0)
     .setPosition(500,100)
     .setSize(50,50)
     ;
     
    cp5.setVisible(false);
    cp6.setVisible(false);
  

  
  
 }

 
void draw(){  
   background(0);
   
  fill(255);
  //text(cp5.get(Textfield.class,"input").getText(), 360,130);
  text(textValue, 360,180);
   if (!playPressed){
     
     
     
   fill(255);
   rect(200,0,250,30);
   String s = "CONNECT 4";
   fill(50);
   text(s, 200, 0, 70, 80); 
   update();  
   //first Button
   ///////
   if (rectOver) {
    fill(rectHighlight);} 
   else {
    fill(rectColor);}
  stroke(255);
  rect(rectX, rectY, rectW, rectH);
   //Second Button
   ///////
  if (rectOver2) {
    fill(rectHighlight);} 
   else {
    fill(rectColor);}
  stroke(255);
  rect(rectX ,rectY + 50, rectW, rectH);
  
  if (rectOver3) {
    fill(rectHighlight);} 
   else {
    fill(rectColor);}
  stroke(255);
  rect(rectX ,rectY + 100, rectW, rectH);
  
  
  fill(0,0,255);
  
   


   }
   
   
   if(!settingsPressed && !playPressed ){
     
     text("Play",rectX , rectY, 70, 80);
   text("settings",rectX , rectY+50, 70, 80);
   text("Credits",rectX ,rectY+100, 70, 80);
     
   }
   if (settingsPressed){
   text("Sound",rectX , rectY, 70, 80);
   text("Custom Textures",rectX , rectY+50, 70, 80);
   text("No Name Input",rectX ,rectY+100, 70, 80);
   if (rectOver3) {
   fill(rectHighlight);} 
   else {
   fill(rectColor);}
   stroke(255);
   rect(0 ,10, rectW, rectH);
   text("Back",0 ,10, 70, 80);
   fill(0,0,255);
     
   }
   
   
  
   
}


//void showImage1(){
//  rect(50,50,100,100);}


void mouseClicked(){
  if(rectOver){
    
    
    playPressed = true;
    back = false;
  }
   if(rectOver2){
   settingsPressed = true;
   back = false;
  }
  if (back){
    settingsPressed = false;
    playPressed = false;}
  }

 
 boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width &&  mouseY >= y && mouseY <= y+height) {
    return true;} 
  else {
    return false;}
}
  
  
void update() {
   if ( overRect(rectX, rectY, rectW, rectH) ) {
    rectOver = true; 
    rectOver2 = false;}
    else if ( overRect(rectX, rectY + 50, rectW,rectH) ) {
    rectOver = false;
    rectOver2 = true;}
    else if ( overRect(rectX, rectY + 100, rectW,rectH) ) {
    rectOver = false;
    rectOver2 = false;
    rectOver3 = true;}
    else {
    rectOver = rectOver2 = rectOver3 = false;
    }
    if(overRect(0 ,10, rectW, rectH)){
      back = true;
      
    }
}

//void controlEvent(ControlEvent theEvent) {
//  if(theEvent.isAssignableFrom(Textfield.class)) {
//    println("controlEvent: accessing a string from controller '"
//            +theEvent.getName()+"': "
//            +theEvent.getStringValue()
//            );
//  }
//}


//public void input(String theText) {
//  // automatically receives results from controller input
//  println("a textfield event for controller 'input' : "+theText);
//}


public void player1Input() {
 
  cp5.setVisible(false);
  cp6.setVisible(true);
  
}


public void player2Input() {
  
  
  
   cp5.setVisible(false);
   cp6.setVisible(false);
  
}


  
 