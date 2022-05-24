public class Button extends Sprite {
  boolean clicked;
  String type;
  
  public Button(PImage img, int xcoor, int ycoor, int Width, int Height, String type) {
    super(img, xcoor, ycoor, Width, Height, type);
    this.type = type;
    clicked = false;
  }
}
