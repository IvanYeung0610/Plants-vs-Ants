public class Repeater extends Plant {
  int timer;
  
  Repeater(float xcoor, float ycoor){
    super("Repeater.png", xcoor, ycoor, 100, 100, 7, 175);
    timer = 90;
  }
  
  Sprite action(){
    if (timer == 0){
      timer = 90;
      return new Bullet("ProjectilePea.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);
    } else if(timer == 10){
      timer--;
      return new Bullet("ProjectilePea.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);
    }  else {
      timer--;
      return null;
    }
  }
  
  void resetTimer(){
    timer = 80;
  }
  
  String getType(){
    return "Repeater";
  }
}
