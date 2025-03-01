class Enemy {
  //PROPERTIES
  PVector pos, negGravity, vel;
  int screen;
  float size, motion= cos(frameCount*0.05) * 140;
  int enemyDisplay=0;
  int skin;
  PImage enemy[]=new PImage[3];


  //CONSTRUCTORS
  Enemy(float x, float y, float s, int _skin) {
    pos= new PVector (x, y);
    negGravity=new PVector(0, -10);
    size=s;
    skin = _skin;
    enemy[0]=loadImage("enemy.png");//IMPORT ENEMY SPRITES
    enemy[1]= loadImage("enemy2.png");
    enemy[2]= loadImage("enemy3.png");
  }
  //METHODS
  void display() {
  }
  void update() {
    changeSkin();
  }

  void changeSkin() {
    //float enemyMovement=cos(frameCount*0.045)*145;//enemy pacing left to right
    image(enemy[skin], pos.x +motion, pos.y); //(pos.x)+enemyMovement, pos.y);
  }
}
