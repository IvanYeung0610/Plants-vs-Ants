public class Wallnut extends Plant{

  public Wallnut (String img, float xcoor, float ycoor){
    //penultimate parameter is health which will be determined
    super(img, xcoor, ycoor, 100, 100, 50, 50);
  }
  
  Sprite action(){
    return null;
  }
  String getType(){
    return "Wallnut";
  }
}
