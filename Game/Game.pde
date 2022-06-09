LevelManager g;
Level[] levels = new Level[3];
RestartButton retry;
QuitButton quit;
Sprite cursor;
void setup() {
  size(1400, 900);
  cursor = new Sprite("Cursor.png", 0, 0, 50, 50);
  
  // ADD MORE LEVELS HERE:
  levels[0] = new MainMenu();
  levels[1] = new DemoLevel();
  levels[2] = new DemoLevel2();

  // Set to levels to LevelManager;
  g = new LevelManager(levels);
  retry = new RestartButton("RestartButton.png", width/2 - 200, height/2 + 200, 100, 50, "RestartButton");
  quit = new QuitButton("QuitButton.png", width/2 + 50, height/2 + 200, 100, 50, "QuitButton");
}

void reset() {
  // ADD MORE LEVELS HERE:
  g.levels[0] = new DemoLevel();
  g.levels[1] = new DemoLevel2();
  g.levels[2] = new DemoLevel3();
}

void draw() {
  background(50, 121, 168);
  g.run();
  if (g.levels[g.currentLevel].gameOver == true) {
    retry.display();
    quit.display();
  }
  cursor.setX(mouseX);
  cursor.setY(mouseY);
  cursor.display();
}

void mouseClicked() {
  g.handleMouseClicked();
  if (g.levels[g.currentLevel].gameOver == true && retry.overButton()) {
    reset();
  }
  if (g.levels[g.currentLevel].gameOver == true && quit.overButton()) {
    exit();
  }
}
