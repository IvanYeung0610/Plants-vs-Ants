public class Tile extends Button{
  final int size = 100;
  Plant plant;
  
  public Tile(String img, float xcoor, float ycoor, int Width, int Height){
    super(img, xcoor, ycoor, Width, Height, "Tile");
    this.plant = null;
  }
  
  void display(){
    super.display();
    if (plant != null) {
      plant.display();
      text(plant.health, x + Width / 2, y);
      // will be changed.
      if(clicked){
        rect(x,y,100,100);
      }
    }
    
  }
  Plant getPlant(){
    return plant;
  }
  
  Sprite runPlant(){
    if (plant != null) {
      if (plant.health <= 0){
        plant = null;
      }  else{
        return plant.action();
      }
    }
    return null;
  }
  
  
}
