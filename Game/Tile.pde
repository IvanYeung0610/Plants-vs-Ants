public class Tile extends Button{
  final int size = 100;
  Plant plant;
  
  public Tile(String img, int xcoor, int ycoor, int Width, int Height){
    super(img, xcoor, ycoor, Width, Height, "Tile");
    this.plant = null;
  }
  
  void display(){
    super.display();
    if (plant != null) {
      plant.display();
    }
  }
  Sprite runPlant(){
    if (plant.health <= 0){
      plant = null;
    }
    
    if (plant != null) {
      return plant.action();
    }
    return null;
  }
  
  
}
