public class LevelManager {
  Level[] levels;
  int currentLevel;

  public LevelManager(Level[] levels) {
    this.levels = levels;
    currentLevel = 0;
  }

  void playNext() {
    currentLevel++;
    levels[currentLevel].run();
  }

  void playPrev() {
    currentLevel--;
    levels[currentLevel].run();
  }

  void run() {

    if (currentLevel == 0) {
      MainMenu m = ((MainMenu)levels[currentLevel]);
      if (m.getStarted()) {
        currentLevel = m.getLevelSelected();
      }
    }

    if (levels[currentLevel].gameOver) {
      levels[currentLevel].gameOver();
    } else if (levels[currentLevel].levelComplete && currentLevel != levels.length - 1) {
      levels[currentLevel].intermission();
    } else {
      levels[currentLevel].run();
    }
  }

  void handleMouseClicked() {
    levels[currentLevel].handleMouseClicked();
  }

  int getSize() {
    return levels.length;
  }

  Level getCurrentLevel() {
    return levels[currentLevel];
  }
}
