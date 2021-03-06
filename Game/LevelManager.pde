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

  void playPrev() {
    currentLevel--;
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
    } else if (levels[currentLevel].levelComplete) {
      levels[currentLevel].intermission();
    } else if (levels[currentLevel].paused) {
      levels[currentLevel].pause();
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
