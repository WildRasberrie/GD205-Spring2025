class Enemy {
  PImage enemy, enemy2, enemy3;
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
    enemy= loadImage("enemy.png");//IMPORT ENEMY SPRITES
    enemy2= loadImage("enemy2.png");
    enemy3= loadImage("enemy3.png");
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
    int n=320;
    for (int i=120;i<n;i=i+20){
      image(enemy, (pos.x+movement) , pos.y );
      image(enemy2, (pos.x+movement) , (pos.y-100) );
      image(enemy3, (pos.x+movement) , (pos.y-200) );
    }
  }
}
