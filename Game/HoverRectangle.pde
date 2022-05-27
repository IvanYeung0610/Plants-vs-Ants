public class HoverRectangle{
  //CHANGE EVERYTHING TO FLOATS LATER
  int x, y;
  public HoverRectangle(int xcoor, int ycoor){
    x = xcoor;
    y = ycoor;
  }
  
  void display(int Width, int Height){
    rect(x, y, Width, Height);
  }
}
