public class Peashooter extends Plant{
  int timer;
  
  public Peashooter(String img, int xcoor, int ycoor){
    //width, height, health, and cost are predetermined
    super(img, xcoor, ycoor, 144, 144, 10, 100);
    timer = 90; //90 frames = 1.5 sec at 60 fps (Peashooter will shoot every 1.5 sec)
  }
  
  Sprite action(){
    if (timer == 0){
      timer = 90;
      return new Bullet("ProjectilePea.png", this.x, this.y, 50, 50, 1);     
    } else {
      timer--;
      return null;
    }
  }
  
  void resetTimer(){
    timer = 90;
  }
}
