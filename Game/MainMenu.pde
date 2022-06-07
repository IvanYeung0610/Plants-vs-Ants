public class MainMenu extends GameLevel {
  int levelSelected;
  PFont shlop;

  MainMenu() {
    super(new ArrayList<Button>(), 0);
    levelSelected = 0;
    shlop = createFont("shlop rg.ttf", 150);
  }
  void run() {
    background(50);
    textFont(shlop);
    text("Plants VS Ants", 330, 300);
    textSize(50);
    text("LevelSelected: " + levelSelected, 530, 600);
  }
}
