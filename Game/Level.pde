public class Level{
  ArrayList<Button> sceneButtons;
  boolean levelComplete;
  boolean gameOver;
  boolean paused;
  
  public Level(ArrayList<Button> sceneButtons){
    this.sceneButtons = sceneButtons;
    levelComplete = false;
    gameOver = false;
    paused = false;
  }
  
  void displayAllButtons(){
    for (Button e: sceneButtons) {
      e.display();
    }
  }
  
  void run(){}
  
  void gameOver(){}
  
  void intermission(){}
  
  void pause(){}
  
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
  
  void setPaused(boolean a){
    paused = a;
  }
  
  boolean getPaused(){
    return paused;
  }
  
}
