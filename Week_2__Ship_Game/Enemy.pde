class Enemy{
  PImage enemy;
  //PROPERTIES
  PVector pos;
  int screen;
  float size;
  int[] n = new int [15];

  //CONSTRUCTORS
    Enemy(float x, float y, float s){
    pos= new PVector (x,y);
    size=s;  
    enemy= loadImage("enemy.png");//enemy sprite
  }
  //METHODS
  void display(){
    for (int i=0;i<n.length;i++){
    enemyFormation(); 
    }
  }
  void update(){
    switch(gs.screen){
      case 1:
      enemyFormation();
    }
  }
  
  void enemyFormation(){
    image(enemy,width/2.0,height/2.0);
  
  }
}
