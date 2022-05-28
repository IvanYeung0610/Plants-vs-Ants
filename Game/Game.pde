GameLevel g;
void setup(){
  size(1400,900);
  ArrayList<Button> sceneButtons = new ArrayList<Button>();
  PlantButton test = new PlantButton("ProjectilePea.png",0,0, 50, 50, "Peashooter");
  sceneButtons.add(test);
  g = new GameLevel(sceneButtons);
}

void draw(){
  background(100);
  g.run();
}

void mouseClicked(){
  g.handleMouseClicked();
}
