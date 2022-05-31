LevelManager g;
Level[] levels = new Level[1];
void setup(){
  size(1400,900);
  
  levels[0] = new DemoLevel();
  // ADD MORE LEVELS HERE:
  
  g = new LevelManager(levels);
}

void draw(){
  background(100);
  g.run();
}

void mouseClicked(){
  g.handleMouseClicked();
}
