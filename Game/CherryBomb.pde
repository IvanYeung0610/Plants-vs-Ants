public class CherryBomb extends Plant{
  
  public CherryBomb(float xcoor, float ycoor){
    //width, height, health, and cost are predetermined
    super("CherryBomb.png", xcoor, ycoor, 120, 100, 5, 150);
    timer = 40; //90 frames = 1.5 sec at 60 fps (Peashooter will shoot every 1.5 sec)
  }
  Sprite action(){
    timer--;
    if(timer <= 0){
      health = 0;
      return new Bullet("ProjectilePea.png", this.x - 72, this.y - 72, 288, 288, 100);
    }
    return null;
  }
  String getType(){
    return "CherryBomb";
  }
}
