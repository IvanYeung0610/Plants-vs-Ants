public class PotatoMine extends Plant{
  int timer;
  
  PotatoMine(float xcoor, float ycoor, int Width, int Height){
    super("projectilePea.png", xcoor, ycoor, Width, Height, 5, 25);
    timer = 1100;
  }
  
  Sprite action(){
    if(timer > 0){
      timer--;
    }  else if(timer == 0){
      timer = -1;
      return (new PotatoBullet(x,y));
    }
    return null;
  }
}
