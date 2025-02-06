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
  maxSpeed=8.0;
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
 boolean ballCollidesL=b.pos.x>=-3&&
                       b.pos.x<100 &&//l paddle x-axis
                       b.pos.y>=(p.pos.y-50)&&//top paddle y axis
                       b.pos.y<=((p.pos.y)+700);//bottom paddle y axis 

  boolean ballCollidesR=b.pos.x>(p.pos.x+width-50) && b.pos.x<width &&//r paddle x-axis
                        b.pos.y>=(p.pos.y-50)&&//top paddle y axis
                        b.pos.y<=((p.pos.y)+250);//bottom paddle y axis 
   if (gs.screen==1){
     if(b.heading.x > maxSpeed){
      b.heading.x=maxSpeed;
      b.heading.y=maxSpeed;
      if (b.pos.y>(height)){//BOTTOM BARRIER
        //println("BOTTOM BARRIER WORKING!");
        b.heading.y*=-1;
      }
      if (b.pos.y<300){//TOP BARRIER
        //println("TOP BARRIER WORKING!");
        b.pos.y=300;
        b.heading.y*=-1;
      }
     }
    if(ballCollidesL){
        println("HIT!");
        bounceSound.play();
        b.pos.x=100;
        b.heading.x*=-1.25;
        b.heading.y*=random(-5);
        gs.score2++;
        if(b.heading.x>5.0 && b.heading.x<maxSpeed ||
          b.heading.y>5.0 && b.heading.y<maxSpeed){
          b.display();
          image(fire,-b.pos.x-20,b.pos.y);
       }
      }
     if(ballCollidesR){
        println("HIT!");
        bounceSound.play();
        b.pos.x=950;
        b.heading.x*=-1.25;
        b.heading.y*=random(-5);
        gs.score++; 
        if(b.heading.x>5.0 && b.heading.x<maxSpeed ||
           b.heading.y>5.0 && b.heading.y<maxSpeed){
           b.display();
           image(fire,b.pos.x-20,b.pos.y);
       }
      }
    if (ballUnder0){
      b.pos.x=random(width);    
    }
 }
    println("Ball POS x "+pos.x+">   Paddle POS x "+(p.pos.x) +"  < "+(p.pos.x+100));
  }  
}
