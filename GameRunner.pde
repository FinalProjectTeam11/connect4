class GameRunner{
  char[][] grid;
  int[] gravityCount;
  int turn;
  int turn_limit = column_length * row_length;
  
  public GameRunner(){
    grid = new char[7][6];
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
  
  public boolean drop(int column, char player){
    if (column < 1 || column > 7)
      return false;
      
    if (turn > turn_limit)
      return false;
    
    if (gravityCount[column] < row_length){
      grid[column][(gravityCount[column]+6)%6] = player;
      gravityCount[column]++;
      turn++;
      return true;
    }
    else{
      return false;
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
            return true;
          }    
        }
      }
    }
    
    //check southeast
    for (int i = 0; i < column_length - 3; i++){
      if (gravityCount[i]>4){
        for (int j = 0; j < row_length - 3; j++){
          String line = "";
          line = line + grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2] + grid[i+3][j+3];
          if (line.equals("rrrr") || line.equals("bbbb")){
            return true;
          }
        }
      }
    }
    
    //check south
    for (int i = 0; i < column_length; i++){
      if (gravityCount[i]>4){
        for (int j = 0; j < row_length; j++){
          String line = "";
          line = line + grid[i][j] + grid[i][j+1] + grid[i][j+2] + grid[i][j+3];
          if (line.equals("rrrr") || line.equals("bbbb")){
            return true;
          }
        }
      }
    }
    
    //check southwest
    for (int i = 3; i < column_length; i++){
      if (gravityCount[i] > 4){
        for (int j = 0; j < row_length; j++){
          String line = "";
            line = line + grid[i][j] + grid[i-1][j+1] + grid[i-2][j+2] + grid[i-3][j+3];
            if (line.equals("rrrr") || line.equals("bbbb")){
            return true;
          }
        }
      }
    }
    
    return false;
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