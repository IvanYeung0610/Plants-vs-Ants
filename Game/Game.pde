LevelManager g;
Level[] levels = new Level[3];
void setup(){
  size(1400,900);
  
  // ADD MORE LEVELS HERE:
  levels[0] = new DemoLevel();
  levels[1] = new DemoLevel2();
  levels[2] = new DemoLevel3();
  
  // Set to levels to LevelManager;
  g = new LevelManager(levels);
}

void draw(){
  background(50, 121, 168);
  g.run();
}

void mouseClicked(){
  g.handleMouseClicked();
  if (g.levels[g.currentLevel].gameOver == true)
}
