public class HatAnt extends Ant {
  Hat hat;

  public HatAnt(String image_name, float x, float y, int Width, int Height, int health, int damage, Hat hat) {
    super(image_name, x, y, Width, Height, health, damage);
    this.hat = hat;
  }

  void display() {
    super.display();
    hat.display();
  }

  void takeDamage(int damage) {
    if (hat == null) {
      super.takeDamage(damage);
    } else {
      hat.takeDamage(damage);
    }
  }

  void dropHat() {
    if (hat != null) {
      if (hat.getHealth() <= 0) {
        hat.dropHat();
      }
      if (hat.y == this.y + this.Height) {
        hat = null;
      }
    }
  }
}
