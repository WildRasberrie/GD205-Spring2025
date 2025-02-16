class GameScreens{
//PROPERTIES
  PFont sourceC,courier,courier2,redAlert;
  PImage spaceLife,up;
  PVector pos;
  int screen,score,spaceLives,highscore;
  float posx=0;
  float pulse;
  String[] fontList=PFont.list();
  //CONSTRUCTORS
  GameScreens(float x, float y){
    pos= new PVector(x,y);
    score=0;
    highscore=score;
    screen=0;// set screen to intro
    spaceLives=3;
    spaceLife= loadImage("SpaceLife.png");//(MODIFIED) Original Art By Christopher_Konrad
    redAlert= createFont(fontList[21],140);
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
  //SCORE
  fill (255);//white
  pushMatrix();
  scale(0.65);
  textFont(redAlert);
  text (score,50,100);
  popMatrix();
  resetMatrix();
  }
  
  void spaceLivesDisplay (){
    scale(1.25); 
    if(spaceLives>=3&&spaceLives>2){
      spaceLife1();
      spaceLife2();
      spaceLife3();
    }
    if (spaceLives<3&&spaceLives>=2){
      spaceLife2();
      spaceLife3();
    }
    if (spaceLives<2&&spaceLives>=1){
      spaceLife3();
    }
    if (spaceLives == 0){
      screen=2;
    }
  }
  
  void spaceLife1 (){image(spaceLife,50,height-300);}
  void spaceLife2 (){image(spaceLife,100,height-300);}
  void spaceLife3 (){image(spaceLife,150,height-300);}
  
  void loadingScreen(){
    switch(screen){
     case 0:
        screen=0;
        background(0);
        fill(255);//white fill
        textAlign(CENTER);
        textFont(redAlert);
        pulse=(sin(0.0625*frameCount)*10);
        text ("GALAGA",width/2.0-pulse,(height/2.0));
        textSize(36);
        text ("(Student Rendition)",width/2.0,height/2.0+50); 
        fill(#9BF7FF);//light blue
        textSize(56);
        text ("Press ENTER to Start!",width/2.0,height/2.0+200);
        break;
    }
  }
  
  void gameScreen(){
     switch(screen){
        case 1:
        background(0);
        noStroke();
        stroke(map(millis(),0,1000,0,100)%255);
        strokeWeight(2);
        for (int i = 120; i < width; i = i+100) {
          for (int j = 0; j < height; j = j+100){
            point(i,j);
          }
        }
        scoreDisplay();
        spaceLivesDisplay();
        e.display();
        e.update();
        s.display();
        s.update();
        shoot.display();
        break;
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
        textFont(redAlert);
        textSize(70);
        textAlign(CENTER);
        text ("YOU LOSE!",width/2.0,height/2.0);
        textSize(56);
        text ("Press ENTER to reset game",width/1.8,height/2.0+200);
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
        spaceLives=3;
        if(spaceLives==0){
          screen=2;
      }
      break;
    }
  }    
  void keyTyped(){
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER){
      println("ENTER PRESSED");
      screen=1;
      resetGame();
     }
  }
}
