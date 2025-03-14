class UI {
  //PROPERTIES
  PFont redAlert;
  PImage[] heart;
  PImage selectArrow,grassOverlay;
  PVector pos, arrowPos;
  color[] waterColor={#0C73ED/*light blue*/, #5344E8/*dark blue*/};
  int screen, score, hearts, highscore;
  String[] fontList=PFont.list();
  Timer timer;
  int time=1000;//1 secs timer
  float pulse;
  //CONSTRUCTORS
  UI (float x, float y) {
    pos= new PVector(x, y);
    arrowPos= new PVector(width/2.8, height/1.45);
    score=0;
    highscore=score;
    screen=0;
    hearts=3;
    grassOverlay=loadImage("GrassOverlay.png");
    selectArrow=loadImage("selectArrow.png");
    heart= new PImage[2];
    heart[0]= loadImage("lives.png");
    heart[1]= loadImage("deadFrog.png");
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
    float motion=(sin(0.0625*frameCount)*20);
    rotate(TAU/4.0);
    for (int j=0; j<width; j+=width/12.1) {
      fill(waterColor[0]);
      arc( width/20.9+(j+motion), height/-4.5, 171, 47, 0, TAU/2);
      rotate(TAU/2.0);
      arc(- width/1.0+(j+motion), height/1.4, 184, 54, 0, TAU/2);
    }
    //inner water lines
    for (int i=-40; i<width; i+=width/5.2) {
      for (int j=-23; j<173; j+=77) {
        fill(waterColor[1]);
        arc(-width/1.1+(i-motion), height/4.18+j, 221, 127, 0, TAU/2);
        fill(waterColor[0]);
        arc(-width/1.1+(i-motion), height/4.20+j, 264, 111, 0, TAU/2);
      }
    }
    for (int i=0; i<width; i+=width/5.2) {
      for (int j=-23; j<219; j+=100) {
        fill(waterColor[1]);
        arc(-width/1.12+(i+pulse), height/2.1+j, 216, 120, 0, TAU/2);
        fill(waterColor[0]);
        arc(-width/1.12+(i+pulse), height/2.11+j, 256, 105, 0, TAU/2);
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
      noHeart1();
      heart2();
      heart3();
    }
    if (hearts<2&&hearts>=1) {
      noHeart1();
      noHeart2();
      heart3();
    }
    if (hearts == 0) {
      noHeart1();
      noHeart2();
      noHeart3();
      screen=2;
    }
  }
  void heart1 () {
    image(heart[0], 5, 30);
  }
  void heart2 () {
    image(heart[0],55, 30);
  }
  void heart3 () {
    image(heart[0], 105, 30);
  }
   void noHeart1 () {
    image(heart[1], 5, 30);
  }
  void noHeart2 () {
    image(heart[1], 55, 30);
  }
  void noHeart3 () {
    image(heart[1], 105, 30);
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
    physics.startScreenControls();
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
    image(grassOverlay,0,0);
    fill(waterColor[0]);
    noStroke();
    pulse=(sin(0.0625*frameCount)*10);
    rect(riverL.x, riverL.y, riverR.x, riverR.y);
    water();//WATER DISPLAY & MOVEMENT
    physics.gameplayControls();//IMPORT GAME CONTROLS
    scoreDisplay();
    heartsDisplay();
    assets.display();//IMPORT ASSETS DISPLAY & UPDATE
    assets.update();
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
    text("Restart Game", posx, height/2.05+100+pulse);
    physics.startScreenControls();
  }
  void resetGame() {
    score=0;
    hearts=3;
    if (hearts==0) {
      screen=2;
    }
  }
}
