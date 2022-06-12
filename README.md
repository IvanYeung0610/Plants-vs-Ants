# Plants-vs-Ants
Repository for final project of APCS. We are doing a Plant VS Zombies-esque game.

### **Group Name:**  The Peashooters
### **Group Members:** Ivan Yeung, Joshua Liu

### **Google Doc Prototype:** https://docs.google.com/document/d/1nhDlcYSymbh_knjGXvz3SfxvtfaYGgMqSy5-5mDk_x8/edit?usp=sharing

## **Brief Description**
The project that we will be working on is a Plants vs. Zombies-esque game. Instead of having zombies, they will be ants but their mechanics will be around the same. This project will consist of making various plant classes, ant classes, and tile classes. There will be a grid of 9 by 5 tiles. Each tile can hold one plant and these plants will stop the incoming enemies from reaching the other side of the grid by shooting at them. Placing plants will require energy(sunlight) that drops onto the map or produced by a plant. There will be a variety of plants and ants with their own unique traits.

## **Compile Instructions**
Open up the files in processing and press the play button to begin the game.

LOG:
---
5/23

Joshua Liu:
I created the Sprite class and the Sun class. They are tested.

Ivan Yeung:
I created the Button class, PlantButton class, the Level class, and the LevelManager class. I also tested all classes other than the Level Manager

5/24

Joshua Liu:
I created the Plant, Ant, and AntList classes. The methods are complete but not tested yet.

Ivan Yeung:
I created the Tile, TileMap, Bullet, and the BulletList class. Completed the required methods for the classes but I was not able to test them today.

5/25:

Joshua Liu: I created the SunList and fixed some kinks with how AntList will work and the function of Tiles. I also created the Tile image and tested TileMap.

Ivan Yeung: I tested Bullet, BulletList, Peashooters. Changed how some of the methods worked in BulletList and Peashooters(added timer instance variable). Also tested Peashooters and found a bug that might just be related to processing.

5/26:

Joshua Liu: I started working on GameLevel which ties every class together. I also worked some of the other classes that were not finished.

Ivan Yeung: I added the sprites for peashooter, sun, sunflower, and wallnut. I also completed and tested the sunflower and wallnut class, while making minor changes to how peashooter spawns the projectile.

5/27:

Joshua Liu: I worked on GameLevel's run and handleMouseClicked methods. They are developed enough now to simulate plant placing and shooting.

Ivan Yeung: I made the HoverRectangle class and created the updateHover() method in GameLevel. I also helped by consulting my partner during debugging. I also added the images for the plant buttons we have so far.

5/29:

Joshua Liu: I worked on GameLevel and tested ants. I worked on changing the sprites instance variables to floats and modified all child classes accordingly.

Ivan Yeung: I worked on display the plant's cost on the PlantButton. I also implemented the suns that fall from sky at a set interval. Along with that I created the for loop that removes all ants that have under 1 health.

5/30:

Joshua Liu: I worked on finshing features in GameLevel for the Demo. I also made the demolevels for the demo and tested them.

Ivan Yeung: I worked on ants attacking and not moving when they attack. I also worked on updateHover() but it didn't seem to work so we decided to no include it in the demo.

5/31:

Joshua Liu: I worked on making the plantButtons have timers. This would make it so that the plants have a cooldown to being placed.

Ivan Yeung: I worked on the lawnmower class and got it functioning like it does in the actual game. The lawnmowers are activated once and moves down the row and despawns. I also added the assets for the lawnmower and the house class.

6/01:

Joshua Liu:I worked on making a shovel for the game. It works like the other buttons for placing plants, but it removes the plant instead of placing one. Also changed PlantButton's cooldown animation.

Ivan Yeung: I worked on the home and what happens when the ants reach the home. I also added a font for the text on the game over screen when the ants reach the home. Not sure how to revert back to normal font. I plan on tweaking the font and then working on the buttons on the gameover screen that will allow players to start over.

6/02

Joshua Liu: I worked on the shovel and making it so that the shovel drops suns back onto the tile that the deleted plant was on.

Ivan Yeung: I worked on adding a default font for cases outside of the gameover mode. I also worked on the restart button that allows the player to restart the level they are on if they lose. I also added a quitButton template which can also serve as a template for other possible buttons in the future.


6/03:

Joshua Liu: I made the PotatoMine and made sure that it was functioning according to our original designs. The potato mine kills all ants on the same tile as it when an ant collides with it in the primed state. I also worked on the UML diagram and started working on other Plants.

Ivan Yeung: I worked on making and adding various assets(BucketHat, ConeHat, PotatoMine, PotatoMineBullet, PotatoMine Button, Repeater, RepeaterButton). I also created a function HatAnt class which creates ants that wears hats that fall off when completely drained of its health.

6/06:

Joshua Liu: I made the Potatomine's explosion display over tiles and not interfere with the ants passing by. I also cleaned up some of the code in GameLevel and made the Repeater plant and tested it.

Ivan Yeung: I worked on AntMound class. As of today, it remains stationary and can spawn an ant to the level at a set interval. I plan on making some sort of system that prevents plants from being placed on a tile that touches a ant mound.

6/07:

Joshua Liu: I made the MainMenu scene.

Ivan Yeung: I completed AntMound. Now you cannot put plants on the tiles that have a AntMound. Currently working on the intermission screen and implementing it in the same manner as the gameOver screen.

6/09:

Joshua Liu: I made the cherryBomb and cleaned up the code in GameLevel.

Ivan Yeung: I reworked all the buttons that appear when player is on the gameOver screen of intermission screen. This includes the retry button, quit button, main menu button, next level button, previous level button. The next level button does not appear when it is the last level and the previous level does not appear when on the first level after main menu.

6/10:

Ivan Yeung: I created and pause and resume buttons and creating working paused screens for them. The positions are subject to change before the project in entirely due.
