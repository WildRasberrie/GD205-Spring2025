Paddles[] p;
Ball b;
GameScreens gs;
//CollisionBarrier[] cb;
int screen,s,r;
boolean playerControl = true;
float testX,testY,distance;

void setup (){
  size(1000,1000);//set canvas size
  noStroke();
  noSmooth();
  
  p= new Paddles[2];
  for(int i=0;i<p.length;i++){
    p[0]=new Paddles(0,height/2.0);
    p[1]=new Paddles(width-35,height/2.0);
  }
  b= new Ball (random(width),random(height),35);
  gs= new GameScreens(width,height);
  s=100;
  r=20;
  testX=b.pos.x+r;
  testY=b.pos.y+r;
}

void draw(){
   //Bounce off borders
    if (b.pos.y>(height)){//BOTTOM BARRIER
      //println("BOTTOM BARRIER WORKING!");
      b.pos.y=(height);
      b.heading.y*=-1;
    }
    if (b.pos.y<100){//TOP BARRIER
      //println("TOP BARRIER WORKING!");
      b.pos.y=100;
      b.heading.y*=-1;
    }
  gs.display();
  gs.update();
 
  for(int i=0;i<p.length;i++){
    b.display();
    b.update();
    p[i].display();
    p[i].update();
  }
}
