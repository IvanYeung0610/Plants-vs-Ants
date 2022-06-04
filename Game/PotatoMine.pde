public class PotatoMine extends Plant {
  int timer;
  boolean primed;
  int exploded;

  PotatoMine(float xcoor, float ycoor) {
    super("PotatoMine.png", xcoor + 20, ycoor + 30, 50, 50, 5, 25);
    timer = 100;
    primed = false;
    exploded = -1;
  }

  Sprite action() {
    if (timer > 0) {
      timer--;
    } else if (timer == 0) {
      image = loadImage("PotatoMineBullet.png");
      Width = 90;
      Height = 90;
      x -= 25;
      y -= 30;
      image.resize(Width,Height);
      timer = -1;
      primed = true;
    }
    if(exploded > 0) {
      exploded--;
    }
    return null;
  }
  
  void setExploded() {
    exploded = 60;
    image = loadImage("Explosion.png");
    Width = 200;
    Height = 200;
    x -= 25;
    y -= 30;
    image.resize(Width,Height);
  }
  
  boolean isPrimed(){
    return primed;  
  }
  
  String getType(){
    return "PotatoMine";
  }
}
