public class Shovel extends Button{
  
  Shovel(){
    super("Shovel.png", 1300, 810, 80, 80, "Shovel");
  }
  void display(){
    super.display();
    if(clicked){
      stroke(250, 113, 100);
      strokeWeight(7);
      noFill();
      rect(x,y,Width,Height);
    }
  }
  
}
