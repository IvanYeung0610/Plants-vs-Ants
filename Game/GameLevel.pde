public class GameLevel extends Level {
  Wave[] waves;
  int currentWave;
  int sun;
  BulletList bullets;
  SunList suns;
  TileMap tiles;
  AntList currentAnts;
  
  // HoverRectangle hover; will be added later.
  
  
  GameLevel(ArrayList<Button> sceneButtons){
    super(sceneButtons);
    currentWave = 0;
    sun = 0;
    bullets = new BulletList(new ArrayList<Bullet>());
    suns = new SunList();
    currentAnts = new AntList();
    
    tiles = new TileMap();
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){
        Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
        tiles.add(t, i, j);
      }
    }
    
  }
  
  void run() {
    // this ties all the classes together.
    
    tiles.displayAll();
    tiles.runAll();
    
    if(currentAnts.size() == 0){
      nextWave();
      //setCurrentAnts(); Doesnt work rn because Waves is empty.
    }
    
    suns.displayAll();
    suns.moveAll();
    sun += suns.processAll() * 50;

    
    currentAnts.displayAll();
    currentAnts.moveAll();
    int bulletCount = bullets.size();
    for(int i = 0; i < bulletCount; i++){
      if(currentAnts.takeDamage(bullets.get(i))) {
        bullets.remove(i);
      }
    }
  }
  
  void handleMouseClicked(){
    for(int i = 0; i < sceneButtons.size(); i++){
      if (sceneButtons.get(i).overButton()) {
        sceneButtons.get(i).clickButton();
        // UNCHECK ALL OTHER SCENE BUTTONS;
      }
    }
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){
        Tile currentTile = tiles.get(i,j);
        if(currentTile.overButton()){
          if(currentTile.plant == null){
            for(int x = 0; x < sceneButtons.size(); x++){
              if(sceneButtons.get(x).getType().equals("PlantButton")){
                // DO THIS LATER.
              }
            }
            
          }
        }
      }
    }
    for(int i = 0; i < suns.size(); i++){
      if (suns.get(i).overButton()) {
        suns.get(i).clickButton();
      }
    }
    
  }
  void setPlant(Tile t, String name){
    
  }
  
  void unCheck(){ // unchecks all scenebuttons.
    for(int i = 0; i < sceneButtons.size(); i++){
      if (sceneButtons.get(i).isClicked()){
        sceneButtons.get(i).clickButton();
      }
    }
  }
  
  void setCurrentAnts(){
    currentAnts = waves[currentWave].getIncomingAnts();
  }
  
  void nextWave(){
    currentWave++;
  }
}
