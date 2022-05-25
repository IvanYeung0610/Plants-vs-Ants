public class Bullet extends Sprite{
  final float velocity = 10; //placeholder
  int damage;
  
  public Bullet(String img, int xcoor, int ycoor, int Width, int Height, int dmg){
    super(img, xcoor, ycoor, Width, Height);
    damage = dmg;
  }
}
