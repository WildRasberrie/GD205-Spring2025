class Ship {
  //PROPeRTIeS
  PImage ship;
  PVector pos;
  //CONSTRUCTORS
  Ship(float x, float y) {
    pos= new PVector (x, y);
    ship = loadImage("spaceShip.png");
  }
  //MeTHODS
  void display() {
    image(ship, pos.x, pos.y);
  }
  void update(){
    edgeBarriers();
  }
  void edgeBarriers(){
    boolean overlappingSprites=s.pos.x<300,
            rightedgeScreen=s.pos.x>800;
    if (overlappingSprites) {
      s.pos.x=300;
    }
    if (rightedgeScreen) {
      s.pos.x=800;
      println("WORKING");
    }
  }
}
