public class AntList {
  ArrayList<Ant> ants;

  AntList() {
    ants = new ArrayList<Ant>();
  }

  void add(Ant newAnt) {
    ants.add(newAnt);
  }

  Ant remove(int index) {
    return ants.remove(index);
  }
  Ant get(int index) {
    return ants.get(index);
  }

  void moveAll() {
    for (Ant x : ants) {
      x.move();
    }
  }

  int size() {
    return ants.size();
  }

  void displayAll() {
    for (Ant x : ants) {
      x.display();
    }
  }
  void displayAllTester(){
    for (Ant x : ants) {
      x.displayTester();
    }
  }

  boolean takeDamage(Bullet bullet) {
    for (Ant x : ants) {
      if (x.checkCollision(bullet)) {
        if (bullet.getType().equals("snow")) {
          if(x.getType().equals("Ant"))x.getChilled();
          x.takeDamage(bullet.damage);
        } else {
          x.takeDamage(bullet.damage);
        }
        return true;
      }
    }
    return false;
  }
  boolean checkCollision(Sprite s) {
    for (Ant x : ants) {
      if (x.checkCollision(s)) {
        return true;
      }
    }
    return false;
  }
}
