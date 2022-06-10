LevelManager g;
Level[] levels = new Level[3];
Button retry, quit, mainMenu, nextLevel, previousLevel, setting;
void setup() {
  size(1400, 900);

  // ADD MORE LEVELS HERE:
  levels[0] = new MainMenu();
  levels[1] = new DemoLevel2();
  levels[2] = new DemoLevel();

  // Set to levels to LevelManager;
  g = new LevelManager(levels);
  retry = new Button("Retry.png", width/2 + 50, height/2 + 200, 100, 50, "RestartButton");
  quit = new Button("Quit.png", width/2 - 150, height/2 + 200, 100, 50, "QuitButton");
  mainMenu = new Button("MainMenu.png", width/2 - 50, height/2 + 200, 100, 50, "MainMenuButton");
  nextLevel = new Button("RightArrow.png", 1140, height/2 - 200, 200, 200, "NextLevelButton");
  previousLevel = new Button("LeftArrow.png", 40, height/2 - 200, 200, 200, "PreviousLevelButton");
  setting = new Button("Retry.png", 1500, 100, 100, 100, "SettingButton");
}

void reset() {
  // ADD MORE LEVELS HERE:
  g.levels[0] = new MainMenu();
  g.levels[1] = new DemoLevel();
  g.levels[2] = new DemoLevel2();
}

void draw() {
  background(50, 121, 168);
  g.run();


  if (g.levels[g.currentLevel].gameOver || g.levels[g.currentLevel].levelComplete) {
    retry.display();
    quit.display();
    mainMenu.display();
  }
  if (g.levels[g.currentLevel].levelComplete) {
    if (g.currentLevel < g.getSize() - 1) {
      nextLevel.display();
    }
    if (g.currentLevel > 1) {
      previousLevel.display();
    }
  }
}

void mouseClicked() {
  g.handleMouseClicked();
  Level level = g.getCurrentLevel();
  if (level.gameOver && retry.overButton() || level.levelComplete && retry.overButton()) {
    reset();
  }
  if (level.gameOver && quit.overButton() || level.levelComplete && quit.overButton()) {
    exit();
  }
  if (level.gameOver && mainMenu.overButton() || level.levelComplete && mainMenu.overButton()) {
    g.currentLevel = 0;
    reset();
  }
  if (level.levelComplete && nextLevel.overButton() && g.currentLevel < g.getSize() - 1) {
    reset();
    g.playNext();
  }
  if ( level.levelComplete && previousLevel.overButton() && g.currentLevel > 1) {
    reset();
    g.playPrev();
  }
}

void keyPressed() {
  if (key == 'g') {
    g.levels[g.currentLevel].gameOver = true;
  }

  if (key == 'i') {
    g.levels[g.currentLevel].levelComplete = true;
  }

  if (key == 'x') {
    g.playNext();
  }

  if (key == 'z') {
    g.playPrev();
  }
}
