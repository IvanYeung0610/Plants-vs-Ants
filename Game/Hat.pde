public class Hat extends Sprite {
  int health;
  float xVelocity, yVelocity;
  public Hat(String image_name, float x, float y, int Width, int Height, int health) {
    super(image_name, x, y, Width, Height);
    this.health = health;
    this.xVelocity = 0;
    this.yVelocity = 0;
  }

  int getHealth() {
    return health;
  }

  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
      xVelocity = .1;
      yVelocity = 3;
    }
  }

  void dropHat() {
    x += xVelocity;
    y += yVelocity;
  }
}
