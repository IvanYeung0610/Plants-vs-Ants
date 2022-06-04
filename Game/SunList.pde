public class SunList {
  ArrayList<Sun> suns;
  
  SunList(){
     suns = new ArrayList<Sun>();
  }
  
  void moveAll(){
    for(Sun s : suns){
      s.move();
    }
  }
  void displayAll(){
    for(Sun s : suns){
      s.display();
    }
  }
  int processAll(){
    int counter = 0;
    int i = 0;
    while(i < suns.size()){
      if(suns.get(i).isClicked()){ 
        counter += suns.get(i).getValue();
        suns.remove(i);
      }
      i++;
    }
    
    return counter;
  }
  
  Sun get(int index){
    return suns.get(index);
  }
  int size(){
    return suns.size();
  }
  
  void remove(int index){
    suns.remove(index);
  }
  
  void add(Sun newSun){
    suns.add(newSun);
  }
}
