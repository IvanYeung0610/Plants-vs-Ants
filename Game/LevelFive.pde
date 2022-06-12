public class LevelFive extends GameLevel {
  final int ROW1 = 180;
  final int ROW2 = 324;
  final int ROW3 = 468;
  final int ROW4 = 612;
  final int ROW5 = 756;

  LevelFive() {
    super(new ArrayList<Button>(), 5);

    sceneButtons.add(new PlantButton("SunflowerButton.png", 0, 0, 150, 100, "Sunflower"));
    sceneButtons.add(new PlantButton("PeashooterButton.png", 160, 0, 150, 100, "Peashooter"));
    sceneButtons.add(new PlantButton("WallnutButton.png", 320, 0, 150, 100, "Wallnut"));
    sceneButtons.add(new PlantButton("PotatoMineButton.png", 480, 0, 150, 100, "PotatoMine"));
    sceneButtons.add(new PlantButton("SnowPeaButton.png", 640, 0, 150, 100, "SnowPea"));
    sceneButtons.add(new PlantButton("CherryBombButton.png", 640, 0, 150, 100, "CherryBomb"));
  }

  void run() {
    super.run();

    stroke(225);
  }

  void SetWave() {
    AntList ant = new AntList();
    ant.add(new FireAnt("FireAnt.png", 1800, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 1900, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 1800, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 1900, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 1800, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 1900, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2100, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2100, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2100, ROW2, 100, 50, 15, 10000));


    Wave W0 = new Wave(ant);
    waves[0] = W0;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new Ant("Ant.png", 1450, ROW1, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1550, ROW2, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1650, ROW3, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1750, ROW4, 100, 50, 15, 1));
    ant.add(new Ant("Ant.png", 1850, ROW5, 100, 50, 15, 1));
    ant.add(new HatAnt("Ant.png", 1800, ROW1, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW1 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1800, ROW2, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW2 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1900, ROW3, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW3 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1900, ROW4, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW4 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1800, ROW5, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW5 - 5, 25, 25, 10)));
    ant.add(new FireAnt("FireAnt.png", 2400, ROW1, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2400, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2400, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2400, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2400, ROW5, 100, 50, 15, 10000));


    Wave W1 = new Wave(ant);
    waves[1] = W1;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW1 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW2 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW3 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW4 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW5 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW1 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW2 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW3 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW4 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW5 - 20, 130, 100, 20, 0));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW1, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW5, 100, 50, 15, 10000));

    Wave W2 = new Wave(ant);
    waves[2] = W2;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new HatAnt("Ant.png", 1450, ROW1, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW1 - 2, 25, 25, 20))); 
    ant.add(new HatAnt("Ant.png", 1450, ROW2, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW2 - 2, 25, 25, 20))); 
    ant.add(new HatAnt("Ant.png", 1450, ROW3, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW3 - 2, 25, 25, 20))); 
    ant.add(new HatAnt("Ant.png", 1450, ROW4, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW4 - 2, 25, 25, 20))); 
    ant.add(new HatAnt("Ant.png", 1450, ROW5, 100, 50, 15, 1, new Hat("BucketHat.png", 2200, ROW5 - 2, 25, 25, 20))); 
    ant.add(new HatAnt("Ant.png", 1800, ROW1, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW1 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1800, ROW2, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW2 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1800, ROW3, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW3 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1800, ROW4, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW4 - 5, 25, 25, 10)));
    ant.add(new HatAnt("Ant.png", 1800, ROW5, 100, 50, 15, 1, new Hat("ConeHat.png", 1800, ROW5 - 5, 25, 25, 10)));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW1, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2000, ROW5, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2200, ROW1, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2200, ROW2, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2200, ROW3, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2200, ROW4, 100, 50, 15, 10000));
    ant.add(new FireAnt("FireAnt.png", 2200, ROW5, 100, 50, 15, 10000));

    Wave W3 = new Wave(ant);
    waves[3] = W3;

    ant = new AntList();
    //ADD MORE ANTS HERE:
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW1 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW2 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW3 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW4 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 5 + 10, ROW5 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW1 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW2 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW3 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW4 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 6 + 10, ROW5 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 7 + 10, ROW1 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 7 + 10, ROW2 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 7 + 10, ROW3 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 7 + 10, ROW4 - 20, 130, 100, 20, 0));
    ant.add(new AntMound("AntMound.png", 104 + 144 * 7 + 10, ROW5 - 20, 130, 100, 20, 0));

    Wave W4 = new Wave(ant);
    waves[4] = W4;
  }
}
