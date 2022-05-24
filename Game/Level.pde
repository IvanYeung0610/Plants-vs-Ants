public class Level{
  ArrayList<Button> sceneButtons;
  
  public Level(ArrayList<Button> sceneButtons){
    this.sceneButtons = sceneButtons;
  }
  
  void displayAllButtons(){
    for (Button e: sceneButtons) {
      e.display();
    }
  }
  
  void run(){}
  
  //runs through sceneButtons to check if any buttons have been clicked
  void handleMouseClicked(){
    int index = 0;
    while (sceneButtons.get(index).isClicked() != true && index < sceneButtons.size()) {
      index++;
    }
    
    if (sceneButtons.get(index).isClicked() == true){
      sceneButtons.get(index).clickButton();
    }
  } 
  
}
