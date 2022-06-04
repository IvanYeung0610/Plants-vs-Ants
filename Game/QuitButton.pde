public class QuitButton extends Button {
  public QuitButton(String img, float xcoor, float ycoor, int Width, int Height, String type) {
    super(img, xcoor, ycoor, Width, Height, type);
  }
  
  void display(){
    super.display();
    PFont Samdan = createFont("Samdan.ttf", 12);
    fill(255);
    noStroke();
    textFont(Samdan);
    textSize(30);
    textAlign(CENTER);
    text("QUIT", this.x + this.Width/2, this.y + this.Height/1.25 );
  }
    
}
