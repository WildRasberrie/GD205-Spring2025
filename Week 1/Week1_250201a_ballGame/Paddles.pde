//PROPERTIES
class Paddles{
  PVector pos,heading;
  float speed;

//CONSTRUCTORS
Paddles(float x, float y){
  pos= new PVector (x,y);//setting pos
  heading= new PVector (0,1);//heading on Y-Axis
  speed=0.0;//setting initial speed to 0 
}


//METHODS
void display (){
  fill(0);//fill is black
  pushMatrix();
  translate(pos.x,pos.y);//setting origin pt 
  rect(-3,4,40,200);//L-side Paddle 
  popMatrix();
}

void update(){
  //Implementing controls
  if(playerControl){
    ButtonPressed(); 
  }
  //Border Barriers
  boolean offTop,offBottom;
  offTop= (pos.y<1);
  offBottom=(pos.y>800);
  if (offTop){
    pos.y=0;
  }
  if (offBottom){
    pos.y=(800);
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
