public class Sun extends Button{
  boolean collected = false;
  float xVelocity, yVelocity, bottomLevel;
  
  Sun(String img, float xcoor, float ycoor, String type){
    super(img, xcoor, ycoor, 80, 80, type);
    bottomLevel = (random(500) + 200);
  }
  
  void move(){
    if(yVelocity < 2) { // increment yVel towards the Max.
      yVelocity += .15;
    }
    if(xVelocity != 0){ // increment xVel towards 0
      xVelocity -= (xVelocity * .07);
    } 
    
    x += xVelocity;
    
    if(y < bottomLevel){ // if y hasnt reached the bottomLevel, move it.
      y += yVelocity;
    } else {
      xVelocity = 0;
    }
    
  }
  void collect(){
    collected = true;
  }
  
  void setBottomLevel(float newLevel){
    bottomLevel = newLevel;
  }
  void setXVel(int newVal){
    xVelocity = newVal;
  }
  void setYVel(int newVal){
    yVelocity = newVal;
  }
}
