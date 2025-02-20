class Bullet {
  //PROPERTIES
  PVector pos, vel;
  PImage bulletArrow;

  //CONSTRUCTORS
  Bullet(float x, float y) {
    pos= new PVector (x, y);
    vel= new PVector(0, -5);
    bulletArrow=loadImage("bullet.png");
  }
  //METHODS
  void display() {
    strokeWeight(20);
    stroke(255, 0, 0);//red
    image(bulletArrow, pos.x, pos.y);
  }
  void update() {
    //bulletOffset();
    pos.add(vel);
  }
  void bulletOffset() {
    boolean LSideOffset, RSideOffset;
    LSideOffset=s.pos.x<460||s.pos.x>0;
    RSideOffset=s.pos.x>460;
    if (LSideOffset&& keyPressed==true) {
      pos.x=s.pos.x+100;
    }
    if (RSideOffset&&keyPressed==true) {
      pos.x=s.pos.x-100;
    }
  }
}
