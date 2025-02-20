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
    scale (1.25);
    image(ship, pos.x, pos.y);
  }
  void update(){
    edgeBarriers();
  }
  void edgeBarriers(){
    boolean overlappingSprites=s.pos.x<150,
            rightEdgeScreen=s.pos.x>710;
    if (overlappingSprites) {
      s.pos.x=150;
    }
    if (rightEdgeScreen) {
      s.pos.x=710;
    }
  }
}
