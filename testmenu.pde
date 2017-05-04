import controlP5.*;
Boolean t = false;

Boolean playPressed = false;
Boolean settingsPressed = false;
Boolean back = false;
Boolean creditsPressed = false;
Boolean gameOver = false;

Boolean player1Wins = false;
Boolean player2Wins = false;
ControlP5 cp5;
ControlP5 cp6;

Boolean restart = false;

PFont Font1;

PImage bg;
String [] playerNames = new String[2];

int totalPlayers = 0;
int playerCounter = 0;
int scorePlayer1 = 0;
int scorePlayer2 = 0;

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
Textfield a ;
 void setup(){
  cp5 = new ControlP5(this);
  cp6 = new ControlP5(this);
  size(600, 538);
  rectColor = color(255);
  rectHighlight = color(51);  
  baseColor = color(102);
  currentColor = baseColor;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;  
  //a = new Textfield(cp5,"");
  cp5.addTextfield("Enter Names")
     .setPosition(20,100)
     .setSize(200,40)     
     .setFocus(true)
     .setColor(color(255,0,0));
 
  cp5.addButton("Enter")
     .setValue(0)
     .setPosition(300,100)
     .setSize(50,50)
     ;
  cp5.addButton("buttonRestartYes")
     .setValue(0)
     .setPosition(300,300)
     .setSize(50,50)
     ;
     
   cp5.addButton("buttonRestartNo")
     .setValue(0)
     .setPosition(400,300)
     .setSize(50,50)
     ;
  
  bg = loadImage("connect-four.jpg");
  
   Font1 = createFont("Arial Bold", 18);
 }

 
void draw(){  
   background(bg);
   update();  
  fill(255);
  //text(cp5.get(Textfield.class,"input").getText(), 360,130);
  text(textValue, 360,180);
  
  cp5.get(Button.class,"buttonRestartYes").hide();
  cp5.get(Button.class,"buttonRestartNo").hide();
   if (playPressed){
    t = true;
  }
  if (t && totalPlayers != 2){
    cp5.get(Textfield.class,"Enter Names").show();
    cp5.get(Button.class, "Enter").show();}
  else{
    cp5.get(Textfield.class,"Enter Names").hide();// Controls Textbox
    cp5.get(Button.class, "Enter").hide();
  }
  
  if (totalPlayers == 2 && playPressed){
     text(playerNames[0],0 , 10, 100, 80);
     text(Integer.toString(scorePlayer1),0 , 40, 100, 80);
     text(playerNames[1],500 ,10, 100, 80);
     text(Integer.toString(scorePlayer2),500 , 40, 100, 80);}
     
     
    
    
    
  
 
   if (!playPressed && !settingsPressed && !creditsPressed){   
   
   fill(255);
   rect(200,0,200,30);
   String s = "CONNECT 4";
   fill(0,0,200);
   textSize(32);
   text(s, 200, 0, 300, 40); 
  
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
  if (rectOver2) {fill(rectHighlight);} else {fill(rectColor);}
  stroke(255);
  rect(rectX ,rectY + 50, rectW, rectH);
  
  if (rectOver3) {fill(rectHighlight);} else {fill(rectColor);}
   stroke(255);
   rect(rectX ,rectY + 100, rectW, rectH);
   textSize(14);
   fill(0,40,40);
   text("Play",rectX , rectY, 100, 80);
   text("Instructions",rectX , rectY+50, 100, 80);
   text("Credits",rectX ,rectY+100, 100, 80);}

   if (settingsPressed || creditsPressed){
     
   if (settingsPressed){
   textSize(12);
   text("The objective of the game is to form a straight line of tokens of equal color before the other player.\n Enter your name and your opponent's name.\n The game will keep track of the tally.",rectX , rectY, 360, 360);
   }
   else if (creditsPressed){
     fill(0);
     textSize(20);
     text("Menu, Interactivity and Design: Marco Alanis",rectX-40,rectY,500,100);
     text("Game Mechanics and : <>",rectX-40,rectY+50,500,100);
     text("Everything else: <>",rectX-40,rectY+100,500,100);
   }
     if (back) {
     fill(rectHighlight);} 
     else {
     fill(rectColor);}
     //stroke(255);
     rect(10 ,10, rectW, rectH);
     fill(0);
     text("Back",10 ,10, 70, 80);
   }
   if (player1Wins || player2Wins){
     gameOver = true;
     Font1 = createFont("Arial Bold", 18);
     if (player1Wins){
       String s  = playerNames[0] + " wins!";
       text(s, 200,200,100,40);
     }
     else if (player2Wins){
       String s  = playerNames[1] + " wins!";
       text(s, 200,200,100,40);
     }
      cp5.get(Button.class,"buttonRestartYes").show();
      cp5.get(Button.class,"buttonRestartNo").show();

   }
   
   
   }
   
 public void buttonRestartYes(){
   if (gameOver){
     
   player1Wins = false;
   player2Wins = false;
   restart = true;  
   gameOver = false;
   }
   
 }
 public void buttonRestartNo(){
   if (gameOver){
     
   exit();}
 }
     
     
  
     
     



//void showImage1(){
//  rect(50,50,100,100);}


void mouseClicked(){
  if(rectOver){    
    playPressed = true;
    }
   if(rectOver2){
   settingsPressed = true;
   }
   if (rectOver3){
     creditsPressed = true;
   }
   if (back){
    settingsPressed = false;
    playPressed = false;
    creditsPressed = false;
    }
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
    rectOver2 = false;
    rectOver3 = false;
    back = false;}
    else if ( overRect(rectX, rectY + 50, rectW,rectH) ) {
    rectOver = false;
    rectOver2 = true;
    rectOver3 = false;
    back = false;}
    else if ( overRect(rectX, rectY + 100, rectW,rectH) ) {
    rectOver = false;
    rectOver2 = false;
    rectOver3 = true;
    back=false;}
    
    else if (overRect(10 ,10, rectW, rectH)){
      back = true;
      rectOver = false;
      rectOver2 = false;
      rectOver3 = false;
    
    }
   
      
    
    else {
    rectOver = rectOver2 = rectOver3 = back = false;
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


public void Enter() {
  if (t && (totalPlayers != 2)){
  playerNames[playerCounter] = cp5.get(Textfield.class,"Enter Names").getText();
  cp5.get(Textfield.class,"Enter Names").clear();
  playerCounter++;
  totalPlayers++;
  }
  
  
  

  
}



//public void player2Input() {
  
  
  
//   cp5.setVisible(false);
//   cp6.setVisible(false);
  
//}


  
 