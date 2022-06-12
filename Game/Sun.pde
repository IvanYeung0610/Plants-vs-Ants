public class Sun extends Button {
  boolean collected = false;
  float xVelocity, yVelocity, bottomLevel, xDist, yDist;
  int value;

  Sun(float xcoor, float ycoor, int size, int value) {
    super("Sun.png", xcoor, ycoor, size, size, "Sun");
    bottomLevel = (ycoor + 20);
    this.value = value;
  }

  Sun(String img, float xcoor, float ycoor, String type) {
    super(img, xcoor, ycoor, 80, 80, type);
    bottomLevel = (random(500) + 200);
    value = 50;
  }

  void move() {
    if (yVelocity < 2) { // increment yVel towards the Max.
      yVelocity += .15;
    }
    if (xVelocity != 0) { // increment xVel towards 0
      xVelocity -= (xVelocity * .07);
    } 

    x += xVelocity;

    if (y < bottomLevel) { // if y hasnt reached the bottomLevel, move it.
      y += yVelocity;
    } else {
      xVelocity = 0;
    }
    
    if (yVelocity > 0 || xVelocity > 0){
      xDist = abs(1150 - x);
      yDist = abs(y - 10);
    }
  }

//Causes sun to move in a straight diagonal path towards the sun counter when collected
  void moveCollect() {
    yVelocity = 0;
    xVelocity = 0;
    if (x < 1100) {
      x += xDist/40;
    }

    if (x > 1100) {
      x -= xDist/40;
    }

    if (y > 20) {
      y -= yDist/40;
    }

    if (y < 20) {
      y += yDist/40;
    }
  }
  void collect() {
    collected = true;
  }
  int getValue() {
    return value;
  }

  void setBottomLevel(float newLevel) {
    bottomLevel = newLevel;
  }
  void setXVel(int newVal) {
    xVelocity = newVal;
  }
  void setYVel(int newVal) {
    yVelocity = newVal;
  }
}
