public class LevelTwo extends GameLevel {
  final int ROW1 = 180;
  final int ROW2 = 324;
  final int ROW3 = 468;
  final int ROW4 = 612;
  final int ROW5 = 756;

  LevelTwo() {
    super(new ArrayList<Button>(), 3);

    sceneButtons.add(new PlantButton("SunflowerButton.png", 0, 0, 150, 100, "Sunflower"));
    sceneButtons.add(new PlantButton("PeashooterButton.png", 160, 0, 150, 100, "Peashooter"));
    sceneButtons.add(new PlantButton("WallnutButton.png", 320, 0, 150, 100, "Wallnut"));
    sceneButtons.add(new PlantButton("PotatoMineButton.png", 480, 0, 150, 100, "PotatoMine"));
  }

  void run() {
    super.run();

    stroke(225);
  }

  void SetWave() {
    AntList ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1400, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW5, 100, 50, 15, 1));


    Wave W0 = new Wave(ant);
    waves[0] = W0;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1400, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW5, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW5, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1850, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1850, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1850, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1850, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1850, ROW5, 100, 50, 15, 1));
    Wave W1 = new Wave(ant);
    waves[1] = W1;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1400, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1400, ROW5, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1700, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1700, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1700, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1700, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1700, ROW5, 100, 50, 15, 1));
    //FOR CONE HAT:  5 above ant's row
    ant.add(new HatAnt("Ant.png", 1900, ROW1, 100, 50, 15, 1, new Hat("ConeHat.png", 1700, ROW1 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1900, ROW2, 100, 50, 15, 1, new Hat("ConeHat.png", 1700, ROW2 - 5, 25, 25, 10)));
    //FOR BUCKET HAT: 2 above ant's row
    ant.add(new HatAnt("Ant.png", 1900, ROW3, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW3 - 2, 25, 25, 20))); 
    ant.add(new HatAnt("Ant.png", 1900, ROW4, 100, 50, 15, 1, new Hat("ConeHat.png", 1700, ROW4 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1900, ROW5, 100, 50, 15, 1, new Hat("ConeHat.png", 1700, ROW5 - 5, 25, 25, 10)));

    Wave W2 = new Wave(ant);
    waves[2] = W2;
  }
}
