public class Explosion extends Sprite{
  int timer;
  Explosion(String ExplosionName, float x, float y, int Length, int Width) {
    super(ExplosionName, x - 25, y - 40, Length, Width);
    timer = 70;
  }
  
  void display(){
    super.display();
    timer--;
  }
  int getTimer(){
    return timer;
  }
}
