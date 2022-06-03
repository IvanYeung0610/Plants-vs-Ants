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

Joshua Liu:

Ivan Yeung: I worked on the home and what happens when the ants reach the home. I also added a font for the text on the game over screen when the ants reach the home. Not sure how to revert back to normal font. I plan on tweaking the font and then working on the buttons on the gameover screen that will allow players to start over.

6/02

Joshua Liu:

Ivan Yeung: I worked on adding a default font for cases outside of the gameover mode. I also worked on the restart button that allows the player to restart the level they are on if they lose. I also added a quitButton template which can also serve as a template for other possible buttons in the future.
