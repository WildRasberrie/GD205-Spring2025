import gifAnimation.*;
import processing.sound.*;
SoundFile bounceSound,loseHealthSound,
          endGameSound,selectSound,backgroundMusic;
Gif fire,up,clearClouds,gameOverBall;
Paddles p;
Ball b;
GameScreens gs;
Collisions c;
int screen,s,r;
boolean playerControl = true;
boolean bgm=true;
float testX,testY,distance,ballY;

void setup (){
  size(1000,1000);//set canvas size
  noStroke();
  noSmooth();
  s=100;
  r=20;
  testX=random(width);
  testY=random(max(height/2.0,0));
  //GIF from Pixabay (AUTHOR:YitingET)
  fire= new Gif(this,"fire.gif");
  fire.loop();
  //GIF from Pixabay (AUTHOR:YitingET)
  up= new Gif(this,"up-arrow.gif");
  up.loop();
  //GIF from Pixabay (AUTHOR:MXJfiles)
  clearClouds=new Gif (this,"Clearclouds.gif");
  clearClouds.loop();
  gameOverBall=new Gif (this,"gameOverBall.gif");
  gameOverBall.loop();
  // sound effects from Pixabay 
  //(AUTHORS: freesound_community,floraphonic, Ivan Luzan,Make_More_Sound)
  endGameSound=new SoundFile(this, "game-lose-sound.wav");
  bounceSound=new SoundFile(this, "jump-sound.wav");
  loseHealthSound=new SoundFile(this, "action-negative.wav");
  selectSound=new SoundFile(this, "decide.wav");
  backgroundMusic=new SoundFile(this, "bigbeatloop.mp3");
  backgroundMusic.loop();
  p= new Paddles(0,height/2.0);
  b= new Ball (testX,testY,37);
  gs= new GameScreens(width,height);
  c=new Collisions(width,height);
}
void draw(){
  gs.display();
  gs.update();
  if (gs.screen==1){
    c.display();
    c.update();
    b.display();
    b.update();
    p.display();
    p.update();
  }
  if(gs.screen==2){
  gs.endGame();
 }
 }
 
 
