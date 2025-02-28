class GameScreens {
  //PROPERTIES
  PFont sourceC, courier, courier2;
  PImage heart, selectArrow;
  PVector pos;
  int screen, score, hearts, highscore;
  Timer timer;
  int time=1000;//1 secs timer
  float posx=0;
  float pulse;
  //CONSTRUCTORS
  GameScreens(float x, float y) {
    pos= new PVector(x, y);
    score=0;
    highscore=score;
    screen=0;
    hearts=3;
    selectArrow=loadImage("selectArrow.png");
    heart= loadImage("Pixel Heart.png");//Art By Nicole Marie T
    sourceC= loadFont("SourceCodePro-ExtraLight-140.vlw");
    courier= loadFont("CourierNewPS-BoldMT-20.vlw");
    courier2= loadFont("CourierNewPS-BoldMT-48.vlw");
    timer= new Timer(time);//1 secs in millis
  }
  //METHODS
  void update() {
    switch(screen) {
    case 0:
      loadingScreen();
      break;
    case 1:
      gameScreen();
      break;
    case 2:
      endGame();
      break;
    default:
      loadingScreen();
      break;
    }
  }

  void scoreDisplay() {
    resetMatrix();
    pushMatrix();
    scale(1.0);
    //PLAYER 1 SCORE
    fill (0, 0, 255);//blue
    textSize(36);
    text ("Score: " + score, width-170, 50);
    popMatrix();
  }

  void heartsDisplay () {
    scale(1.25);
    if (hearts>=3&&hearts>2) {
      heart1();
      heart2();
      heart3();
    }
    if (hearts<3&&hearts>=2) {
      heart2();
      heart3();
    }
    if (hearts<2&&hearts>=1) {
      heart3();
    }
    if (hearts == 0) {
      screen=2;
    }
  }

  void heart1 () {
    image(heart, width-400, 70);
  }
  void heart2 () {
    image(heart, width-350, 70);
  }
  void heart3 () {
    image(heart, width-300, 70);
  }

  void loadingScreen() {
    screen=0;
    background(0);
    fill(255);//white fill
    textAlign(CENTER);
    textFont(sourceC);
    pulse=(sin(0.0625*frameCount)*10);
    text ("River Game", width/2.0-pulse, (height/2.5));
    textFont(courier2);
    textAlign(LEFT);
    fill(#9BF7FF);//light blue
    text ("Start Game\n\nExit Game", width/1.5, height/3.0);
    selectArrow();
  }
  void selectArrow() {
    pushMatrix();
    scale(0.75);
    image(selectArrow, width/2.8, height/1.5);
    popMatrix();
    resetMatrix();
  }
  void gameScreen() {
    background(#8CE3EA);
    for (int i = 0; i < 3; i ++) {
      strokeCap(SQUARE);
      strokeWeight (18);
      stroke(0);
      line(i, 0, i+200, height);
    }
    noStroke();
    scoreDisplay();
    heartsDisplay();
    boolean offScreenR=pos.x>width+50;
    if (offScreenR) {
      hearts--;
    }
  }

  void endGame() {
    resetMatrix();
    screen=2;
    background(0);
    fill(#46FF4D);
    float pulse2=(sin(0.06*frameCount)*5);
    pulse=(sin(0.025*frameCount)*20);
    circle(width/2.0, height/2.0-225, 125+pulse2);
    fill(255);//white fill
    textFont(sourceC);
    textAlign(CENTER);
    text ("YOU LOSE!", width/2.0, height/2.0);
    selectArrow();
    textFont(courier);
    float posx =width/2.0;
    text("Restart Game", posx, height/2.0+100+pulse);
    keyTyped();
  }


  void resetGame() {
    score=0;
    hearts=3;
    if (hearts==0) {
      screen=2;
    }
  }

  void keyTyped() {
    if (key==CODED&&keyCode==ENTER&&keyCode==RETURN) {
      println("Enter");
      screen=1;
      resetGame();
    }
    if (key==CODED&&keyCode==UP) {
      pos.y=height/1.5;
    }
    if (key==CODED&&keyCode==DOWN) {
      pos.y=height/1.2;
    }
  }
}
