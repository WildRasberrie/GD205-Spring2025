class Enemy {
  PImage enemy;
  //PROPERTIES
  PVector pos, accelerate, negGravity;
  int screen;
  float size, enemyPOSX, enemyPOSY;
  float movement;
  int enemyDisplay=0;
  //CONSTRUCTORS
  Enemy(float x, float y, float s) {
    pos= new PVector (x, y);
    accelerate=new PVector(0, 0);
    negGravity=new PVector(0, -10);
    size=s;
    enemy= loadImage("enemy.png");//enemy sprite
    enemyPOSX=(pos.x-width/2.0-250);// enemy loading pos
    enemyPOSY=(pos.y-height/2.0-500);
  }
  //METHODS
  void display() {
    enemyFormation();
  }
  void update() {
    pos.add(accelerate);
  }

  void enemyFormation() {
    enemyDisplay=1;
    movement = cos(0.025*frameCount)*150;
    for (int i = 0; i < 320; i = i+100) {
      for (int j = 0; j < 320; j = j+100) {
        image(enemy, (enemyPOSX+movement)+i, enemyPOSY+j);
      }
    }
  }
}
