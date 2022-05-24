public class Sun extends Button{
  boolean collected = false;
  int xVelocity, yVelocity, bottomLevel;
  
  Sun(String img, int xcoor, int ycoor, int Width, int Height, String type){
    super(img, xcoor, ycoor, Width, Height, type);
    bottomLevel = ((int)random(500) + 200);
  }
  
}
