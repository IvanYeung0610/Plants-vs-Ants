public class TileMap {
  Tile[][] tileArray;

  public TileMap() {
    //every level will have a grid of 5 by 9 tiles
    tileArray = new Tile[5][9];
  }

  boolean add(Tile tile, int row, int col) {
    if (tileArray[row][col] == null) {
      tileArray[row][col] = tile;
      return true;
    }
    return false;
  }

  Tile get(int row, int col) {
    return tileArray[row][col];
  }

  void displayAll() {
    for (Tile[] t : tileArray) {
      for (Tile tile : t) {
        if (tile != null) {
          tile.display();
        }
      }
    }
  }
  void displayAllTester(){
    for (Tile[] t : tileArray) {
      for (Tile tile : t) {
        if (tile != null) {
          tile.displayTester();
        }
      }
    }
  }
  
  boolean takeDamage(Ant ant) {
    for (Tile[] x : tileArray) {
      for (Tile t : x) {
        if (t.getPlant() != null) {
          if (t.getPlant().checkCollision(ant)) {
            t.getPlant().takeDamage(ant.attack());
            return true;
          }
        }
      }
    }
    return false;
  }

    void checkAntMound(Ant ant) {
      for (Tile[] x : tileArray) {
        for (Tile t : x) {
          if (t.checkCollision(ant)) {
            t.setOccupied(true);
            t.plant = null;
          } else {
            t.setOccupied(false);
          }
        }
      }
    }
  }
