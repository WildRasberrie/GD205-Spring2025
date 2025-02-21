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
  }
  void update(){
    edgeBarriers();
  }
  void edgeBarriers(){
    boolean overlappingSprites=s.pos.x<300,
            rightEdgeScreen=s.pos.x>800;
    if (overlappingSprites) {
      s.pos.x=300;
    }
    if (rightEdgeScreen) {
      s.pos.x=800;
      println("WORKING");
    }
  }
}
