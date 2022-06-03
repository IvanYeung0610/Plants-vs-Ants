LevelManager g;
Level[] levels = new Level[3];
RestartButton retry;
void setup(){
  size(1400,900);
  
  // ADD MORE LEVELS HERE:
  levels[0] = new DemoLevel();
  levels[1] = new DemoLevel2();
  levels[2] = new DemoLevel3();
  
  // Set to levels to LevelManager;
  g = new LevelManager(levels);
  retry = new RestartButton("RestartButton.png", width/2 - 200, height/2 + 200, 100, 50, "RestartButton");
}

void reset(){
  // ADD MORE LEVELS HERE:
  g.levels[0] = new DemoLevel();
  g.levels[1] = new DemoLevel2();
  g.levels[2] = new DemoLevel3();
}

void draw(){
  background(50, 121, 168);
  g.run();
  if (g.levels[g.currentLevel].gameOver == true) {
    retry.display();
  }
}

void mouseClicked(){
  g.handleMouseClicked();
  if (g.levels[g.currentLevel].gameOver == true && retry.overButton()) {
    reset();
  }
}
