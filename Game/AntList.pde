public class AntList{
  ArrayList<Ant> ants;
  
  AntList(){
    ants = new ArrayList<Ant>();
  }
  
  void add(Ant newAnt){
    ants.add(newAnt);
  }
  
  Ant remove(int index){
    return ants.remove(index);
  }
  Ant get(int index){
    return ants.get(index);
  }
  
  void moveAll(){
    for(Ant x : ants){
      x.move();
    }
  }
  
  int size(){
    return ants.size();
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
