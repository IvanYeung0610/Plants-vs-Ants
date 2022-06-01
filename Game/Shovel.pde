public class Shovel extends Button{
  
  Shovel(){
    super("ProjectilePea.png", 600, 10, 100, 100, "");
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
