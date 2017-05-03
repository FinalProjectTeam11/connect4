class GameRunner{
  char[][] grid;
  int[] gravityCount;
  int columnNum, rowNum;
  int turn;
  int turn_limit;
  char winner;
  
  public GameRunner(int columnNum, int rowNum){
    this.columnNum = columnNum;
    this.rowNum = rowNum;
    grid = new char[columnNum][rowNum];
    gravityCount = new int[columnNum];
    turn_limit = columnNum * rowNum;
    turn = 0;
    for (int i = 0; i < columnNum; i++){
      for (int j = 0; j < rowNum; j++){
        grid[i][j] = ' ';
      }
    }
    
    for (int i = 0; i < rowNum; i++){
      gravityCount[i] = 0;
    }
    
    //for (int i = 0; i < gravityCount.length; i++){
    //  System.out.println("gravityCount[" + i + "]: " + gravityCount[i]);
    //}
    //for (int i = 0; i < grid.length; i++){
    //  for (int j = 0; j < grid[0].length; j++){
    //    System.out.println("grid[" + i + "][" + j + "]: " + grid[i][j]);
    //  }
    //} //<>//
  }
  
  public boolean drop(int column, char player){
    if (column < 0 || column > columnNum)
      return false;
      
    if (gravityCount[column] < rowNum){
      grid[column][rowNum - gravityCount[column] - 1] = player;
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
          ellipse(boardX + 50 + (i * gridLength), boardY + 50 + (j * gridLength), gridLength - 20, gridLength - 20);
        }
        else if (grid[i][j] == 'b'){
          fill(black);
          ellipse(boardX + 50 + (i * gridLength), boardY + 50 + (j * gridLength), gridLength - 20, gridLength - 20);
        }
      }
    }
  }
  
  public boolean checkBoard(){
    //check east
    for (int i = 0; i < columnNum - 3; i++){
      for (int j = 0; j < rowNum; j++){
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
        for (int j = 0; j < row_length - 3; j++){
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
        for (int j = 0; j < row_length - 3; j++){
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
  
  public void printGrid(){
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        System.out.println("grid[" + i + "][" + j + "]: " + grid[i][j]);
      }
    }
  }
  
  
}