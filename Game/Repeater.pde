public class Repeater extends Plant {
  
  Repeater(float xcoor, float ycoor){
    super("Repeater.png", xcoor, ycoor, 100, 100, 7, 175);
    timer = 90;
  }
  
  Sprite action(AntList ants){
    if (timer <= 0 && checkLOS(ants)){
      timer = 90;
      return new Bullet("ProjectilePea.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);
    } else if(timer == 10 && checkLOS(ants)){
      timer--;
      return new Bullet("ProjectilePea.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);
    }  else {
      timer--;
      return null;
    }
  }
  
  boolean checkLOS(AntList ants) {
    for (int i = 0; i < ants.size(); i++) {
      if (ants.get(i).checkCollision(lineOfSight)) {
        return true;
      }
    }
    return false;
  }
  void resetTimer(){
    timer = 80;
  }
  
  String getType(){
    return "Repeater";
  }
  int getTimer(){
    return timer;
  }
}
