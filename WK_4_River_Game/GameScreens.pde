class GameScreens {
  //PROPERTIES
  PFont redAlert;
  PImage heart, selectArrow;
  PVector pos, arrowPos;
  color[] waterColor={#0C73ED/*light blue*/, #5344E8/*dark blue*/};
  int screen, score, hearts, highscore;
  String[] fontList=PFont.list();
  Timer timer;
  int time=1000;//1 secs timer
  float pulse;
  //CONSTRUCTORS
  GameScreens(float x, float y) {
    pos= new PVector(x, y);
    arrowPos= new PVector(width/2.8, height/1.45);
    score=0;
    highscore=score;
    screen=0;
    hearts=3;
    selectArrow=loadImage("selectArrow.png");
    heart= loadImage("Pixel Heart.png");//Art By Nicole Marie T
    redAlert= createFont(fontList[21], 40);
    timer= new Timer(time);//1 secs in millis
  }
  //METHODS
  void update() {
    //switch(screen) {
    //case 0:
    //  loadingScreen();
    //  break;
    //case 1:
    gameScreen();
    //  break;
    //case 2:
    //  endGame();
    //  break;
    //default:
    //  loadingScreen();
    //  break;
    //}
  }
  void water() {
    rotate(TAU/4.0);
    for (int j=0; j<width; j+=width/12.1) {
      fill(waterColor[0]);
      arc( width/20.9+(j+pulse), height/-4.3, 171, 47, 0, TAU/2);
      rotate(TAU/2.0);
      arc(- width/1.0+(j+pulse), height/1.4, 184, 54, 0, TAU/2);
    }
    //inner water lines
    for (int i=2; i<width; i+=width/5.0) {
      for (int j=-23; j<219; j+=100) {
        fill(waterColor[1]);
        arc(-width/1.1+(i-pulse), height/3.8+j, 211, 135, 0, TAU/2);
        fill(waterColor[0]);
        arc(-width/1.1+(i-pulse), height/4.1+j, 419, 142, 0, TAU/2);
      }
    }
    for (int i=2; i<width; i+=width/5.0) {
      for (int j=-23; j<219; j+=100) {
        fill(waterColor[1]);
        arc(-width/1.1+(i+pulse), height/3.5+j, 211, 135, 0, TAU/2);
        fill(waterColor[0]);
        arc(-width/1.1+(i+pulse), height/3.8+j, 419, 142, 0, TAU/2);
      }
    }
  }
  void scoreDisplay() {
    resetMatrix();
    pushMatrix();
    scale(1.0);
    fill (255);//white fill
    textFont(redAlert);
    text ("SCORE: " + score, 30, 38);
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
    image(heart, 25, 30);
  }
  void heart2 () {
    image(heart, 75, 30);
  }
  void heart3 () {
    image(heart, 125, 30);
  }

  void loadingScreen() {
    screen=0;
    background(0);
    fill(255);//white fill
    textFont(redAlert);
    textAlign(CENTER);
    pulse=(sin(0.0625*frameCount)*10);
    text ("River Game", width/2.0-pulse, (height/2.5));
    textAlign(LEFT);
    fill(#9BF7FF);//light blue
    text ("Start Game\n\nExit Game", width/3.1, height/1.8);
    keyTyped();
    selectArrow();
  }
  void selectArrow() {
    pushMatrix();
    scale(0.75);
    image(selectArrow, arrowPos.x, arrowPos.y);
    popMatrix();
    resetMatrix();
  }
  void gameScreen() {
    background(#4b8424);//green
    fill(waterColor[0]);
    noStroke();
    pulse=(sin(0.0625*frameCount)*10);
    rect(width/4.4, 0, width/2.0, height);
    water();
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
    fill(255);//white fill
    textAlign(CENTER);
    text ("YOU LOSE!", width/2.0, height/2.0);
    selectArrow();
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
    if (key==CODED&&keyCode==RETURN||keyCode==ENTER) {
      println("Enter");
      screen=1;
      resetGame();
    } else if (keyCode==UP) {
      println("UP");
      arrowPos.y=height/1.45;
    } else if (keyCode==DOWN) {
      println("DOWN");
      arrowPos.y=height/1.21;
    }
  }
}
