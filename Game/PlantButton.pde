public class PlantButton extends Button {
  String name;
  int cost;
  int timer, maxTimer;


  public PlantButton(String img, int xcoor, int ycoor, int Width, int Height, String name) {
    super(img, xcoor, ycoor, Width, Height, "PlantButton");
    this.name = name;
    timer = 0;
    switch(name) {
    case "Peashooter":
      cost = 100;
      maxTimer = 500;
      break;
    case "Sunflower":
      cost = 50;
      maxTimer = 300;
      break;
    case "Wallnut":
      cost = 50;
      maxTimer = 2000;
      break;
    case "PotatoMine":
      cost = 25;
      maxTimer = 800;
      break;
    case "Repeater":
      cost = 175;
      maxTimer = 600;
      break;
    case "CherryBomb":
      cost = 150;
      maxTimer = 1200;
      break;
    case "SnowPea":
      cost = 150;
      maxTimer = 600;
      break;
    }
  }

  void resetTimer() {
    timer = maxTimer;
  }

  void clickButton() {
    if (timer <= 0) {
      clicked = !clicked;
    }
  }

  void setTimer(int newTime) {
    timer = newTime;
  }

  String getName() {
    return name;
  }
  int getCost() {
    return cost;
  }
  void setTimerTester(){
    maxTimer = 0;
  }

  //new display method that adds text on top as the price (using switch statement and basing it off the name that it was intialized with)
  void display() {

    super.display();
    text(timer, x, y);
    switch(name) {
    case "Peashooter":
      textSize(50);
      fill(0);
      text("100", x + Width - 60, y + Height - 5);
      break;
    case "Sunflower":
      textSize(50);
      fill(0);
      text("50", x + Width - 40, y + Height - 5);
      break;
    case "Wallnut":
      textSize(50);
      fill(0);
      text("50", x + Width - 40, y + Height - 5);
      break;
    case "PotatoMine":
      textSize(50);
      fill(0);
      text("25", x + Width - 40, y + Height - 5);
      break;
    case "Repeater":
      textSize(50);
      fill(0);
      text("175", x + Width - 60, y + Height - 5);
      break;
    case "CherryBomb":
      textSize(50);
      fill(0);
      text("150", x + Width - 60, y + Height - 5);
      break;
    case "SnowPea":
      textSize(50);
      fill(0);
      text("150", x + Width - 60, y + Height - 5);
      break;
    }

    if (timer > 0) {
      timer--;
      stroke(50);
      strokeWeight(5);
      noFill();
      rect(x, y, Width, Height);
      fill(50, 100);
      noStroke();
      rect(x, y, Width, Height * ((float)timer / maxTimer) );
      fill(0);
    }

    if (clicked) {
      stroke(250, 113, 100);
      strokeWeight(7);
      noFill();
      rect(x, y, Width, Height);
    }
  }
}
