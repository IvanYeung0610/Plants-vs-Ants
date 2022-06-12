public class GameLevel extends Level {
  Wave[] waves;
  int currentWave;
  int sun;
  int timer, ExplodeTimer;
  BulletList bullets;
  SunList suns;
  TileMap tiles;
  AntList currentAnts;
  LawnMower[] lawnMowers;
  Shovel shovel;
  Sprite shovelMouse;
  House house;
  ArrayList<Sprite> displayQueue;
  PFont Samdan;
  PFont shlop;
  PImage sunCounter;

  GameLevel(ArrayList<Button> sceneButtons, int numOfWaves) {
    super(sceneButtons);
    initalizeALL(numOfWaves);
    sunCounter = loadImage("SunCounter.png");
    sunCounter.resize(50, 50);
  }

  // this ties all the classes together.
  void run() {
    textFont(Samdan);
    displayALL();
    ProcessALL();
  }

  void handleMouseClicked() {
    for (int i = 0; i < sceneButtons.size(); i++) { // click the most recent button clicked, and unclick all others.
      if (sceneButtons.get(i).overButton()) {

        if (shovel.isClicked()) {
          shovel.clickButton();
        }

        for (int j = 0; j < sceneButtons.size(); j++) {
          if (j != i && sceneButtons.get(j).clicked == true) {
            sceneButtons.get(j).clickButton();
          }
        }
        sceneButtons.get(i).clickButton();
      }
    }
    for (int i = 0; i < suns.size(); i++) {
      if (suns.get(i).overButton()) {
        suns.get(i).clickButton();
        suns.get(i).collect();
      }
    }

    checkPlantPlace();

    if (shovel.overButton()) {
      unCheck();
      shovel.clickButton();
    }
    //If user clicks on shovel:
    if (shovel.isClicked()) { 
      for (int i = 0; i < 5; i++) { 
        for (int j = 0; j < 9; j++) {
          Tile currentTile = tiles.get(i, j); 
          if (currentTile.overButton() && (currentTile.getPlant() != null)) {
            suns.add(new Sun(mouseX, mouseY, 40, currentTile.getPlant().getCost() / 2)); // Adds sun to game giving half of the plant's value.
            currentTile.plant = null;
            shovel.clickButton();
          }
          unCheck();
        }
      }
    }
  }


  void initalizeALL(int NUMOFWAVES) {
    noCursor();
    currentWave = 0;
    sun = 50;
    timer = 300; //first sun is 10 secs
    bullets = new BulletList(new ArrayList<Bullet>());
    suns = new SunList();
    currentAnts = new AntList();
    shovel = new Shovel();
    waves = new Wave[NUMOFWAVES];
    displayQueue = new ArrayList<Sprite>();
    shovelMouse = new Sprite("MouseShovel.png", 0, 0, 50, 50);
    SetWave();
    setupTiles();
    initalizeLawnMower();
    house = new House("House.png", -470, 0, 590, 900);
    shlop = createFont("shlop rg.ttf", 100);
    Samdan = createFont("Samdan.ttf", 25);
  }
  void ProcessALL() {
    setCurrentAnts();
    runPlants();
    bullets.moveAll();
    suns.moveAll();
    sun += suns.processAll();
    currentAnts.moveAll();
    checkMineCollision();
    shovelMouse.setX(mouseX - 25);
    shovelMouse.setY(mouseY - 25);
    checkBulletCollide();
    processLawnMowers();
    checkGameOver();
    killAnts();
    antAttack();
    checkNextWave();
    spawnSun();
  }
  void displayALL() {
    house.display();
    tiles.displayAll();
    displayLawnMower();
    suns.displayAll();
    displaySceneButtons();
    bullets.displayAll();
    currentAnts.displayAll();
    shovel.display();
    displayExplosions();
    // Display Total SUN
    fill(0, 100);
    noStroke();
    rect(1160, 20, 85, 30);
    fill(255);
    image(sunCounter, 1150, 10);
    textSize(25);
    text(sun, 1200, 45);
    fill(0);
    displayCursor();
  }
  void displayCursor() {
    if (shovel.isClicked()) {
      shovelMouse.display();
    }
  }
  void displaySceneButtons() {
    //displays sceneButtons
    for (int i = 0; i < sceneButtons.size(); i++) {
      sceneButtons.get(i).display();
    }
  }
  void setupTiles() {
    tiles = new TileMap();
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
        tiles.add(t, i, j);
      }
    }
  }
  void initalizeLawnMower() {
    lawnMowers = new LawnMower[5];
    for (int i = 0; i < 5; i++) {
      LawnMower mower = new LawnMower("Lawnmower.png", 25, 165 + i * 144, 110, 110);
      lawnMowers[i] = mower;
    }
  }
  void runPlants() {
    // This runs the plants and adds their projectiles.
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        Tile currentTile = tiles.get(i, j);
        Sprite projectile = currentTile.runPlant(currentAnts);
        if (projectile != null) {
          if (currentTile.plant.getType() == "Sunflower") {
            suns.add((Sun)projectile);
          } else if (currentTile.plant.getType() == "CherryBomb") {
            cherryBombExplode((Bullet)projectile, currentTile.x - 72, currentTile.y - 72);
          } else {
            bullets.add((Bullet)projectile);
          }
        }
      }
    }
  }
  void cherryBombExplode(Bullet b, float x, float y) {
    if (b != null) {
      for (int i = 0; i < currentAnts.size(); i++) {
        if (currentAnts.get(i).checkCollision(b)) {
          currentAnts.get(i).takeDamage(b.getDamage());
        }
      }
      displayQueue.add(new Explosion("Explosion2.png", x, y, 288, 288));
    }
  }
  void processLawnMowers() {
    //Lawnmower processing
    for (int i = 0; i < 5; i++) {
      if (lawnMowers[i] != null) {
        for (int j = 0; j < currentAnts.size(); j++) {
          lawnMowers[i].process(currentAnts.get(j));
        }
        lawnMowers[i].move();
        if (lawnMowers[i].x > width) {
          lawnMowers[i] = null;
        }
      }
    }
  }
  void killAnts() {
    //Kills ants when health is below zero
    for (int i = 0; i < currentAnts.size(); i++) {
      if (currentAnts.get(i).getHealth() <= 0) {
        currentAnts.remove(i);
      }
    }
  }
  void checkGameOver() {
    //checks for losing condition
    for (int i = 0; i < currentAnts.size(); i++) {
      //condition for losing the game
      if (currentAnts.get(i).x < 50) {
        this.gameOver = true;
      }
    }
  }
  void checkBulletCollide() {
    int bulletCount = bullets.size();
    for (int i = 0; i < bulletCount; i++) {
      if (currentAnts.takeDamage(bullets.get(i))) {
        bullets.remove(i);
        break;
      }
    }
  }
  void checkNextWave() {
    if (currentAnts.size() == 0) { // send the next wave if all ants are dead.
      nextWave();
    }
  }

  void displayExplosions() {
    for (int i = 0; i < displayQueue.size(); i++) {
      Explosion e = (Explosion)displayQueue.get(i);
      e.display();
    }
    for (int i = 0; i < displayQueue.size(); i++) {
      Explosion e = (Explosion)displayQueue.get(i);
      if (e.getTimer() <= 0) {
        displayQueue.remove(i);
      }
    }
  }

  void displayLawnMower() {
    for (int i = 0; i < 5; i++) {
      if (lawnMowers[i] != null) {
        lawnMowers[i].display();
      }
    }
  }

  void spawnSun() {
    if (timer == 0) {
      //(int)(Math.random() * (b - a + 1)) + a
      Sun skySun = new Sun("Sun.png", (int)(Math.random() * (1000 - 200 + 1)) + 200, -10, "Sun");
      suns.add(skySun);
      timer = 900;
    } else {
      timer--;
    }
  }

  void antAttack() {
    for (int i = 0; i < currentAnts.size(); i++) {
      if (currentAnts.get(i).getType().equals("Ant")) {
        if (tiles.takeDamage(currentAnts.get(i))) {
          currentAnts.get(i).setAttacking(true);
          //print(currentAnts.get(i).attacking);
        } else {
          currentAnts.get(i).setAttacking(false);
        }
      }
      if (currentAnts.get(i).getType().equals("AntMound")) {
        tiles.checkAntMound(currentAnts.get(i));
        if (currentAnts.get(i).attack() == 1) {
          currentAnts.add(new Ant("Ant.png", currentAnts.get(i).x, currentAnts.get(i).y, 100, 50, 15, 1));
        }
      }
    }
  }

  void checkPlantPlace() {
    // This mess is for placing plants.
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) { // Loops thru all Tiles.
        Tile currentTile = tiles.get(i, j); 
        if (currentTile.overButton()) {  // Checks which tile the mouse clicks on.
          if (currentTile.plant == null) { // IF there are no plants already on it,
            for (int x = 0; x < sceneButtons.size(); x++) { // Check which Plantbutton is clicked
              Button currentButton = sceneButtons.get(x); 
              if (currentButton.getType().equals("PlantButton") && currentButton.isClicked() && sun >= ((PlantButton)currentButton).getCost() && currentTile.getOccupied() == false) {
                setPlant(currentTile, currentButton.getName());
                sun -= ((PlantButton)currentButton).getCost();
                unCheck();
                ((PlantButton)currentButton).resetTimer();
              }
            }
          }
        }
      }
    }
  }
  void setPlant(Tile t, String name) {
    Plant p;
    switch(name) {
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
    case "PotatoMine":
      p = new PotatoMine(t.x + 30, t.y + 30);
      t.plant = p;
      break;
    case "Repeater":
      p = new Repeater(t.x + 30, t.y + 30);
      t.plant = p;
      break;
    case "CherryBomb":
      p = new CherryBomb(t.x + 20, t.y + 20);
      t.plant = p;
      break;
    case "SnowPea":
      p = new SnowPea(t.x + 20, t.y + 20);
      t.plant = p;
      break;
    }
    
  }
  void checkMineCollision() {
    for (int i = 0; i < 5; i++) { 
      for (int j = 0; j < 9; j++) {
        Tile currentTile = tiles.get(i, j);
        Plant currentPlant = currentTile.getPlant();
        if (currentPlant != null) {
          if ((currentPlant.getType()).equals("PotatoMine")) { 
            if (((PotatoMine)currentPlant).isPrimed()) {        // If the Mine is Primed,
              if (currentAnts.checkCollision(currentPlant)) {   // And if any ants are colliding with the mine,
                for (int ind = 0; ind < currentAnts.size(); ind++) {  // Then all ants colliding with the Tile the mine is on dies.
                  if (currentAnts.get(ind).checkCollision(currentTile)) {
                    currentAnts.get(ind).takeDamage(100);
                  }
                }
                currentTile.setPlant(null);
                displayQueue.add(new Explosion("Explosion.png", currentTile.x, currentTile.y, 200, 200));
              }
            }
          }
        }
      }
    }
  }

  void unCheck() { // unchecks all scenebuttons.
    for (int i = 0; i < sceneButtons.size(); i++) {
      if (sceneButtons.get(i).isClicked()) {
        sceneButtons.get(i).clickButton();
      }
    }
  }

  void setCurrentAnts() {
    currentAnts = waves[currentWave].getIncomingAnts();
  }

  // This will be redefined in the child GameLevels.
  void SetWave() {
  }

  void nextWave() {
    if (currentWave + 1 == waves.length) {
      levelComplete = true;
    } else {
      currentWave++;
    }
  }

  void gameOver() {
    //game over screen
    displayALL();

    //darkened screen
    fill(0, 100);
    noStroke();
    rect(0, 0, 1600, 900);
    fill(255, 0, 0);
    textFont(shlop);
    textSize(150);
    textAlign(CENTER);
    text("GAMEOVER", width/2, height/2 - 300); 
    textSize(100);
    text("YOUR HOME", width/2, height/2 - 150); 
    text("IS INFESTED", width/2, height/2); 
    text("WITH ANTS", width/2, height/2 + 150); 
    textFont(Samdan);
    fill(255);
    textAlign(LEFT);
  }

  void intermission() {
    displayALL();

    //darkened screen
    fill(0, 100);
    noStroke();
    rect(0, 0, 1600, 900);
    fill(0);
    textFont(Samdan);
    textSize(200);
    textAlign(CENTER);
    text("YOU WON", width/2, height/2 );
    textFont(Samdan);
    fill(255);
    textAlign(LEFT);
  }

  void pause() {
    displayALL();

    //darkened screen
    fill(0, 100);
    noStroke();
    rect(0, 0, 1600, 900);
    fill(0);
    textFont(Samdan);
    textSize(200);
    textAlign(CENTER);
    text("PAUSED", width/2, height/2 );
    textFont(Samdan);
    fill(255);
    textAlign(LEFT);
  }

}
