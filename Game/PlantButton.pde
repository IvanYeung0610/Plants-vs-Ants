public class PlantButton extends Button {
  String name;
  int cost;
  
  public PlantButton(String img, int xcoor, int ycoor, int Width, int Height, String name){
    super(img, xcoor, ycoor, Width, Height, "PlantButton");
    this.name = name;
    
    switch(name){
      case "Peashooter":
        cost = 100;
        break;
      case "Sunflower":
        cost = 50;
        break;
      case "Wallnut":
        cost = 50;
        break;
    }
  }
  
  String getName(){
    return name;
  }
  int getCost(){
    return cost;
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
    if(clicked){
      stroke(250, 113, 100);
      strokeWeight(7);
      noFill();
      rect(x,y,Width,Height);
    }
  }
}
