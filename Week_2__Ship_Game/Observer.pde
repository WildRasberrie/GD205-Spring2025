class Observer {
boolean notify;
  //CONSTRUCTORS
  Observer() {
     notify=false;
  }
  //MeTHODS
  void onNotify() {
    if (notify==true) {
      timer.start(); 
    }
  }
}
