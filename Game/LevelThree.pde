public class LevelThree extends GameLevel {
  final int ROW1 = 180;
  final int ROW2 = 324;
  final int ROW3 = 468;
  final int ROW4 = 612;
  final int ROW5 = 756;

  LevelThree() {
    super(new ArrayList<Button>(), 3);

    sceneButtons.add(new PlantButton("SunflowerButton.png", 0, 0, 150, 100, "Sunflower"));
    sceneButtons.add(new PlantButton("PeashooterButton.png", 160, 0, 150, 100, "Peashooter"));
    sceneButtons.add(new PlantButton("WallnutButton.png", 320, 0, 150, 100, "Wallnut"));
    sceneButtons.add(new PlantButton("PotatoMineButton.png", 480, 0, 150, 100, "PotatoMine"));
    sceneButtons.add(new PlantButton("RepeaterButton.png", 640, 0, 150, 100, "Repeater"));
  }

  void run() {
    super.run();

    stroke(225);
  }

  void SetWave() {
    AntList ant = new AntList();
    ant.add(new Ant("Ant.png", 1600, ROW2, 100, 50, 15, 1));
    ant.add(new HatAnt("Ant.png", 2000, ROW2, 100, 50, 15, 1, new Hat("ConeHat.png", 1700, ROW2 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 2500, ROW3, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW3 - 2, 25, 25, 20))); 


    Wave W0 = new Wave(ant);
    waves[0] = W0;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1150, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW5, 100, 50, 15, 1));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW4, 100, 50, 15, 10000));

    Wave W1 = new Wave(ant);
    waves[1] = W1;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW1 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW4 - 20, 130, 100, 20, 0));
    ant.add(new Ant("Ant.png", 1600, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1600, ROW5, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW5, 100, 50, 15, 1));

    Wave W2 = new Wave(ant);
    waves[2] = W2;
  }
}
