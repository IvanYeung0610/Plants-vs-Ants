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
  void setPlant(Plant p){
    plant = p;
  }
  
  Sprite runPlant(AntList ants){
    if (plant != null) {
      if (plant.health <= 0){
        plant = null;
      }  else{
        String type = plant.getType();
        if(type.equals("Peashooter") || type.equals("Repeater")){
          return plant.action(ants);
        }  else {
          return plant.action();
        }
      }
    }
    return null;
  }
  
  
}
