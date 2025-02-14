class GameScreens{
//PROPERTIES
  PFont sourceC,courier,courier2;
  PImage heart,up;
  PVector pos;
  int screen,score,score2,hearts,highscore;
  float posx=0;
  float pulse;
  //CONSTRUCTORS
  GameScreens(float x, float y){
    pos= new PVector(x,y);
    score=0;
    score2=0;
    highscore=score;
    screen=0;// set screen to intro
    hearts=3;
    heart= loadImage("Pixel Heart.png");//Art By Nicole Marie T
    up= loadImage("up-arrow.gif");//Art By Nicole Marie T
    sourceC= loadFont("SourceCodePro-ExtraLight-140.vlw");
    courier= loadFont("CourierNewPS-BoldMT-20.vlw");
    courier2= loadFont("CourierNewPS-BoldMT-48.vlw");
   }
  //METHODS
  void display(){
    if (screen==0){
      loadingScreen();
      keyTyped();
    }
    if(screen==1){
      gameScreen();
    }
    if(screen==2){
      endGame();
    }
  }
  void update(){
    if (screen==0){
      keyTyped();
      loadingScreen();
    }else if(screen==1){
        gameScreen();
    }else if (screen==2){
      endGame();
    }
  }
  
  void scoreDisplay(){
  resetMatrix();
  pushMatrix();
  scale(1.0);
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
    scale(1.25); 
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
      screen=2;
    }
  }
  
  void heart1 (){image(heart,width-400,70);}
  void heart2 (){image(heart,width-350,70);}
  void heart3 (){image(heart,width-300,70);}
  
  void loadingScreen(){
    switch(screen){
      case 0:
        screen=0;
        background(0);
        fill(255);//white fill
        textAlign(CENTER);
        textFont(sourceC);
        pulse=(sin(0.0625*frameCount)*10);
        text ("GALAGA",width/2.0-pulse,(height/2.0));
        textFont(courier);
        text ("(Student Rendition)",width/2.0,height/2.0+50); 
        textFont(courier2);
        fill(#9BF7FF);//light blue
        text ("Press \t \t \t to Start!",width/2.0,height/2.0+200);
        upArrow();
        break;
    }
  }
  void upArrow(){
    pushMatrix();
    scale(0.75);
    image(up,width/1.9,height/2.0+347);
    popMatrix();
    resetMatrix();
  }
  void gameScreen(){
     switch(screen){
        case 1:
          background(0);
         for (int i = 0; i < 1000; i = i+33) {
          strokeCap(SQUARE);
          strokeWeight (18);
          stroke(0);
          line(473, i, 480, i);
        }
        noStroke();
        scoreDisplay();
        heartsDisplay();
        }
    }
  
  
  void endGame(){
    switch(screen){
     case 2:
        resetMatrix();
        screen=2;
        background(0);//black
        pulse=(sin(0.025*frameCount)*20);
        fill(255);//white fill
        textFont(sourceC);
        textAlign(CENTER);
        text ("YOU LOSE!",width/2.0,height/2.0);
        textFont(courier2);
        text ("Press \t \t \t to reset game",width/1.8,height/2.0+200);
        upArrow();
        textFont(courier);
        float posx =width/2.0;
        text("Try Again?",posx,height/2.0+100+pulse);
        keyTyped();
        break;
      }
    }
    

  void resetGame(){
    switch(screen){
      case 1:
        score=0;
        score2=0;
        hearts=3;
        if(hearts==0){
          screen=2;
        break;
      }
    }
  }
    
  void keyTyped(){
    if (key==CODED &&keyCode==RIGHT){
      println("RIGHT PRESSED");
      screen=1;
      resetGame();
     }
  }
}
