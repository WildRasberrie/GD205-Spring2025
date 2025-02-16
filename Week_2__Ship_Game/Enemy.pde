class Enemy{
  PImage enemy;
  //PROPERTIES
  PVector pos;
  int screen;
  float size,enemyPOSX,enemyPOSY;
  float movement;
  //CONSTRUCTORS
    Enemy(float x, float y, float s){
    pos= new PVector (x,y);
    size=s;  
    enemy= loadImage("enemy.png");//enemy sprite
    enemyPOSX=(pos.x-width/2.0-600);
    enemyPOSY=(pos.y-height/2.0-500);
  }
  //METHODS
  void display(){   
    enemyFormation(); 
  }
  void update(){
      enemyFormation();
  }
  
  void enemyFormation(){
   movement = frameCount*0.4;
    for (int i = 0; i < 320; i = i+100) {
      for (int j = 0; j < 320; j = j+100){
        image(enemy,(enemyPOSX+movement)+i,enemyPOSY+j);
      }
    } 
  }
  
  void wallCollisions(){
    if (enemyPOSX>width-100){
      pos.x*=-1;
      pos.y+=50;
    }
    if (enemyPOSX<100){
      pos.x*=-1;
    }
  }
  void collisions(){
    if (dist(shoot.pos.x,shoot.pos.y,e.pos.x,e.pos.y)<5){
      e.pos.x=width+50; 
      gs.score+=100;
    }
  }
}
