public class GameLevel extends Level {
  Wave[] waves = new Wave[1];
  int currentWave;
  int sun;
  int timer;
  BulletList bullets;
  SunList suns;
  TileMap tiles;
  AntList currentAnts;
  HoverRectangle hover;
  
  GameLevel(ArrayList<Button> sceneButtons){
    super(sceneButtons);
    currentWave = 0;
    sun = 0;
    timer = 600; //first sun is 10 secs
    bullets = new BulletList(new ArrayList<Bullet>());
    suns = new SunList();
    currentAnts = new AntList();
    hover = new HoverRectangle(0, 0);
    SetWave();
    
    tiles = new TileMap();
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){
        Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
        tiles.add(t, i, j);
      }
    }
    
  }
  
  void run() {
    // this ties all the classes together.
    setCurrentAnts();
    
    tiles.displayAll();
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){
        Tile currentTile = tiles.get(i,j);
        Sprite projectile = currentTile.runPlant();
        if(projectile != null){
          if(currentTile.plant.getType() == "Sunflower"){
            suns.add((Sun)projectile);
          }  else {
            bullets.add((Bullet)projectile);
          }
        }
      }
    }
    
    if(currentAnts.size() == 0){
      nextWave();
    }
    
    
    bullets.displayAll();
    bullets.moveAll();
    
    suns.displayAll();
    suns.moveAll();
    sun += suns.processAll() * 50;
    
    
    currentAnts.displayAll();
    currentAnts.moveAll();
    int bulletCount = bullets.size();
    for(int i = 0; i < bulletCount; i++){
      if(currentAnts.takeDamage(bullets.get(i))) {
        bullets.remove(i);
        break;
      }
    }

    //Kills ants when health is below zero
    for (int i = 0; i < currentAnts.size(); i++) {
      if (currentAnts.get(i).getHealth() <= 0) {
        currentAnts.remove(i);
      }
    }
    for(int i = 0; i < sceneButtons.size(); i++){
      sceneButtons.get(i).display();
    }
    
    //Ants attacking
    for (int i = 0; i < currentAnts.size(); i++) {
      if (tiles.takeDamage(currentAnts.get(i))) {
        currentAnts.get(i).attacking = true;
      } else {
        currentAnts.get(i).attacking = false;
      }
    }
    

    textSize(25);
    text("Sun: " + sun, 1200, 40);

    //Sun that spawns from the sky
    if (timer == 0) {
      //(int)(Math.random() * (b - a + 1)) + a
      Sun skySun = new Sun("Sun.png", (int)(Math.random() * (1000 - 200 + 1)) + 200, -10, "Sun");
      suns.add(skySun);
      timer = 900;
    } else {
      timer--;
    }
  }
  
  void handleMouseClicked(){
    for(int i = 0; i < sceneButtons.size(); i++){
      if (sceneButtons.get(i).overButton()) {
        sceneButtons.get(i).clickButton();
        // UNCHECK ALL OTHER SCENE BUTTONS;
      }
    }
    for(int i = 0; i < suns.size(); i++){
      if (suns.get(i).overButton()) {
        suns.get(i).clickButton();
      }
    }
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){
        Tile currentTile = tiles.get(i,j);
        if(currentTile.overButton()){
          if(currentTile.plant == null){
            for(int x = 0; x < sceneButtons.size(); x++){
              Button currentButton = sceneButtons.get(x);
              if(currentButton.getType().equals("PlantButton") && currentButton.isClicked()){
                setPlant(currentTile, currentButton.getName());
                unCheck();
              }
            }
          }
        }
      }
    }
    
    
  }
  void setPlant(Tile t, String name){
    Plant p;
    switch(name){
      case "Sunflower":
        p = new Sunflower("Sunflower.png", t.x + 30, t.y + 30);
        t.plant = p;
        break;
      case "Peashooter":
        p = new Peashooter("Peashooter.png", t.x + 30, t.y + 30);
        t.plant = p;
        break;
      case "Wallnut":
        p = new Wallnut("Wallnut.png", t.x + 30, t.y + 30);
        t.plant = p;
        break;
    }
  }
  
  void unCheck(){ // unchecks all scenebuttons.
    for(int i = 0; i < sceneButtons.size(); i++){
      if (sceneButtons.get(i).isClicked()){
        sceneButtons.get(i).clickButton();
      }
    }
  }
  
  void setCurrentAnts(){
    currentAnts = waves[currentWave].getIncomingAnts();
  }
  
  void SetWave() {
    AntList ant = new AntList();
    ant.add(new Ant("Ant.png", 1600, 300, 100, 50, 10, 1));
    
    Wave W0 = new Wave(ant);
    waves[0] = W0;
  }
  
  void nextWave(){
    currentWave++;
  }
  
  void updateHover(){
    for (Tile[] t: tiles.tileArray) {
      for (Tile tile: t) {
        if (mouseX < tile.x && mouseX > tile.x + tile.Width && mouseY < tile.y && mouseY > tile.y + tile.Height) {
          hover.x =  tile.x;
          hover.y = tile.y;
          hover.display(tile.Width, tile.Height);
          return; //ends cuz it found the match
        }
      }
    }
    
    for(Button button: sceneButtons){
      if ((button.type).equals("PlantButton")) {
        if (mouseX < button.x && mouseX > button.x + button.Width && mouseY < button.y && mouseY > button.y + button.Height) {
          hover.x = button.x;
          hover.y = button.y;
          hover.display(button.Width, button.Height);
          return;
        }
      }
    }
    //for loop through plant buttons
  }
  
}
