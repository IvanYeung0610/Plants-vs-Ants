public class LevelOne extends GameLevel {
  final int ROW1 = 180;
  final int ROW2 = 324;
  final int ROW3 = 468;
  final int ROW4 = 612;
  final int ROW5 = 756;

  LevelOne() {
    super(new ArrayList<Button>(), 2);

    sceneButtons.add(new PlantButton("SunflowerButton.png", 0, 0, 150, 100, "Sunflower"));
    sceneButtons.add(new PlantButton("PeashooterButton.png", 160, 0, 150, 100, "Peashooter"));
    sceneButtons.add(new PlantButton("WallnutButton.png", 320, 0, 150, 100, "Wallnut"));
  }

  void run() {
    super.run();

    stroke(225);
  }

  void SetWave() {
    AntList ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1600, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1800, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 2000, ROW4, 100, 50, 15, 1));


    Wave W0 = new Wave(ant);
    waves[0] = W0;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1450, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1450, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1450, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1450, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1450, ROW5, 100, 50, 15, 1));

    Wave W1 = new Wave(ant);
    waves[1] = W1;
  }
}
