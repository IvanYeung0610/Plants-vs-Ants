public class FireAnt extends Ant {
  boolean onFire;
  public FireAnt(String image_name, float x, float y, int Width, int Height, int health, int damage) {
    super(image_name, x, y, Width, Height, health, damage);
    onFire = true;
    timer = 90;
  }

  void getChilled() {
    if (onFire) {
      onFire = false;
      image = loadImage("Ant.png");
      image.resize(Width, Height);
      damage = 1;
    } else {
      chilled = true;
      velocity = .18;
      // CHANGE SPRITE HERE:
      image = loadImage("ChilledAnt.png");
      image.resize(Width, Height);
    }
  }
  
    int attack() {
    if (timer == 0) {
      timer = 90;
      return damage;
    } else {
      timer --;
      return 0;
    }
  }
}
