public class PlantButton extends Button {
  String name;
  
  public PlantButton(String img, int xcoor, int ycoor, int Width, int Height, String name){
    super(img, xcoor, ycoor, Width, Height, "PlantButton");
    this.name = name;
  }
  
  String getName(){
    return name;
  }
  //new display method that adds text on top as the price (using switch statement and basing it off the name that it was intialized with)
  void display(){
    super.display();
    switch(name){
      case "Peashooter":
        textSize(40);
        fill(0);
        text("100", x + Width - 75, y + Height - 5);
        break;
      case "Sunflower":
        textSize(40);
        fill(0);
        text("50", x + Width -  50, y + Height - 5);
        break;
      case "Wallnut":
        textSize(40);
        fill(0);
        text("50", x + Width - 50, y + Height - 5);
        break;
    }
  }
}
