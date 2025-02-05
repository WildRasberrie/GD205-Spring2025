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
  maxSpeed=10.0;
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
 boolean ballUnder0=b.pos.x<0;
 boolean ballCollidesL=b.pos.x>=-3&&
                       b.pos.x<50 &&//l paddle x-axis
                       b.pos.y>=(p.pos.y-150)&&//top paddle y axis
                       b.pos.y<=((p.pos.y)+500);//bottom paddle y axis 

  boolean ballCollidesR=b.pos.x>(p.pos.x+width-50) && b.pos.x<width &&//r paddle x-axis
                        b.pos.y>=(p.pos.y-100)&&//top paddle y axis
                        b.pos.y<=((p.pos.y)+300);//bottom paddle y axis    
  pos.add(heading);
  if(ballCollidesL){
      println("HIT!");
      bounceSound.play();
      b.pos.x=80;
      b.heading.x*=-1.5;
      b.heading.y*=-1.5;
      gs.score2++;
    }
   if(ballCollidesR){
      println("HIT!");
      bounceSound.play();
      b.pos.x=950;
      b.heading.x*=-1.5;
      b.heading.y*=-2.5;
      gs.score++;
    }
  if (ballUnder0){
    b.pos.x=0.0;    
  }
  if(b.heading.x > maxSpeed){
    b.heading.x=maxSpeed;
    b.heading.y=maxSpeed;
    
    }
    println("Ball POS y "+b.pos.y+">   Paddle POS L y "+(p.pos.y-75) +"  < "+(p.pos.y+800));
  }  
}
