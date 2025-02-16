class Ship{
  Bullet bullet;
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
      bullet = new Bullet(pos.x,pos.y);
    }
  //METHODS
  void display(){
    shipDisplay();
    bullet.display();
  }
  void update(){
    buttonPressed();
    bullet.update();
  }
  void shipDisplay(){
    image(ship,pos.x,pos.y);
  }

  void buttonPressed(){ 
     if (keyPressed==true && 
        (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))){
           pos.x-=3;
      }
      if (keyPressed==true && 
         (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT))){
          pos.x+=3;
      }
  } 
}
