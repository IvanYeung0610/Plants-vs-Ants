LevelManager g;
Level[] levels = new Level[5];
Sprite cursor;
Button retry, quit, mainMenu, nextLevel, previousLevel, pause, resume;

void setup() {
  size(1400, 900);
  cursor = new Sprite("Cursor.png", 0, 0, 40, 40);
  // ADD MORE LEVELS HERE:
  levels[0] = new MainMenu();
  levels[1] = new LevelOne();
  levels[2] = new LevelTwo();
  levels[3] = new LevelThree();
  levels[4] = new LevelFour();

  // Set to levels to LevelManager;
  g = new LevelManager(levels);
  retry = new Button("Retry.png", width/2 + 50, height/2 + 200, 100, 50, "RestartButton");
  quit = new Button("Quit.png", 610, height/2 + 200, 100, 50, "QuitButton");
  mainMenu = new Button("MainMenu.png", width/2 - 230, height/2 + 200, 100, 50, "MainMenuButton");
  nextLevel = new Button("RightArrow.png", 1140, height/2 - 200, 200, 200, "NextLevelButton");
  previousLevel = new Button("LeftArrow.png", 40, height/2 - 200, 200, 200, "PreviousLevelButton");
  pause = new Button("Pause.png", 1300, 10, 50, 50, "PauseButton");
  resume = new Button("Resume.png", width/2 + 190, height/2 + 200, 100, 50, "ResumeButton");
}

void reset() {
  // ADD MORE LEVELS HERE:
  g.levels[0] = new MainMenu();
  g.levels[1] = new LevelOne();
  g.levels[2] = new LevelTwo();
  g.levels[3] = new LevelThree();
}

void draw() {
  background(50, 121, 168);
  g.run();
  if (g.levels[g.currentLevel].gameOver || g.levels[g.currentLevel].levelComplete || g.levels[g.currentLevel].getPaused() || g.currentLevel == 0) {
    quit.display();
    if (g.currentLevel != 0) {
      mainMenu.display();
      retry.display();
    }
  }
  if (g.levels[g.currentLevel].levelComplete) {
    if (g.currentLevel < g.getSize() - 1) {
      nextLevel.display();
    }
    if (g.currentLevel > 1) {
      previousLevel.display();
    }
  }

  if (g.currentLevel != 0 ) {
    pause.display();
    if (g.levels[g.currentLevel].gameOver || g.levels[g.currentLevel].levelComplete || g.levels[g.currentLevel].getPaused()) {
      fill(0, 100);
      noStroke();
      rect(1300, 10, 50, 50);
      fill(255);
    }
  }
  if (g.levels[g.currentLevel].getPaused()) {
    resume.display();
  }

  cursor.setX(mouseX);
  cursor.setY(mouseY);
  cursor.display();
}

void mouseClicked() {
  g.handleMouseClicked();
  Level level = g.getCurrentLevel();
  if (level.gameOver && retry.overButton() || level.levelComplete && retry.overButton()|| g.levels[g.currentLevel].getPaused() && retry.overButton()) {
    reset();
  }
  if (level.gameOver && quit.overButton() || level.levelComplete && quit.overButton() || g.currentLevel == 0 && quit.overButton() || g.levels[g.currentLevel].getPaused() && quit.overButton()) {
    exit();
  }
  if (level.gameOver && mainMenu.overButton() || level.levelComplete && mainMenu.overButton() || g.levels[g.currentLevel].getPaused() && mainMenu.overButton()) {
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
  if ( pause.overButton() && !level.levelComplete && !level.gameOver) {
    level.setPaused(true);
  }
  if (g.levels[g.currentLevel].getPaused() && resume.overButton()) {
    level.setPaused(false);
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
