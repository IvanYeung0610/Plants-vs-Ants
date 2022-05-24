Sprite test0;
Sprite test1;

void setup(){
  size(1400,900);
  Sprite test0 = new Sprite("ProjectilePea.png", 100,100,100,100);
  Sprite test1 = new Sprite("ProjectilePea.png", 300,100,100,100);
  print(test0.checkCollision(test1));
}
void draw(){
  test0.display();
  test1.display();
}
