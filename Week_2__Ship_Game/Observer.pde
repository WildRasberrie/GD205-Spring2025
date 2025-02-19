class Observer {
  //PROPERTIES
  boolean notify;
  //CONSTRUCTORS
  Observer(boolean notify) {
    notify=false;
  }
  //METHODS
  void onNotify() {
    if (notify==true) {
      println("OBSERVER NOTIFIED");
    }
  }
