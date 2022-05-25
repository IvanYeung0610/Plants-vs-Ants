Level test;
Button d;
Bullet pea;
void setup(){
  size(1400,900);
  
  //TEST for Button and Level 
  //Button a, b, c;
  //a = new Button("ProjectilePea.png", 100, 100, 70, 70, "test");
  //b = new Button("ProjectilePea.png", 200, 200, 70, 70, "test");
  //c = new Button("ProjectilePea.png", 300, 300, 70, 70, "test");
  //d = new Button("ProjectilePea.png", 400, 400, 70, 70, "test");
  //ArrayList<Button> testList = new ArrayList<Button>();
  //testList.add(a);
  //testList.add(b);
  //testList.add(c);
  //test = new Level(testList);
  
  //TEST for Bullet
  pea = new Bullet("ProjectilePEA.png", 0, 200, 50, 50, 1);
}
void draw(){
  background(100);
  pea.display();
  pea.move();
  print(pea.getDamage());
}

void mouseClicked(){
  
}
