class Observer {
boolean notify;
  //CONSTRUCTORS
  Observer() {
     notify=false;
  }
  //METHODS
  void onNotify() {
    if (notify==true) {
      println("OBSERVER NOTIFIED");
    }
  }
}
