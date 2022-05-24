public class Plant extends Sprite{
  int health, cost;
  Plant(String img, int xcoor, int ycoor, int Width, int Height, int health, int cost){
    super(img, xcoor, ycoor, Width, Height);
    this.health = health;
    this.cost = cost;
  }
  void action(){
    
  }
  
  void takeDamage(int damg){
    health -= damg;
  }
  int getCost(){
    return cost;
  }
  
}
