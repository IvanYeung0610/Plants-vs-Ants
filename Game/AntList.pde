public class AntList{
  ArrayList<Ant> ants;
  
  AntList(){
    ants = new ArrayList<Ant>();
  }
  
  void add(Ant newAnt){
    ants.add(newAnt);
  }
  
  void remove(int index){
    ants.remove(index);
  }
  
  void moveAll(){
    for(Ant x : ants){
      x.move();
    }
  }
  
  void displayAll(){
    for(Ant x : ants){
      x.display();
    }
  }
  
  boolean takeDamage(Bullet bullet){
    for(Ant x : ants){
      if(x.checkCollision(bullet)) {
        x.takeDamage(bullet.damage);
        return true;
      }
    }
    return false;
  }
}
