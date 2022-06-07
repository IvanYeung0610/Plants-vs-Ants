public class MainMenu extends GameLevel {
  int levelSelected;
  PFont shlop;

  MainMenu() {
    super(new ArrayList<Button>(), 0);
    levelSelected = 0;
    shlop = createFont("shlop rg.ttf", 150);
    sceneButtons.add(new Button("ProjectilePea.png", 440, 550, 80, 80, "Left"));
    sceneButtons.add(new Button("ProjectilePea.png", 810, 550, 80, 80, "Right"));
    sceneButtons.add(new Button("ProjectilePea.png", 550, 400, 200, 80, "Right"));
  }
  void run() {
    background(50);
    textFont(shlop);
    text("Plants VS Ants", 330, 300);
    textSize(50);
    text("LevelSelected: " + levelSelected, 530, 600);
    displaySceneButtons();
  }

  void handleMouseClicked() {
  }
}
