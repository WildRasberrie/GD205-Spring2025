class Observer {
  //PROPERTIES
  boolean notify;
  //CONSTRUCTORS
  Observer(boolean notify) {
  }
  //METHODS
  void onNotify() {
    if (notify==true) {
      println("OBSERVER NOTIFIED");
    }
  }
