public class RestartButton extends Button {
  public RestartButton(String img, float xcoor, float ycoor, int Width, int Height, String type) {
    super(img, xcoor, ycoor, Width, Height, type);
  }
  
  void display() {
    stroke(255);
    strokeWeight(7);
    rect(x, y, Width, Height);
    fill(160,32,240);
    rect(x + 20 , y, Width, Height);
    //textFont
    //1
  }
}
