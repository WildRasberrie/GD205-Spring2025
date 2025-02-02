Paddles[] p;
Ball b;
CollisionBarrier[] cb;
int screen,s,r;
boolean playerControl = true;

void setup (){
  size(1000,1000);//set canvas size
  noStroke();
  noSmooth();
  
  screen=1;
  
  p= new Paddles[2];
  for(int i=0;i<p.length;i++){
    p[0]=new Paddles(0,height/2.0);
    p[1]=new Paddles(width-50,height/2.0);
  }
  
  b= new Ball (random(width),random(height),35);
  cb=new CollisionBarrier[2];
  for(int i=0;i<cb.length;i++){
    cb[0]=new CollisionBarrier(-50,height-410,100);
    cb[1]=new CollisionBarrier(width+50,height-410,100);
  }
  s=200;
  r=20;
}

void draw(){
background(180); //background set to gray

if (screen==1){
  for(int i=0;i<cb.length;i++){
    boolean hitsPaddle = (dist(b.pos.x,b.pos.y,cb[i].pos.x,cb[i].pos.y)<s);

    if(hitsPaddle){
      println("HIT!");
      b.pos.x=cb[i].pos.x;
      b.heading.x*=-1;
      b.score++;
    }
  }
  for(int i=0;i<p.length;i++){
    p[i].display();
    p[i].update();
  }
   for(int i=0;i<cb.length;i++){
    cb[i].display();
    cb[i].update();
  }
  b.display();
  b.update();
}

if (screen==2){
  b.endGame();
}
  int i=0;
   println("Distance:  "+dist(b.pos.x,b.pos.y,cb[i].pos.x,cb[i].pos.y));//Checking ball collision 
}
