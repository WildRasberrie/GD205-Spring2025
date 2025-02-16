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
      shipPOSX=(pos.x-width/2.0-150);
      shipPOSY=(pos.y-height/2.0+700);  
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
