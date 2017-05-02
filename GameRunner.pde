class GameRunner{
  char[][] grid;
  int[] gravityCount;
  int turn;
  int turn_limit = column_length * row_length;
  char winner;
  
  public GameRunner(){
    grid = new char[7][6];
    for (int i = 0; i < column_length; i++){
      for (int j = 0; j < row_length; j++){
        grid[i][j] = ' ';
      }
    }
    
    gravityCount = new int[row_length];
    for (int i = 0; i < column_length; i++){
      gravityCount[i] = 0;
    }
    
    turn = 0;
  }
  
  public boolean drop(int column, char player){ //<>//
    if (column < 0 || column > column_length) //<>//
      return false;
       //<>//
    if (gravityCount[column] <= row_length){ //<>//
      grid[column][row_length - gravityCount[column]] = player;
      gravityCount[column]++;
      turn++;
      if (turn == turn_limit)
        return false;
      return true;
    }
    if (turn >= turn_limit)
      return false;
    else{
      return false;
    }
  }
  
  public void display(){
    //rect(boardX, boardY, boardWidth, boardHeight);
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (grid[i][j] == 'r'){
          fill(red);
        }
        else if (grid[i][j] == 'b'){
          fill(black);
        }
        ellipse(boardX + 50 + (i * gridLength), boardY + 50 + (j * gridLength), gridLength - 20, gridLength - 20);
      }
    }
  }
  
  public boolean checkBoard(){
    //check east
    for (int i = 0; i < column_length - 3; i++){
      for (int j = 0; j < row_length; j++){
        String line = "";
        if (gravityCount[i] > 0){
          line = line + grid[i][j] + grid[i+1][j] + grid[i+2][j] + grid[i+3][j];
          if (line.equals("rrrr") || line.equals("bbbb")){
            winner = line.charAt(0);
            return true;
          }    
        }
      }
    }
    
    //check southeast
    for (int i = 0; i < column_length - 3; i++){
      if (gravityCount[i]>=4){
        for (int j = 0; j < row_length - 3; j++){
          String line = "";
          line = line + grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2] + grid[i+3][j+3];
          if (line.equals("rrrr") || line.equals("bbbb")){
            winner = line.charAt(0);
            return true;
          }
        }
      }
    }
    
    //check south
    for (int i = 0; i < column_length; i++){
      if (gravityCount[i]>=4){
        for (int j = 0; j < row_length; j++){
          String line = "";
          line = line + grid[i][j] + grid[i][j+1] + grid[i][j+2] + grid[i][j+3];
          if (line.equals("rrrr") || line.equals("bbbb")){
            winner = line.charAt(0);
            return true;
          }
        }
      }
    }
    
    //check southwest
    for (int i = 3; i < column_length; i++){
      if (gravityCount[i] >= 4){
        for (int j = 0; j < row_length; j++){
          String line = "";
          line = line + grid[i][j] + grid[i-1][j+1] + grid[i-2][j+2] + grid[i-3][j+3];
          if (line.equals("rrrr") || line.equals("bbbb")){
            winner = line.charAt(0);
            return true;
          }
        }
      }
    }
    
    return false;
  }
  
  public boolean checkEnd(){
    if (winner == 'r' || winner == 'b'){
      return true;
      //return "RED";
    }
    else if (turn >= turn_limit){
      return true;
    }
    return false;
  }
  
  public String checkWinner(){
    if (winner == 'r'){
      return "RED";
    }
    
    else if (winner == 'b'){
      return "BLACK";
    }
    return "";
  }
  
  public void reset(){
    for (int i = 0; i < column_length; i++){
      for (int j = 0; j < row_length; j++){
        grid[i][j] = ' ';
      }
    }
    
    gravityCount = new int[column_length];
    for (int i = 0; i < column_length; i++){
      gravityCount[i] = 0;
    }
    
    turn = 0; 
  }
  
}