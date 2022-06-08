public class CherryBomb extends Plant{
  int timer;
  
  public CherryBomb(float xcoor, float ycoor){
    //width, height, health, and cost are predetermined
    super("ProjectilePea.png", xcoor, ycoor, 130, 100, 5, 150);
    timer = 30; //90 frames = 1.5 sec at 60 fps (Peashooter will shoot every 1.5 sec)
  }
}
