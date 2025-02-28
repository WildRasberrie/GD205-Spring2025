class Enemy {
  //PROPERTIES
  PVector pos, negGravity, vel;
  int screen;
  float size;
  int enemyDisplay=0;
  int skin;
  PImage enemy[]=new PImage[3];


  //CONSTRUCTORS
  Enemy(float x, float y, float s, int _skin) {
    pos= new PVector (x, y);
    negGravity=new PVector(0, -10);
    vel=new PVector(0, 0);
    size=s;
    skin = _skin;
    enemy[0]=loadImage("enemy.png");//IMPORT ENEMY SPRITES
    enemy[1]= loadImage("enemy2.png");
    enemy[2]= loadImage("enemy3.png");
  }
  //METHODS
  void display() {
    //for (int i=0; i<3; i++) {
      //for (int j=0; j<120; j+=20) {
       //pos=new PVector (width/3.6, height/7.5);
       //println(pos);
      //}
    //}
  }
  void update() {   
    changeSkin();
    //enemyBullets();
  }

  void changeSkin() {
    //float enemyMovement=cos(frameCount*0.045)*145;//enemy pacing left to right
    image(enemy[skin], pos.x, pos.y); //(pos.x)+enemyMovement, pos.y);
  }
  void enemyBullets() {
    if (timer.totalTime==3000) {
      println("TIMER HAS FINISHED!");
      timer.resetTime();
      //Bullet b = new Bullet(e.pos.x, e.pos.y);
      //bullet= (Bullet[]) append(bullet, b);
    }
  }
}
