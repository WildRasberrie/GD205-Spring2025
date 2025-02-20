class Timer{
  int savedTime;//Timer has started
  int totalTime; //How long timer should last
  
  //CONSTRUCTORS 
  Timer(int tempTotalTime){
    totalTime= tempTotalTime;
  }
  
  //Starting TImer
  void start(){
    savedTime=millis();
    }
    
  //Finished Timer
  boolean isFinished(){
    //check time passed
    int passedTime=millis()-savedTime;
    if(passedTime>totalTime){
      return true;
    }else{
      return false;
  }
  }
}
