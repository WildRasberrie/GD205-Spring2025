//PROPERTIES
class Ball{
  PVector heading,pos;
  float size,speed,maxSpeed;
  int s,r;
  float testX,testY;
//CONSTRUCTORS 

Ball(float x,float y,float s){
  pos = new PVector(x,y);
  heading = PVector.random2D().mult(2);//setting random heading
  size=s;
  speed=2.0;
  maxSpeed=5.0;
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
 boolean ballCollidesL=b.pos.x>(p[0].pos.x+s) &&
                       b.pos.x<50 &&//l paddle x-axis
                       b.pos.y>(p[0].pos.y)&&//top paddle y axis
                       b.pos.y<(p[0].pos.y*2);//bottom paddle y axis 

  boolean ballCollidesR=b.pos.x<(p[1].pos.x-s)&&
                        b.pos.x>950 &&//r paddle x-axis
                        b.pos.y>(p[0].pos.y)&&//top paddle y axis
                        b.pos.y<(p[0].pos.y*2);//bottom paddle y axis     
  pos.add(heading);
  for(int i=0;i<p.length;i++){
    if(ballCollidesL){
        println("HIT!");
        b.pos.x=80;
        b.heading.x*=-1;
        gs.score++;
        break;
      }
     if(ballCollidesR){
        println("HIT!");
        b.pos.x=950;
        b.heading.x*=-1;
        gs.score++;
        break;
      }
  }
    if(b.heading.x > maxSpeed){
      b.heading.x=maxSpeed;
    }
  }  
}
