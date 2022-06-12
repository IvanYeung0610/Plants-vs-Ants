public class Wallnut extends Plant{

  public Wallnut (String img, float xcoor, float ycoor){
    //penultimate parameter is health which will be determined
    super(img, xcoor - 5, ycoor - 20, 100, 120, 50, 50);
  }
  
  Sprite action(){
    return null;
  }
  String getType(){
    return "Wallnut";
  }
}
