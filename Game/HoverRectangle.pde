public class HoverRectangle{
  //CHANGE EVERYTHING TO FLOATS LATER
  float x, y;
  public HoverRectangle(float xcoor, float ycoor){
    x = xcoor;
    y = ycoor;
  }
  
  void display(float Width, float Height){
    rect(x, y, Width, Height);
  }
}
