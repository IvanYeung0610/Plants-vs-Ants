public class Level{
  ArrayList<Button> sceneButtons;
  boolean levelComplete;
  boolean gameOver;
  boolean intermission;
  
  public Level(ArrayList<Button> sceneButtons){
    this.sceneButtons = sceneButtons;
    levelComplete = false;
    gameOver = false;
    intermission = false;
  }
  
  void displayAllButtons(){
    for (Button e: sceneButtons) {
      e.display();
    }
  }
  
  void run(){}
  
  void gameOver(){}
  
  //runs through sceneButtons to check if any buttons have been clicked
  void handleMouseClicked(){
    int index = 0;
    while (index < sceneButtons.size()) {
      if (sceneButtons.get(index).overButton()) {
        sceneButtons.get(index).clickButton();
        //println(sceneButtons.get(index).isClicked());
      }
      index++;
    }
    
  } 
  
}
