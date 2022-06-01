public class LawnMower extends Sprite {
  boolean activated;
  public LawnMower(String image_name, float x, float y, int Width, int Height){
    super(image_name, x, y, Width, Height);
    activated = false;
  }
  
  void process(Ant ant) {
    if (this.checkCollision(ant)) {
      activated = true;
      ant.takeDamage(ant.getHealth());
    } 
  }
  
  void move(){
    if (activated) {
      this.x += 7;
    }
  }
  
}
