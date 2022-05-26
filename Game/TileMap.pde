public class TileMap{
  Tile[][] tileArray;
  
  public TileMap(){
    //every level will have a grid of 5 by 9 tiles
    tileArray = new Tile[5][9];
  }
  
  boolean add(Tile tile, int row, int col){
    if (tileArray[row][col] == null) {
       tileArray[row][col] = tile;
       return true;
    }
    return false;
  }
  
  void displayAll(){
    for (Tile[] t: tileArray){
      for (Tile tile: t){
        if (tile != null) {
          tile.display();
        }
      }
    }
  }
  
  void runAll(){
    for (Tile[] t: tileArray){
      for(Tile tile: t){
         if (tile != null) {
          tile.runPlant();
        }
      }
    }
  }
  
  
}
