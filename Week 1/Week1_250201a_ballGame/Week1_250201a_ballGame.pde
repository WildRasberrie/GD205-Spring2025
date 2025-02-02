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
  gs.display();
  gs.update();

  for(int i=0;i<p.length;i++){
    p[i].display();
    p[i].update();
  }
  
  b.display();
  b.update();
  if (screen==1){
  for(int i=0;i<p.length;i++){
    boolean hitsLPaddle = (b.pos.x+r<=p[0].pos.x+s);//l side
    boolean hitsRPaddle = (b.pos.x+r>p[1].pos.x/2-s/2);//r side

    if(hitsLPaddle){
      println("HIT!");
      testX = p[0].pos.x+s/2.2;
      b.heading.x*=max(-1.25,-4.0);
      b.heading.y*=max(-1,-4.0);
      gs.score++;
      break;
    }else if (hitsRPaddle){
      println("HIT!");
      testX=p[1].pos.x-s/2;
      b.heading.x*=max(-1.25,-4.0);
      b.heading.y*=max(-1,-4.0);
      gs.score++;
      break;
    }
  float distX = b.pos.x+r-testX;
  float distY = b.pos.y+r-testY;
  distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= r) {
    println (true);
  }
  println (false);
  }
}
  println("Ball POS    "+(b.pos.x+r)+ "   Paddle POS   "+(p[1].pos.x/2-s/2));//Checking ball collision 
}
