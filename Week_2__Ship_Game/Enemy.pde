class Enemy {
  PImage enemy, enemy2, enemy3;
  //PROPERTIES
  PVector pos, accelerate, negGravity;
  int screen;
  float size, enemyPOSX, enemyPOSY;
  float movement,scale=0.75;
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
    movement = cos(0.025*frameCount)*80;
    int n=660;
    for (int i=0;i<n;i=i+150){
     float size=120;
      stroke(#E020D4);
      strokeWeight(3);
      fill(0,0);
      square((pos.x+(movement*scale)+i-35),pos.y,size);
      image(enemy,(pos.x+(movement*scale)+i-60),(pos.y));
    }
    for (int i=75;i<n;i=i+150){
      
      square((pos.x+(movement*scale)+i-60),pos.y+200,size);
      image(enemy2,(pos.x+(movement*scale)+i-60),(pos.y+200));
    }
    for (int i=125;i<450;i=i+150){
      square((pos.x+(movement*scale)+i-60),pos.y+350,size);
      image(enemy3,(pos.x+(movement*scale)+i-60),(pos.y+350));
    }  
  }
}
