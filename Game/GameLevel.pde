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
    tiles = new TileMap();
    currentAnts = new AntList();
  }
  
  void run() {
    // this ties all the classes together.
    
  }
  
  void setCurrentAnts(){
    
  }
  
  void nextWave(){
  
  }
}
