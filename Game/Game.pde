Sun test0;
Sun test1;

void setup(){
  size(1400,900);
  test0 = new Sun("ProjectilePea.png", 100,-100,"");
  test1 = new Sun("ProjectilePea.png", 300,-100,"");
  test0.setXVel(10);
  println(test0.bottomLevel);
  print(test0.y);
}
void draw(){
  background(100);
  test0.display();
  test1.display();
  test0.move();
  test1.move();
}
