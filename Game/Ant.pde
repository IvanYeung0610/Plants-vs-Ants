public class Ant extends Sprite {
  int health, damage;
  float velocity;
  boolean attacking;
  int timer;
  String type;
  boolean chilled;

  Ant(String image_name, float x, float y, int Width, int Height, int health, int damage) {
    super(image_name, x, y, Width, Height);
    this.health = health;
    this.damage = damage;
    velocity = .35;
    attacking = false;
    timer = 60;
    type = "Ant";
    chilled = false;
  }
  void getChilled(){
    chilled = true;
    velocity = .18;
    // CHANGE SPRITE HERE:
    image = loadImage("ChilledAnt.png");
    image.resize(Width, Height);
  }
  
  void display() {
    super.display();
    text(health, x + Width / 2, y);
  }

  void move() {
    if (attacking == false) {
      x -= velocity;
    }
  }

  void changeVelocity(int newV) {
    velocity = newV;
  }

  void takeDamage(int Damage) {
    health -= Damage;
  }

  int getHealth() {
    return health;
  }

  void setAttacking(boolean b) {
    attacking = b;
  }

  int attack() {
    if (timer == 0) {
      timer = 60;
      return damage;
    } else {
      timer --;
      return 0;
    }
  }

  String getType() {
    return type;
  }
}
