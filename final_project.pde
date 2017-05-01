int dir;
GameRunner runner;
int column_length = 7;
int row_length = 6;
int bounceLimit = 50;
boolean gameStart, gameStatus;
int boardWidth, boardHeight, gridLength;
float boardX, boardY;
boolean starter; //red is false, black is true
color red = #FF0303;
color black = #080808;
Mouse mouse;

void setup(){
  size(1200, 800);
  runner = new GameRunner();
  gameStatus = false;
  
  boardWidth = 700;
  boardHeight = 600;
  boardX = width - boardWidth - ((width - boardWidth)/2);
  boardY = height - boardHeight - ((height - boardHeight)/2) + 50;
  
  gridLength = 100;
  
  starter = false;
  mouse = new Mouse();
}

void draw(){
  //displays board
  background(230);
  fill(#4215FF);
  rect(boardX, boardY, boardWidth, boardHeight);
  for (int i = 0; i < column_length; i++){
    for (int j = 0; j < row_length; j++){
      fill(255);
      ellipse(boardX + 50 + (i * gridLength), boardY + 50 + (j * gridLength), gridLength - 20, gridLength - 20);
    }
  }
  //updates mouse functions
  mouse.displayCoin(starter);
  float bounce = 0; //<>//
  int plusMinus = 1;
  if (bounce > bounceLimit || bounce < 0){
    plusMinus = plusMinus * -1;
  }
  else
    bounce = bounce + (plusMinus);
  mouse.overColumn(bounce);
    
  //updates board
  gameStatus = runner.checkBoard();
  if (!runner.checkEnd()){
    if (runner.checkWinner().equals("RED")){
    }
    else if (runner.checkWinner().equals("BLACK")){
    }
  }
}