public class AntMound extends Ant {
  public AntMound(String image_name, float x, float y, int Width, int Height, int health, int damage) {
    super(image_name, x, y, Width, Height, health, damage);
    attacking = true;
    timer = 900;
  }

  int attack() {
    if (timer == 0) {
      timer = 900;
      return 1;
    } else {
      timer --;
      return 0;
    }
  }
}
