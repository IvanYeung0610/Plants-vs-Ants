LevelManager g;
Level[] levels = new Level[2];
void setup(){
  size(1400,900);
  
  //ArrayList<Button> sceneButtons = new ArrayList<Button>();
  //sceneButtons.add(new PlantButton("SunflowerButton.png",0,0, 150, 100, "Sunflower"));
  //  sceneButtons.add(new PlantButton("PeashooterButton.png",170,0, 150, 100, "Peashooter"));
  //  sceneButtons.add(new PlantButton("WallnutButton.png",340,0, 150, 100, "Wallnut"));
  levels[0] = new DemoLevel();
  levels[1] = new DemoLevel2();
  // ADD MORE LEVELS HERE:
  
  g = new LevelManager(levels);
}

void draw(){
  background(50, 121, 168);
  g.run();
}

void mouseClicked(){
  g.handleMouseClicked();
}
