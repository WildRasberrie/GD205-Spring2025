Paddles p;
Ball b;
int screen;
boolean playerControl = true;

void setup (){
  size(1000,1000);//set canvas size
  noStroke();
  noSmooth();
  
  screen=1;
  
  p= new Paddles (0,0);
  b= new Ball (random(width),random(height),35);
}

void draw(){
background(180); //background set to gray
//collision lines
stroke(255,0,0);
strokeWeight(5);
line(p.pos.x,p.pos.x,p.pos.y,p.pos.y);
line(b.pos.x,b.pos.x,b.pos.y,b.pos.y);


if (screen==1){
    boolean hitsPaddle = (dist(p.pos.x-50,p.pos.y-100,b.pos.x,b.pos.y)<=100);
  
  if(hitsPaddle){
    println("HIT!");
    b.heading.x*=-1;
    b.score++;
  }
  p.display();
  p.update();
  b.display();
  b.update();
}

if (screen==2){
  b.endGame();
}
  
}
