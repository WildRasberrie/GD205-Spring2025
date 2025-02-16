class Bullet{
//PROPERTIES
PVector pos;
float motion;
//CONSTRUCTORS
  Bullet(float x,float y){
    pos= new PVector (x,y);
  }
//METHODS
    void display(){
      stroke(255,0,0);//red
      strokeWeight(10);
      line(s.pos.x,s.pos.y+pos.y,s.pos.x,s.pos.y+pos.y+25);
    }
  void collision(){
  if (dist(pos.x,pos.y,e.pos.x,e.pos.y)<5){
      e.pos.x=width+50; 
      gs.score+=100;
    }
  }
}
