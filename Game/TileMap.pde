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
  
  Tile get(int row, int col){
    return tileArray[row][col];
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
  
  boolean takeDamage(Ant ant){
  for(Tile[] x : tileArray){
     for (Tile t: x) {
       if (t.plant != null){
        if(t.checkCollision(ant)) {
          t.plant.takeDamage(ant.attack());
          return true;
        }
       }
     }
  }
  return false;
}
  
  
}
