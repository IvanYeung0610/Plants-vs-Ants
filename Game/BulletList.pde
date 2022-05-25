public class BulletList{
  ArrayList<Bullet> bullets;
  
  public BulletList(ArrayList<Bullet> bullets){
    this.bullets = bullets;
  }
  
  void moveAll(){
    for (Bullet b : bullets){
      b.move();
    }
  }
  
  void remove(int index){
    bullets.remove(index);
  }
  
  void add(Bullet bullet){
    bullets.add(bullet);
  }
}
