public class LevelManager{
  Level[] levels;
  int currentLevel;
  
  public LevelManager(Level[] levels){
    this.levels = levels;
    currentLevel = 0;
  }
  
  void playNext(){
    currentLevel++;
  }
  
  void run() {
    levels[currentLevel].run();
  }
  
  void handleMouseClicked(){
    levels[currentLevel].handleMouseClicked();
  }
}
