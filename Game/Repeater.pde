public class Repeater extends Plant {
  boolean shot;
  int timer;
  
  Repeater(float xcoor, float ycoor){
    super("projectilePea.png", xcoor, ycoor, 100, 100, 10, 175);
  }
  
  Sprite action(){
    if (timer == 0){
      timer = 80;
      return new Bullet("projectilePea.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);    //Will experiment with bullet y value 
    } else if(shot){
      timer = 10;
      shot = false;
      return null;
    }else {
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
