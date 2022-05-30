GameLevel g;
void setup(){
  size(1400,900);
  ArrayList<Button> sceneButtons = new ArrayList<Button>();
  PlantButton test = new PlantButton("PeashooterButton.png",0,0, 150, 100, "Peashooter");
  PlantButton test2 = new PlantButton("SunflowerButton.png",170,0, 150, 100, "Sunflower");
  PlantButton test3 = new PlantButton("WallnutButton.png",340,0, 150, 100, "Wallnut");
  sceneButtons.add(test);
  sceneButtons.add(test2);
  sceneButtons.add(test3);
  g = new GameLevel(sceneButtons);
}

void draw(){
  background(100);
  g.run();
}

void mouseClicked(){
  g.handleMouseClicked();
}
