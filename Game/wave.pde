public class Wave {
   AntList IncomingAnts;
   
   Wave(AntList queue){
     IncomingAnts = queue;
   }
   
   AntList getIncomingAnts(){
     return IncomingAnts;
   }
}
