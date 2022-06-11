public class Plant extends Sprite{
  int health, cost;
  Sprite lineOfSight;
  Plant(String img, float xcoor, float ycoor, int Width, int Height, int health, int cost){
    super(img, xcoor, ycoor, Width, Height);
    this.health = health;
    this.cost = cost;
    lineOfSight = new Sprite("ProjectilePea.png", x, y + 20, (int)(1400 - x), 50);
  }
  Sprite action(AntList ants){
    // Individually determined.
    return null;
  }
  Sprite action(){
    // Individually determined.
    return null;
  }
  
  void takeDamage(int damg){
    health -= damg;
  }
  int getCost(){
    return cost;
  }
  String getType(){
    return "";
  }
}
