public class GameLevel extends Level {
  Wave[] waves;
  int currentWave;
  int sun;
  int timer;
  BulletList bullets;
  SunList suns;
  TileMap tiles;
  AntList currentAnts;
  HoverRectangle hover;
  
  GameLevel(ArrayList<Button> sceneButtons, int numOfWaves){
    super(sceneButtons);
    currentWave = 0;
    sun = 50;
    timer = 300; //first sun is 10 secs
    bullets = new BulletList(new ArrayList<Bullet>());
    suns = new SunList();
    currentAnts = new AntList();
    hover = new HoverRectangle(0, 0);
    waves = new Wave[numOfWaves];
    SetWave();
    
    tiles = new TileMap();
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){
        Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
        tiles.add(t, i, j);
      }
    }
  }
  
  
  // this ties all the classes together.
  void run() {
    setCurrentAnts(); 
    
    // This Displays all tiles and runs the plant on top of them.
    updateHover();

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
    
    
    if(currentAnts.size() == 0){ // send the next wave if all ants are dead.
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
        //print(currentAnts.get(i).attacking);
      } else {
        currentAnts.get(i).attacking = false;
      }
    }
    
    
    // Display Total SUN
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
    for(int i = 0; i < sceneButtons.size(); i++){ // click the most recent button clicked, and unclick all others.
      if (sceneButtons.get(i).overButton()) {
        for(int j = 0; j < sceneButtons.size(); j++){
          if(j != i && sceneButtons.get(j).clicked == true){
            sceneButtons.get(j).clickButton();
          }
        }
        sceneButtons.get(i).clickButton();
      }
    }
    for(int i = 0; i < suns.size(); i++){
      if (suns.get(i).overButton()) {
        suns.get(i).clickButton();
      }
    }
    
    // This mess is for placing plants.
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 9; j++){ // Loops thru all Tiles.
        Tile currentTile = tiles.get(i,j); 
        if(currentTile.overButton()){  // Checks which tile the mouse clicks on.
          if(currentTile.plant == null){ // IF there are no plants already on it,
            for(int x = 0; x < sceneButtons.size(); x++){ // Check which Plantbutton is clicked
              Button currentButton = sceneButtons.get(x); 
              if(currentButton.getType().equals("PlantButton") && currentButton.isClicked() && sun >= ((PlantButton)currentButton).getCost()){
                setPlant(currentTile, currentButton.getName());
                sun -= ((PlantButton)currentButton).getCost();
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
  
  
  // This will be redefined in the child GameLevels.
  void SetWave() {
    AntList ant = new AntList();
    ant.add(new Ant("Ant.png", 1600, 300, 100, 50, 15, 1));
    
    Wave W0 = new Wave(ant);
    waves[0] = W0;
  }
  
  void nextWave(){
    if(currentWave + 1 > waves.length){
      levelComplete = true;
    }  else{
      currentWave++;
    }
  }
  
  void updateHover(){
    for (Tile[] t: tiles.tileArray) {
      for (Tile tile: t) {
        if (mouseX < tile.x && mouseX > tile.x + tile.Width && mouseY < tile.y && mouseY > tile.y + tile.Height) {
          hover.x =  tile.x;
          hover.y = tile.y;
          for (int i = 0; i < tile.Height; i++) {
           for (int j = 0; j < tile.Width ; j++){
             color c = tile.image.get(i, j);
             set(j, i, color(red(c) * 1/2, green(c) * 1/2, blue(c) * 1/2));
           }
          }
          print("1");
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
          for (int i = 0; i < button.Height; i++) {
            for (int j = 0; j < button.Width ; j++){
              color c = button.image.get(i, j);
              set(j, i, color(red(c) * 1/2, green(c) * 1/2, blue(c) * 1/2));
            }
          }
          print("2");
          hover.display(button.Width, button.Height);
          return;
        }
      }
    }
    //for loop through plant buttons
  }
  
}
