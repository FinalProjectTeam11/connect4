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
  column_length = 7;
  row_length = 6;
  mouse = new Mouse();
  runner = new GameRunner(column_length, row_length); //<>//
  size(1200, 800);
  
  
  gameStatus = false;
  
  boardWidth = 700;
  boardHeight = 600;
  boardX = width - boardWidth - ((width - boardWidth)/2); //<>//
  boardY = height - boardHeight - ((height - boardHeight)/2) + 50; //<>//
  
  gridLength = 100;
  bounceLimit = 50;
  
  starter = false;
}

void draw(){
  //displays board
  background(230); //<>//
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
  mouse.overColumn(bounce);
  
  //check winner
  gameStatus = runner.checkBoard();
  gameStatus = runner.checkEnd();
  String winner = runner.checkWinner();
  //checks status of winner and game
  //if (gameStatus && (winner.equals("RED") || winner.equals("BLACK"))){
  //  System.out.println("THE WINNER IS " + winner);
  //}
  //else if (gameStatus && winner.equals("")){
  //  System.out.println("THE GAME IS TIED");
  //}
}

void mouseClicked(){
  currentColumn = mouse.columnNumber();
  if (currentColumn >= 0 && currentColumn <= 6 && runner.gravityCount[currentColumn] < row_length){
    if (!starter && runner.gravityCount[currentColumn] < row_length){
      runner.drop(currentColumn, 'r');
      starter = !starter;
    }
    else if (starter && runner.gravityCount[currentColumn] < row_length){
      runner.drop(currentColumn, 'b');
      starter = !starter;
    }
  }
}