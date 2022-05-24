Sprite test0;
Sprite test1;

void setup(){
  size(1400,900);
  test0 = new Sprite("ProjectilePea.png", 100,100,100,100);
  test1 = new Sprite("ProjectilePea.png", 300,100,100,100);
  
}
void draw(){
  background(100);
  test0.setX(mouseX);
  test0.setY(mouseY);
  test0.display();
  test1.display();
  println(test0.checkCollision(test1));
}
