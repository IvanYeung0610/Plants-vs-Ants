public class Ant extends Sprite {
  int health, damage;
  float velocity;
  
  Ant(String image_name, int x, int y, int Width, int Height, int health, int damage){
    super(image_name, x, y, Width, Height);
    this.health = health;
    this.damage = damage;
  }
}
