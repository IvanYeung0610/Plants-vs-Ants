public class Sunflower extends Plant{
  
  public Sunflower(String img, float xcoor, float ycoor) {
    super(img, xcoor, ycoor, 100, 100, 6, 50);
    timer = 360; //600 frames = 10 sec at 60 fps (Peashooter will shoot every 1.5 sec)
  }
  
  Sprite action(){
    if (timer == 0){
      timer = 1440; //suns after the first one take 24 secs
      Sun returnSprite = new Sun("Sun.png", this.x + this.Width/2, this.y, "Sun");
      returnSprite.setBottomLevel(this.y + this.Height/2); //will experiment and change this
      returnSprite.setXVel((int)(5 * Math.random()) - 2); //Will change/experiment
      returnSprite.setYVel(-3); // Will change/experiment
      return returnSprite;     
    } else {
      timer--;
      return null;
    }
  }
  String getType(){
    return "Sunflower";
  }
}
