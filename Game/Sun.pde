public class Sun extends Button{
  boolean collected = false;
  int xVelocity, yVelocity, bottomLevel;
  
  Sun(String img, int xcoor, int ycoor, String type){
    super(img, xcoor, ycoor, 50, 50, type);
    bottomLevel = ((int)random(500) + 200);
  }
  
  void move(){
    if(yVelocity < 50) { // increment yVel towards the Max.
      yVelocity += 1;
    }
    if(xVelocity != 0){ // increment xVel towards 0
      xVelocity -= ((int)(xVelocity * .03) + 1);
    }
    
    x += xVelocity;
    
    if(y > bottomLevel){ // if y hasnt reached the bottomLevel, move it.
      y += yVelocity;
    }
    
  }
  void collect(){
    collected = true;
  }
  void setBottomLevel(int newLevel){
    bottomLevel = newLevel;
  }
  void setXVel(int newVal){
    xVelocity = newVal;
  }
  void setYVel(int newVal){
    yVelocity = newVal;
  }
}
