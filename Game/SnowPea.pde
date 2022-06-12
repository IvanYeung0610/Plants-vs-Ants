public class SnowPea extends Plant {
  int timer;
  SnowPea(float xcoor, float ycoor) {
    super("SnowPea.png", xcoor, ycoor, 100, 100, 7, 150);
  }

  Sprite action(AntList ants) {
    if (timer <= 0 && checkLOS(ants)) {
      timer = 90;
      Bullet b = new Bullet("SnowPeaProjectile.png", this.x + this.Width/2, this.y + this.Height/6, 30, 30, 1);
      b.setType("snow");
      return b; //Will experiment with bullet y value
    } else {
      timer--;
      return null;
    }
  }
  boolean checkLOS(AntList ants) {
    //print("hello");
    for (int i = 0; i < ants.size(); i++) {
      if (ants.get(i).checkCollision(lineOfSight)) {
        return true;
      }
    }
    return false;
  }

  void resetTimer() {
    timer = 90;
  }

  String getType() {
    return "SnowPea";
  }
}
