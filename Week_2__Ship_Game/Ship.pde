class Ship{
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
  }
  //METHODS
  void display(){
    shipDisplay();
  }
  void update(){
    buttonPressed();
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

class Shoot extends Ship{
//PROPERTIES
PVector pos;
float motion;
//CONSTRUCTORS
  Shoot(float x, float y){
    super(x,y);
  }
//METHODS
    void display(){
      stroke(255,0,0);//red
      strokeWeight(10);
      line(s.pos.x,(s.pos.y),s.pos.x,(s.pos.y+25));
       if (keyPressed==true && key==CODED && keyCode==SHIFT){
        println("SHIFT PRESSED");
        shoot.pos.y-=10;
      }
      }
}
