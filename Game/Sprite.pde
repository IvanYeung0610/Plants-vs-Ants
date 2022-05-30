public class Sprite{
  PImage image;
  float x;
  float y;
  int Width;
  int Height;
  
  Sprite(String image_name, float x, float y, int Width, int Height){
    PImage photo = loadImage(image_name);
    image = photo;
    this.x = x;
    this.y = y;
    this.Width = Width;
    this.Height = Height;
    image.resize(Width,Height);
  }
  
  void display() {
    image(image,x,y);
  }
  
  boolean checkCollision(Sprite other){
    if(( (x + Width >= other.x) && (x + Width <= other.x + other.Width) ) || ( (x >= other.x) && (x <= other.x + other.Width) )){
      if(( (y + Height >= other.y) && (y + Height)  <= (other.y + other.Height) ) || ( (y >= other.y) && (y <= other.y + other.Height) )){
        return true;
      }
    }
    return false;
  }
  void setX(int X){
    x = X;
  }
  void setY(int Y){
    y = Y;
  }
  
}
