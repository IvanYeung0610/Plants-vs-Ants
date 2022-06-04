public class Hat extends Sprite {
  int health;
  float yVelocity;
  public Hat(String image_name, float x, float y, int Width, int Height, int health) {
    super(image_name, x, y, Width, Height);
    this.health = health;
    yVelocity = 3;
  }

  int getHealth() {
    return health;
  }

  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
    }
  }

  void dropHat() {
    y += yVelocity;
  }
}
