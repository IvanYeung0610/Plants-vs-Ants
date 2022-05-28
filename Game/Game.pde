GameLevel g;
void setup(){
  size(1400,900);
  ArrayList<Button> sceneButtons = new ArrayList<Button>();
  PlantButton test = new PlantButton("PeashooterButton.png",0,0, 150, 90, "Peashooter");
  PlantButton test1 = new PlantButton("SunflowerButton.png",160,0, 150, 90, "Sunflower");
  sceneButtons.add(test);
  sceneButtons.add(test1);
  g = new GameLevel(sceneButtons);
}

void draw(){
  background(100);
  g.run();
}

void mouseClicked(){
  g.handleMouseClicked();
}
