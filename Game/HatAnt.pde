public class HatAnt extends Ant {
  Hat hat;

  public HatAnt(String image_name, float x, float y, int Width, int Height, int health, int damage, Hat hat) {
    super(image_name, x, y, Width, Height, health, damage);
    this.hat = hat;
  }

  void display() {
    super.display();
    if (hat != null) {
      hat.display();
      //text(hat.getHealth(), hat.x, hat.y - 10);  
      if (hat.getHealth() > 0) {
        hat.setX((int)x + 8);
      } else {
        dropHat();
      }
    }
    fill(0);
  }

  void takeDamage(int damage) {
    if (hat == null || hat.getHealth() <= 0) {
      super.takeDamage(damage);
    } else {
      hat.takeDamage(damage);
      if(damage - hat.getHealth() > 0){
        super.takeDamage(damage - hat.getHealth());
      }
    }
  }

  void dropHat() {
    if (hat != null) {
      if (hat.getHealth() <= 0) {
        hat.dropHat();
      }
      if (hat.y >= this.y + this.Height) {
        hat = null;
      }
    }
  }
}
