Level test;
Button d;
Bullet pea;
BulletList peas;
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
  
  //TEST for Bullet and BulletList
  pea = new Bullet("ProjectilePea.png", 0, 200, 50, 50, 1);
  Bullet pea2 = new Bullet("ProjectilePea.png", 0, 200, 50, 50, 1);
  Bullet pea3 = new Bullet("ProjectilePea.png", 0, 300, 50, 50, 1);
  Bullet pea4 = new Bullet("ProjectilePea.png", 0, 400, 50, 50, 1);
  Bullet pea5 = new Bullet("ProjectilePea.png", 0, 500, 50, 50, 1);
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  peas = new BulletList(bullets);
  peas.add(pea);
  peas.add(pea2);
  peas.add(pea3);
  peas.add(pea4);
  peas.add(pea5);
}
void draw(){
  background(100);
  //pea.display();
  //pea.move();
  //print(pea.getDamage());
  peas.displayAll();
  peas.moveAll();
  println(peas.bullets);
}

void mouseClicked(){
  
}
