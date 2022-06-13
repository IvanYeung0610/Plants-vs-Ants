public class TesterLevel extends GameLevel {
  final int ROW1 = 180;
  final int ROW2 = 324;
  final int ROW3 = 468;
  final int ROW4 = 612;
  final int ROW5 = 756;
  
  TesterLevel(){
    super(new ArrayList<Button>(), 5);
    
    sceneButtons.add(new PlantButton("SunflowerButton.png",0,0, 150, 100, "Sunflower"));
    sceneButtons.add(new PlantButton("PeashooterButton.png",160,0, 150, 100, "Peashooter"));
    sceneButtons.add(new PlantButton("WallnutButton.png",320,0, 150, 100, "Wallnut"));
    sceneButtons.add(new PlantButton("PotatoMineButton.png",480,0, 150, 100, "PotatoMine"));
    sceneButtons.add(new PlantButton("SnowPeaButton.png",640,0, 150, 100, "SnowPea"));
    sceneButtons.add(new PlantButton("CherryBombButton.png",800,0, 150, 100, "CherryBomb"));
    sceneButtons.add(new PlantButton("RepeaterButton.png",960,0, 150, 100, "Repeater"));
    setButtonTimers();
  }
  void setButtonTimers(){
    for (int j = 0; j < sceneButtons.size(); j++) {
      ((PlantButton)sceneButtons.get(j)).setTimerTester();
    }
  }
  void run(){
    sun = 9999;
    super.run();
    tiles.displayAllTester();
    currentAnts.displayAllTester();
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
    ant.add(new Ant("Ant.png", 2200, ROW5, 100, 50, 15, 1));
    
    ant.add(new HatAnt("Ant.png", 2000, ROW1, 100, 50, 15, 1, new Hat("ConeHat.png", 2200, ROW1 - 5, 25, 25, 10)));
    
    
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW3 - 20, 130, 100, 20, 0));
    
    Wave W0 = new Wave(ant);
    waves[0] = W0;
    
    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1330, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1300, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 2000, ROW5, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW4, 100, 50, 15, 1));
    
    ant.add(new HatAnt("Ant.png", 1400, ROW3, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW3 - 2, 25, 25, 20)));
    ant.add(new HatAnt("Ant.png", 1400, ROW1, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW1 - 2, 25, 25, 20)));
    
    Wave W1 = new Wave(ant);
    waves[1] = W1; 
    
    ant = new AntList();
    //ADD MORE ANTS HERE:
    
    
    Wave W2 = new Wave(ant);
    waves[2] = W2; 
    
    ant = new AntList();
    //ADD MORE ANTS HERE:
    
    Wave W3 = new Wave(ant);
    waves[3] = W3; 
    
    ant = new AntList();
    //ADD MORE ANTS HERE:
    
    Wave W4 = new Wave(ant);
    waves[4] = W4; 
  }
}
