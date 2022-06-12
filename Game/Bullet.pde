public class Bullet extends Sprite{
  float velocity = 10; //placeholder
  int damage;
  String type;
  
  public Bullet(String img, float xcoor, float ycoor, int Width, int Height, int dmg){
    super(img, xcoor, ycoor, Width, Height);
    damage = dmg;
    type = "";
  }
  
  void setType(String newType){
    type = newType;
  }
  String getType(){
    return type;
  }
  void move(){
    super.x += velocity;
  }
  void setVelocity(float newV){
    velocity = newV;
  }
  //display() in Sprite super class is adequate
  //void display(){}
  
  int getDamage(){
    return damage;
  }
}
