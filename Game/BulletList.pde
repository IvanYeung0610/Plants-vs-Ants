public class BulletList{
  ArrayList<Bullet> bullets;
  
  public BulletList(ArrayList<Bullet> bullets){
    this.bullets = bullets;
  }
  
  void moveAll(){
    for (int i = 0; i < bullets.size(); i++){
      if (bullets.get(i).x > width) {
        bullets.remove(i);
      } else {
        bullets.get(i).move();
      }
    }
  }
  
  void displayAll(){
    for (Bullet b : bullets){
      b.display();
    }
  }
  
  void remove(int index){
    bullets.remove(index);
  }
  
  void add(Bullet bullet){
    bullets.add(bullet);
  }
}
