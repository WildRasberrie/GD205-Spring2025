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
    pos.add(vel);
  }
}
