public class PlantButton extends Button {
  String name;
  
  public PlantButton(String img, int xcoor, int ycoor, int Width, int Height, String type, String name){
    super(img, xcoor, ycoor, Width, Height, type);
    this.name = name;
  }
  
  String getName(){
    return name;
  }
}
