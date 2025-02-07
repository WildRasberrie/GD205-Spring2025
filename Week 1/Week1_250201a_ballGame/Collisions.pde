class Collisions{
  //PROPERTIES
  PVector pos;
  //CONSTRUCTORS
  Collisions(float x, float y){
    pos=new PVector(x,y);
  }
  //METHODS
  void display(){
    ballCollision();
    wallCollision();
  }
  void update(){
    ballCollision();
    wallCollision();
    //println("Ball Speed"+(b.heading.x)+","+(b.heading.y)+"Max Speed"+b.maxSpeed);
    //image(fire,-b.pos.x-20,b.pos.y);
  }
  void ballCollision(){
   boolean ballCollidesL=b.pos.x>=-3&&
                       b.pos.x<=50&&//l paddle x-axis
                       b.pos.y>=(b.pos.y-50)&&//top paddle y axis
                       b.pos.y<=(b.pos.y+700);//bottom paddle y axis 

   boolean ballCollidesR=b.pos.x>(width-50) && b.pos.x<width &&//r paddle x-axis
                        b.pos.y>=(p.pos.y-50)&&//top paddle y axis
                        b.pos.y<=((p.pos.y)+250);//bottom paddle y axis 
   if(ballCollidesL){
        println("L HIT!");
        bounceSound.play();
        b.pos.x=100;
        b.heading.x*=-1.2;
        b.heading.y*=-1.2;
        gs.score2++;  
         //if(b.heading.x>5.0){
         // b.display();
         // image(fire,-b.pos.x-20,b.pos.y);
         //}
       }
    if(ballCollidesR){
        println("R HIT!");
        bounceSound.play();
        b.pos.x=width-100;
        b.heading.x*=-1.2;
        b.heading.y*=-1.2;
        gs.score++; 
        //if(b.heading.x<-5.0){
        //  b.display();
        //  image(fire,-b.pos.x-20,b.pos.y);
       //}
     }
  }
  void wallCollision(){
    if(gs.screen==1){
      if (b.pos.y>(height)){//BOTTOM BARRIER
          //println("BOTTOM BARRIER WORKING!");
          b.pos.y=height;
          b.heading.y*=-1.0;
        }
        if (b.pos.y<0){//TOP BARRIER
          //println("TOP BARRIER WORKING!");
          b.pos.y=0;
          b.heading.y*=-1.0;
        }
     }
  }
}
