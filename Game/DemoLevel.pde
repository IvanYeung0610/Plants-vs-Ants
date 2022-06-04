public class DemoLevel extends GameLevel {
  final int ROW1 = 180;
  final int ROW2 = 324;
  final int ROW3 = 468;
  final int ROW4 = 612;
  final int ROW5 = 756;
  
  DemoLevel(){
    super(new ArrayList<Button>(), 2);
    
    sceneButtons.add(new PlantButton("SunflowerButton.png",0,0, 150, 100, "Sunflower"));
    sceneButtons.add(new PlantButton("PeashooterButton.png",170,0, 150, 100, "Peashooter"));
    sceneButtons.add(new PlantButton("WallnutButton.png",340,0, 150, 100, "Wallnut"));
    sceneButtons.add(new PlantButton("PotatoMineButton.png",510,0, 150, 100, "PotatoMine"));
  }
  
  void run(){
    super.run();
    
    textAlign(LEFT);
    stroke(225);
    text("DEMO", 1000, 50);
  }
  
  void SetWave() {
    AntList ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1600, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1610, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1630, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1900, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 2000, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 2200, ROW1, 100, 50, 15, 1));
    
    Wave W0 = new Wave(ant);
    waves[0] = W0;
    
    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1600, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW5, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW1, 100, 50, 15, 1));
    
    Wave W1 = new Wave(ant);
    waves[1] = W1; 
  }
}
