GameLevel level;

void setup(){
  size(1400,900);
  level = new GameLevel(null);
}

void draw(){
  background(18, 129, 184);
  level.run();
}

void mouseClicked(){
  //level.handleMouseClicked();
}
