TileMap tiles;
void setup(){
  size(1400,900);
  tiles = new TileMap();
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 9; j++){
      Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
      tiles.add(t, i, j);
    }
  }
}

void draw(){
  background(45, 162, 204);
  tiles.displayAll();
}

void mouseClicked(){
  
}
