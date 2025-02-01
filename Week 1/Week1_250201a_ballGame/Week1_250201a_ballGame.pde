Paddles[] p;
Ball b;
int screen;
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
}

void draw(){
background(180); //background set to gray
//collision lines
stroke(255,0,0);
strokeWeight(5);
pushMatrix();
translate(b.pos.x,b.pos.y);
line(b.pos.x,b.pos.x,b.pos.y,b.pos.y);
popMatrix();


if (screen==1){
  for(int i=0;i<p.length;i++){
    boolean hitsPaddle = (dist(p[i].pos.x-50,p[i].pos.y-100,b.pos.x,b.pos.y)<=10);
    
    if(hitsPaddle){
      println("HIT!");
      b.heading.x*=-1;
      b.score++;
    }
  }
  for(int i=0;i<p.length;i++){
    p[i].display();
    p[i].update();
  }
  b.display();
  b.update();
}

if (screen==2){
  b.endGame();
}
  
}
