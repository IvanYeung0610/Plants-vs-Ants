public class PotatoMine extends Plant {
  boolean primed;

  PotatoMine(float xcoor, float ycoor) {
    super("PotatoMine.png", xcoor + 20, ycoor + 30, 50, 50, 3, 25);
    timer = 1100;
    primed = false;
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
    return null;
  }
  
  boolean isPrimed(){
    return primed;  
  }
  
  String getType(){
    return "PotatoMine";
  }
}
