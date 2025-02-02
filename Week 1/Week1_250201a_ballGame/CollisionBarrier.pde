//PROPERTIES
class CollisionBarrier{
PVector pos, heading;
float size,speed;
//CONSTRUCTORS
CollisionBarrier(float x, float y, float s){
  pos= new PVector (x,y);//setting pos
  heading= new PVector (0,1);//heading on Y-Axis
  size=s;
  speed=0.0;
}

//METHODS
void display(){
  fill(100);//fill is black
  pushMatrix();
  translate(pos.x,pos.y);//setting origin pt 
  circle(-3,40,200);//L-side Paddle 
  popMatrix();
}
void update(){
    //Implementing controls
  if(playerControl){
    ButtonPressed(); 
  }
  //Border Barriers
  boolean offTop,offBottom;
  offTop= (pos.y<100);
  offBottom=(pos.y>900);
  if (offTop){
    pos.y=100;
  }
  if (offBottom){
    pos.y=(900);
  }
  
    pos.add(PVector.mult(heading,speed));
}
    
   void ButtonPressed(){
     if (key == 'w'||key=='W' || (key==CODED && keyCode ==UP)){
          pos.y-=5;
      }
      if (key == 's'||key=='S' || (key==CODED && keyCode ==DOWN)){
          pos.y+=max(5,0);
      }     
   }
}
