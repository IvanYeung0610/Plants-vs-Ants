public class GameLevel extends Level {
  Wave[] waves;
  int currentWave;
  int sun;
  int timer, ExplodeTimer;
  BulletList bullets;
  SunList suns;
  TileMap tiles;
  AntList currentAnts;
  HoverRectangle hover;
  LawnMower[] lawnMowers;
  Shovel shovel;
  House house;
  PFont Samdan;
  PFont shlop;

  GameLevel(ArrayList<Button> sceneButtons, int numOfWaves) {
    super(sceneButtons);
    currentWave = 0;
    sun = 50;
    timer = 300; //first sun is 10 secs
    bullets = new BulletList(new ArrayList<Bullet>());
    suns = new SunList();
    currentAnts = new AntList();
    hover = new HoverRectangle(0, 0);
    shovel = new Shovel();
    waves = new Wave[numOfWaves];
    SetWave();

    tiles = new TileMap();
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        Tile t = new Tile("Tile.png", 104 + (j * 144), 130 + (i * 144), 144, 144);
        tiles.add(t, i, j);
      }
    }

    lawnMowers = new LawnMower[5];
    for (int i = 0; i < 5; i++) {
      LawnMower mower = new LawnMower("Lawnmower.png", 25, 165 + i * 144, 110, 110);
      lawnMowers[i] = mower;
    }
    house = new House("House.png", -470, 0, 590, 900);
    shlop = createFont("shlop rg.ttf", 100);
    Samdan = createFont("Samdan.ttf", 25);
  }


  // this ties all the classes together.
  void run() {

    textFont(Samdan);
    setCurrentAnts();
    house.display();

    tiles.displayAll();
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        Tile currentTile = tiles.get(i, j);
        Sprite projectile = currentTile.runPlant();
        if (projectile != null) {
          if (currentTile.plant.getType() == "Sunflower") {
            suns.add((Sun)projectile);
          } else {
            bullets.add((Bullet)projectile);
          }
        }
      }
    }

    bullets.displayAll();
    bullets.moveAll();

    suns.displayAll();
    suns.moveAll();
    sun += suns.processAll();

    currentAnts.displayAll();
    currentAnts.moveAll();

    int bulletCount = bullets.size();
    for (int i = 0; i < bulletCount; i++) {
      if (currentAnts.takeDamage(bullets.get(i))) {
        bullets.remove(i);
        break;
      }
    }

    //Lawnmower processing
    for (int i = 0; i < 5; i++) {
      if (lawnMowers[i] != null) {
        lawnMowers[i].display();
        for (int j = 0; j < currentAnts.size(); j++) {
          lawnMowers[i].process(currentAnts.get(j));
        }
        lawnMowers[i].move();
        if (lawnMowers[i].x > width) {
          lawnMowers[i] = null;
        }
      }
    }

    //Kills ants when health is below zero
    for (int i = 0; i < currentAnts.size(); i++) {
      if (currentAnts.get(i).getHealth() <= 0) {
        currentAnts.remove(i);
      }
    }

    //displays sceneButtons
    for (int i = 0; i < sceneButtons.size(); i++) {
      sceneButtons.get(i).display();
    }

    //displays sceneButtons
    for (int i = 0; i < sceneButtons.size(); i++) {
      sceneButtons.get(i).display();
    }

    //checks for losing condition
    for (int i = 0; i < currentAnts.size(); i++) {
      //condition for losing the game
      if (currentAnts.get(i).x < 50) {
        this.gameOver = true;
      }
    }

    //Ants attacking
    antAttack();

    //checks for losing condition
    for (int i = 0; i < currentAnts.size(); i++) {
      //condition for losing the game
      if (currentAnts.get(i).x < 50) {
        this.gameOver = true;
      }
    }

    //Lawnmower processing
    for (int i = 0; i < 5; i++) {
      if (lawnMowers[i] != null) {
        lawnMowers[i].display();
        for (int j = 0; j < currentAnts.size(); j++) {
          lawnMowers[i].process(currentAnts.get(j));
        }
        lawnMowers[i].move();
        if (lawnMowers[i].x > width) {
          lawnMowers[i] = null;
        }
      }
    }

    if (currentAnts.size() == 0) { // send the next wave if all ants are dead.
      nextWave();
    }


    // Display Total SUN
    textSize(25);
    text("Sun: " + sun, 1200, 40);

    //Sun that spawns from the sky
    spawnSun();

    //Shovel:
    shovel.display();
  } //end of run()

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
      }
    }

    // This mess is for placing plants.
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) { // Loops thru all Tiles.
        Tile currentTile = tiles.get(i, j); 
        if (currentTile.overButton()) {  // Checks which tile the mouse clicks on.
          if (currentTile.plant == null) { // IF there are no plants already on it,
            for (int x = 0; x < sceneButtons.size(); x++) { // Check which Plantbutton is clicked
              Button currentButton = sceneButtons.get(x); 
              if (currentButton.getType().equals("PlantButton") && currentButton.isClicked() && sun >= ((PlantButton)currentButton).getCost()) {
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
    //If user clicks on shovel:
    if (shovel.overButton()) {
      unCheck();
      shovel.clickButton();
    }

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
      if (currentAnts.get(i).getType().equals("AntMound")){
        if (currentAnts.get(i).attack() == 1){
          currentAnts.add(new Ant("Ant.png", currentAnts.get(i).x, currentAnts.get(i).y, 100, 50, 15, 1));
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
    }
  }
  void checkMineCollision() {
    for (int i = 0; i < 5; i++) { 
      for (int j = 0; j < 9; j++) {
        Tile currentTile = tiles.get(i, j);
        Plant currentPlant = currentTile.getPlant();
        if (currentPlant != null) {
          if ((currentPlant.getType()).equals("PotatoMine")) { 
            if (((PotatoMine)currentPlant).isPrimed() && ((PotatoMine)currentPlant).exploded == -1) {        // If the Mine is Primed,
              if (currentAnts.checkCollision(currentPlant)) {   // And if any ants are colliding with the mine,
                for (int ind = 0; ind < currentAnts.size(); ind++) {  // Then all ants colliding with the Tile the mine is on dies.
                  if (currentAnts.get(ind).checkCollision(currentTile)) {
                    currentAnts.get(ind).takeDamage(100);
                  }
                }
                ((PotatoMine)currentPlant).setExploded();
              }
            }
            if (((PotatoMine)currentPlant).exploded == 0) {
              currentTile.setPlant(null);
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

  void runTilePlants() {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        Tile currentTile = tiles.get(i, j);
        Sprite projectile = currentTile.runPlant();
        if (projectile != null) {
          if (currentTile.plant.getType() == "Sunflower") {
            suns.add((Sun)projectile);
          } else {
            bullets.add((Bullet)projectile);
          }
        }
      }
    }
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
    house.display();
    tiles.displayAll();
    bullets.displayAll();
    suns.displayAll();
    currentAnts.displayAll();
    for (int i = 0; i < sceneButtons.size(); i++) {
      textAlign(LEFT);
      sceneButtons.get(i).display();
    }

    for (int i = 0; i < 5; i++) {
      if (lawnMowers[i] != null) {
        lawnMowers[i].display();
      }
    }
    fill(0);
    textSize(25);
    text("Sun: " + sun, 1200, 40);
    //darkened screen
    fill(0, 100);
    noStroke();
    rect(0, 0, 1600, 900);
    fill(255, 0, 0);
    textFont(shlop);
    textSize(150);
    //have to figure out how to turn off shlop font(Probaby will make another font for other text)
    textAlign(CENTER);
    text("GAMEOVER", width/2, height/2 - 300); 
    textSize(100);
    text("YOUR HOME", width/2, height/2 - 150); 
    text("IS INFESTED", width/2, height/2); 
    text("WITH ANTS", width/2, height/2 + 150); 
    textFont(Samdan);
  }

  void updateHover() {
    for (Tile[] t : tiles.tileArray) {
      for (Tile tile : t) {
        if (mouseX < tile.x && mouseX > tile.x + tile.Width && mouseY < tile.y && mouseY > tile.y + tile.Height) {
          hover.x =  tile.x;
          hover.y = tile.y;
          for (int i = 0; i < tile.Height; i++) {
            for (int j = 0; j < tile.Width; j++) {
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

    for (Button button : sceneButtons) {
      if ((button.type).equals("PlantButton")) {
        if (mouseX < button.x && mouseX > button.x + button.Width && mouseY < button.y && mouseY > button.y + button.Height) {
          hover.x = button.x;
          hover.y = button.y;
          for (int i = 0; i < button.Height; i++) {
            for (int j = 0; j < button.Width; j++) {
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
