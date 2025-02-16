class Ship{
  Bullet[] bullet;
  //PROPERTIES
  PImage ship;
  PVector pos,heading;
  int screen,speed;
  float shipPOSX,shipPOSY;
  boolean playerControl=false;
  //CONSTRUCTORS
    Ship(float x, float y){
    pos= new PVector (x,y); 
    ship = loadImage("spaceShip.png");
    shipPOSX=(pos.x-width/2.0-150);
    shipPOSY=(pos.y-height/2.0+700);  
    bullet = new Bullet[100];
    for(int i=0;i<bullet.length;i++){
      bullet[i]= new Bullet(0,0);
    }
    
  }
  //METHODS
  void display(){
    shipDisplay();
    for(int i =0;i<bullet.length;i++){
      bullet[i].display();
    }
  }
  void update(){
    buttonPressed();
    for(int i =0;i<bullet.length;i++){
      bullet[i].update();
    }
  }
  void shipDisplay(){
    image(ship,shipPOSX,shipPOSY);
  }

  void buttonPressed(){ 
     if (keyPressed==true && 
        (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))){
           shipPOSX-=3;
      }
      if (keyPressed==true && 
         (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT))){
          shipPOSX+=3;
      }
  } 
}
