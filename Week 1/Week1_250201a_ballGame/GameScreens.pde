class GameScreens{
//PROPERTIES
  PFont sourceC,courier,courier2;
  PImage heart;
  PVector pos, ballPOS;
  int screen,score,score2,hearts;
  Timer timer;
  int time=1000;//1 secs timer
  boolean start=false;
  boolean game=false;
  boolean end=false;
  //CONSTRUCTORS
  GameScreens(float x, float y){
    pos= new PVector(x,y);
    ballPOS= new PVector (b.pos.x,b.pos.y);
    screen=0;
    score=0;
    score2=0;
    hearts=3;
    heart= loadImage("Pixel Heart.png");//Art By Nicole Marie T
    sourceC= loadFont("SourceCodePro-ExtraLight-140.vlw");
    courier= loadFont("CourierNewPS-BoldMT-20.vlw");
    courier2= loadFont("CourierNewPS-BoldMT-48.vlw");
    timer= new Timer(time);//1 secs in millis 
   }
  //METHODS
  void update(){
    if (screen==0){
      start=true;
      if(start){
        loadingScreen();
        backgroundMusic.loop();
      }
    }
        if (key==CODED){
          if(keyCode==ENTER){
          start=false;
          println("enter!");
          selectSound.play();
          game=true;
       }
     }
    if(game){
        gameScreen();
    }
    if (end){
      endGame();
    }
    println("start:"+start);
  }
  
  void scoreDisplay(){
  resetMatrix();
  pushMatrix();
  //PLAYER 1 SCORE
  fill (0,0,255);//blue
  textSize(36);
  text ("Score: " + score,width-170,50);
  //PLAYER 2 SCORE
  fill (0);//black
  textSize(36);
  text ("Score: " + score2,150,50);
  popMatrix();
  }
  
  void heartsDisplay (){
    if(hearts>=3&&hearts>2){
      heart1();
      heart2();
      heart3();
    }
    if (hearts<3&&hearts>=2){
      heart2();
      heart3();
    }
    if (hearts<2&&hearts>=1){
      heart3();
    }
    if (hearts == 0){
      end=true;
    }
  }
  
  void heart1 (){image(heart,width-165,70);}
  void heart2 (){image(heart,width-125,70);}
  void heart3 (){image(heart,width-85,70);}
  
  void loadingScreen(){
    screen=0;
    background(0);
    fill(255);//white fill
    textAlign(CENTER);
    textFont(sourceC);
    text ("PONG",width/2.0,height/2.0);
    textFont(courier);
    text ("(Student Rendition)",width/2.0,height/2.0+50); 
    textFont(courier2);
    text ("Press ENTER to Start!",width/2.0,height/2.0+200);
  }
  void gameScreen(){
     screen=1;
     background(180);
     for (int i = 0; i < 1000; i = i+33) {
      stroke(0);
      strokeWeight (18);
      line(473, i, 480, i);
    }
    noStroke();
    scoreDisplay();
    heartsDisplay();
    boolean offScreenR=b.pos.x>width+100;
    boolean offScreenL=b.pos.x<0;
    if(offScreenR){
      b.pos.x=random(width);
      loseHealthSound.play();
      hearts--;
    }
    if (offScreenL){
      timer.start();
      textSize(100);
      textAlign(CENTER);
      fill(255);
      rect(width/2-250,height/2-100,
           width/2,height/2-350);
      fill(0);
      rect(width/2-245,height/2-95,
           width/2-5,height/2-345);
      fill(#D3D63A);//Yellow
      text("NICE ONE!",width/2,height/2);
      if (timer.isFinished()){
    
      }
    }
  }
  void endGame(){
    end=true;
    endGameSound.play();
    resetMatrix();
    screen=2;
    background(0);
    fill(255);//white fill
    textSize(180);
    textAlign(CENTER);
    text ("YOU LOSE!",width/2.0,height/2.0);
    textSize(50);
    text ("Press 'R' to reset game",width/2.0,height/2.0+50); 
  }
  void resetGame(){
      game=true;
      screen=1;
    }
}
