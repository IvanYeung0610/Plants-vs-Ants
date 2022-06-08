public class Peashooter extends Plant{
  int timer;
  
  public Peashooter(String img, float xcoor, float ycoor){
    //width, height, health, and cost are predetermined
    super(img, xcoor, ycoor, 100, 100, 7, 100);
    timer = 90; //90 frames = 1.5 sec at 60 fps (Peashooter will shoot every 1.5 sec)
  }
  
  Sprite action(){
    if (timer == 0){
      timer = 90;
      return new Bullet("ProjectilePea.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);    //Will experiment with bullet y value 
    } else {
      timer--;
      return null;
    }
  }
  
  void resetTimer(){
    timer = 90;
  }
  
  String getType(){
    return "Peashooter";
  }
}
