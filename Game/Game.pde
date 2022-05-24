Level test;
Button d;
void setup(){
  size(1400,900);
  
  Button a, b, c;
  a = new Button("ProjectilePea.png", 100, 100, 70, 70, "test");
  b = new Button("ProjectilePea.png", 200, 200, 70, 70, "test");
  c = new Button("ProjectilePea.png", 300, 300, 70, 70, "test");
  d = new Button("ProjectilePea.png", 400, 400, 70, 70, "test");
  ArrayList<Button> testList = new ArrayList<Button>();
  testList.add(a);
  testList.add(b);
  testList.add(c);
  test = new Level(testList);
}
void draw(){
  background(100);
  test.displayAllButtons();
  //d.display();
  //println(d.overButton());
}

void mouseClicked(){
  test.handleMouseClicked();
}
