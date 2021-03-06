public class Tile extends Button {
  final int size = 100;
  Plant plant;
  boolean occupied;

  public Tile(String img, float xcoor, float ycoor, int Width, int Height) {
    super(img, xcoor, ycoor, Width, Height, "Tile");
    this.plant = null;
    occupied = false;
  }

  void display() {
    super.display();
    if (plant != null) {
      plant.display();
      fill(0);
      //text(plant.health, x + Width / 2, y);
      // will be changed.
      if (clicked) {
        rect(x, y, 100, 100);
      }
    }
  }
  void displayTester() {
    if (plant != null) {
      fill(0);
      textSize(21);
      text("Health: " + plant.health, x + 5, y - 14);
      text("Timer:" + plant.getTimer(), x + 5, y + 7);
    }
  }

  Plant getPlant() {
    return plant;
  }
  void setPlant(Plant p) {
    if (occupied == false) {
      plant = p;
    }
  }

  Sprite runPlant(AntList ants) {
    if (plant != null) {
      if (plant.health <= 0) {
        plant = null;
      } else {
        String type = plant.getType();
        if (type.equals("Peashooter") || type.equals("Repeater") || type.equals("SnowPea")) {
          return plant.action(ants);
        } else {
          return plant.action();
        }
      }
    }
    return null;
  }

  boolean getOccupied() {
    return occupied;
  }

  void setOccupied(boolean input) {
    occupied = input;
  }
}
