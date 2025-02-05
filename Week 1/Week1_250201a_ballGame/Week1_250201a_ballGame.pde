import processing.sound.*;
SoundFile bounceSound,loseHealthSound,
          endGameSound,selectSound,backgroundMusic;
Paddles p;
Ball b;
GameScreens gs;
//CollisionBarrier[] cb;
int screen,s,r;
boolean playerControl = true;
float testX,testY,distance,ballY;

void setup (){
  size(1000,1000);//set canvas size
  noStroke();
  noSmooth();
  // sound effects from Pixabay 
  //(AUTHORS: freesound_community, SergeQuadrado, floraphonic,Make_More_Sound)
  bounceSound=new SoundFile(this, "jump-sound.wav");
  loseHealthSound=new SoundFile(this, "action-negative.wav");
  endGameSound=new SoundFile(this, "game-lose-sound.wav");
  selectSound=new SoundFile(this, "decide.wav");
  backgroundMusic=new SoundFile(this, "bigbeatloop.mp3");
  backgroundMusic.loop();
  p= new Paddles(0,height/2.0);
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
  if (screen==1){
    b.display();
    b.update();
    p.display();
    p.update();
    }
 }
