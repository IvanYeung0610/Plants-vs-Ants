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
