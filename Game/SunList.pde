public class SunList {
  ArrayList<Sun> suns = new ArrayList<Sun>();
  
  void moveAll(){
    for(Sun s : suns){
      s.move();
    }
  }
  void remove(int index){
    suns.remove(index);
  }
  
  void add(Sun newSun){
    suns.add(newSun);
  }
}
