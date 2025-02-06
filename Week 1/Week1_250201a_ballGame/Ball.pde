//PROPERTIES
class Ball{
  PVector heading,pos;
  float size,maxSpeed;
  int s,r;
  float testX,testY;
//CONSTRUCTORS 

Ball(float x,float y,float s){
  pos = new PVector(x,y);
  heading = PVector.random2D().mult(5);//setting random heading
  size=s;
  maxSpeed=8.5;
  s=100;
  r=20;
  testX=pos.x+r;
  testY=pos.y+r;  
}

//METHODS
void display(){
  //Pong Ball
  resetMatrix();
  fill(0);
  circle(pos.x,pos.y,size);
}

void update(){
 pos.add(heading);
 boolean ballUnder0=b.pos.x<0;
   if (gs.screen==1){
    if(b.heading.x>maxSpeed||b.heading.y>maxSpeed){
      b.heading.x=maxSpeed;
      b.heading.y=maxSpeed;
    } 
    if (b.heading.x<-maxSpeed||b.heading.y<-maxSpeed){
      b.heading.x=-maxSpeed;
      b.heading.y=-maxSpeed;
    }
    if (ballUnder0){
      b.pos.x=random(width);    
    }
  }
 }  
}
