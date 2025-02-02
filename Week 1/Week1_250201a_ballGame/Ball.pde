//PROPERTIES
class Ball{
  PVector heading,pos;
  float size,speed;
  
//CONSTRUCTORS 

Ball(float x,float y,float s){
  pos = new PVector(x,y);
  heading = PVector.random2D().mult(2);//setting random heading
  size=s;
  speed=2.0;
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
  if (pos.y>500){
    pos.y=500;
    heading.y*=-1;
  }
  if (pos.y<0){
    pos.y=0;
    heading.y*=-1;
  }
  if (pos.x>500){
    pos.x=500;
    heading.x*=-1;
  }else if (pos.x<0){
    pos.x=0;
    heading.x*=-1;
  }
  pos.add(heading);
  }
}
