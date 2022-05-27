
//Level test;
//Button d;
//Bullet pea;
BulletList peas;
Peashooter shooter;
Peashooter shooter2;
Peashooter shooter3;
Sunflower flower;
SunList suns;
void setup(){
  size(1400,900);
  
  //TEST for peashooter
  shooter = new Peashooter("Peashooter.png", 100, 200);
  shooter2 = new Peashooter("Peashooter.png", 100, 100);
  shooter3 = new Peashooter("Peashooter.png", 100, 300);
  flower = new Sunflower("Sunflower.png", 100, 400);
  
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
  //pea = new Bullet("ProjectilePea.png", 0, 200, 50, 50, 1);
  //Bullet pea2 = new Bullet("ProjectilePea.png", 0, 200, 50, 50, 1);
  //Bullet pea3 = new Bullet("ProjectilePea.png", 0, 300, 50, 50, 1);
  //Bullet pea4 = new Bullet("ProjectilePea.png", 0, 400, 50, 50, 1);
  //Bullet pea5 = new Bullet("ProjectilePea.png", 0, 500, 50, 50, 1);
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  peas = new BulletList(bullets);
  suns = new SunList();
  //peas.add(pea);
  //peas.add(pea2);
  //peas.add(pea3);
  //peas.add(pea4);
  //peas.add(pea5);

//TileMap tiles;
//void setup(){
//  size(1400,900);
//  tiles = new TileMap();
//  for(int i = 0; i < 5; i++){
//    for(int j = 0; j < 9; j++){
//      Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
//      tiles.add(t, i, j);
//    }
//  }
}

void draw(){
  background(100);
  //pea.display();
  //pea.move();
  //print(pea.getDamage());
  peas.displayAll();
  shooter.display();
  shooter2.display();
  shooter3.display();
  flower.display();
  Sprite holder = shooter.action();
  Sprite holder2 = shooter2.action();
  Sprite holder3 = shooter3.action();
  Sprite holder4 = flower.action();
  if(holder2 != null){
    peas.add((Bullet)holder2);
  }
  if(holder != null){
    peas.add((Bullet)holder);
  }
  if(holder3 != null){
    peas.add((Bullet)holder3);
  }
  if(holder4 != null){
    suns.add((Sun)holder4);
  }
  peas.moveAll();
  suns.moveAll();
  suns.processAll();
  suns.displayAll();
  //println(peas.bullets);
}

void mouseClicked(){
  
}
