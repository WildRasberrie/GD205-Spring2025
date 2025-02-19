class Ship {
  //PROPERTIES
  PImage ship;
  PVector pos;
  //CONSTRUCTORS
  Ship(float x, float y) {
    pos= new PVector (x, y);
    ship = loadImage("spaceShip.png");
  }
  //METHODS
  void display() {
    image(ship, pos.x, pos.y);
    if (s.pos.x<150) {
      s.pos.x=150;
    }
    if (s.pos.x>710) {
      s.pos.x=710;
    }
  }
}
