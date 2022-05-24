public class Button extends Sprite {
  boolean clicked;
  String type;
  
  public Button(String img, int xcoor, int ycoor, int Width, int Height, String type) {
    super(img, xcoor, ycoor, Width, Height, type);
    this.type = type;
    clicked = false;
  }
  
  //display is already in Sprite
  //void display(){}
  
  boolean isClicked(){
    return clicked;
  }
  
  void clickButton(){
    clicked = !clicked;
  }
  
  boolean overButton(){
    if (mouseX >= super.x && mouseX <= super.x + super.Width && mouseY >= super.y && mouseY <= super.y + super.Height){
      return true;
    }
    return false;
  }
  
  String getType(){
    return type;
  }
}
