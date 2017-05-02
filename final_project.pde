GameRunner runner;
Mouse mouse;

int column_length;
int row_length;
int boardWidth, boardHeight, gridLength;
float boardX, boardY;

int bounceLimit = 30;
float bounce = 0;
int plusMinus = 1;
int currentColumn;

boolean gameStart, gameStatus;

boolean starter; //red is false, black is true
color red = #FF0303;
color black = #080808;

void setup(){
  size(1200, 800);
  runner = new GameRunner();
  mouse = new Mouse();
  gameStatus = false;
  
  boardWidth = 700;
  boardHeight = 600;
  column_length = 7;
  row_length = 6;
  boardX = width - boardWidth - ((width - boardWidth)/2);
  boardY = height - boardHeight - ((height - boardHeight)/2) + 50;
  
  gridLength = 100;
  bounceLimit = 50;
  
  starter = false;
  runner.drop(0, 'r'); //<>//
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
  
  //displays coin pieces in board
  runner.display();
  
  //updates mouse functions
  mouse.displayCoin(starter);
  
  if (bounce > bounceLimit || bounce < 0){
    plusMinus = plusMinus * -1;
  }
  bounce = bounce + (plusMinus * 2);
  currentColumn = mouse.overColumn(bounce);
}

void mouseClicked(){
  currentColumn = mouse.overColumn(bounce);
  if (!starter)
    runner.drop(currentColumn, 'r');
  else
    runner.drop(currentColumn, 'b');
}