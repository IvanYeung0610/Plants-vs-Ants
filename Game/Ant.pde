public class Ant extends Sprite {
  int health, damage;
  float velocity;
  
  Ant(String image_name, float x, float y, int Width, int Height, int health, int damage){
    super(image_name, x, y, Width, Height);
    this.health = health;
    this.damage = damage;
    velocity = .5;
  }
  void display(){
    super.display();
    text(health, x + Width / 2, y);
  }
  
  void move(){
    x -= velocity;
  }
  
  void changeVelocity(int newV){
    velocity = newV;
  }
  
  void takeDamage(int Damage){
    health -= Damage;
  }
  
  int getHealth(){
    return health;
  }
}
