//PROPERTIES
class Ball{
  PVector heading,pos;
  float size,speed,radius,score;
  int screen;
  
//CONSTRUCTORS 

Ball(float x,float y,float s){
  pos = new PVector(x,y);
  heading = PVector.random2D().mult(2);//setting random heading
  size=s;
  speed=2.0;
  radius= size;
  score=0;
  screen=1;
}

//METHODS
void display(){
  //Pong Ball
  resetMatrix();
  pushMatrix();
  translate(pos.x,pos.y);
  fill(0);
  circle(pos.x,pos.y,size);
  popMatrix();
}

void update(){
  boolean offScreen;
  
  offScreen= pos.x>width||pos.x<0;

  if (pos.y>500||pos.y<0){
    pos.y=500;
    heading.y*=-1;
  }
  if (pos.x>500||pos.x<0){
    pos.x=500;
    heading.x*=-1;
  }
  if(offScreen){
    //endGame();
  }
  if (key=='r'||key=='R'){
    resetGame();
  }
  scoreDisplay();
  pos.add(heading);
  println("ball POS:"+pos.x+"   Ball POS Y "+pos.y);//Checking ball collision

}


void scoreDisplay(){
  resetMatrix();
  pushMatrix();
  fill (255,0,0);//red
  textSize(36);
  text ("Score: " + score,width-200,50);
  popMatrix();
}

void endGame(){
  resetMatrix();
  screen=2;
  background(0);
  fill(255);//white fill
  textSize(200);
  text ("YOU LOSE!",0,height/2.0);
  textSize(50);
  text ("Press 'R' to reset game",0,height/2.0+50);  
}

void resetGame(){
    screen=1;
  }
}
