public class MainMenu extends GameLevel {
  int levelSelected;
  boolean started;
  PFont shlop;

  MainMenu() {
    super(new ArrayList<Button>(), 0);
    levelSelected = 1;
    shlop = createFont("shlop rg.ttf", 150);
    sceneButtons.add(new Button("LeftArrow.png", 440, 550, 80, 80, "Left"));
    sceneButtons.add(new Button("RightArrow.png", 810, 550, 80, 80, "Right"));
    sceneButtons.add(new Button("StartButton.png", 560, 400, 200, 80, "Start"));
  }
  void run() {
    background(135, 181, 74);
    textFont(shlop);
    text("Plants VS Ants", 330, 300);
    textSize(50);
    text("LevelSelected: " + levelSelected, 530, 600);
    displaySceneButtons();
  }

  void handleMouseClicked() {
    if (sceneButtons.get(0).overButton()) {
      if (levelSelected != 1) levelSelected--;
    }
    if (sceneButtons.get(1).overButton()) {
      if (levelSelected < 4) levelSelected++;
    }
    if (sceneButtons.get(2).overButton()) {
      started = true;
    }
  }
  boolean getStarted() {
    return started;
  }
  int getLevelSelected() {
    return levelSelected;
  }
}
