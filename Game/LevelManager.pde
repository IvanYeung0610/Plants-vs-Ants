public class LevelManager {
  Level[] levels;
  int currentLevel;

  public LevelManager(Level[] levels) {
    this.levels = levels;
    currentLevel = 0;
  }

  void playNext() {
    currentLevel++;
  }

  void run() {
    if (levels[currentLevel].levelComplete) {
      playNext();
    }
    
    if(currentLevel == 0){
      MainMenu m = ((MainMenu)levels[currentLevel]);
      if(m.getStarted()){
        currentLevel = m.getLevelSelected();
      }
    }
    
    if (levels[currentLevel].gameOver) {
      levels[currentLevel].gameOver();
    } else {
      levels[currentLevel].run();
    }
  }

  void handleMouseClicked() {
    levels[currentLevel].handleMouseClicked();
  }
}
