public class Explosion extends Sprite{
  int timer;
  Explosion(float x, float y) {
    super("Explosion.png", x - 25, y - 40, 200, 200);
    timer = 80;
    
  }
  
  void display(){
    super.display();
    timer--;
  }
  int getTimer(){
    return timer;
  }
}
