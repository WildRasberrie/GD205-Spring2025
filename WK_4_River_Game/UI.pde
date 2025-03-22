class UI {
  //PROPERTIES
  PFont redAlert;
  color[] button={#F29A27/*pastel orange*/,#AC00F7/*purple*/},
          textColor={#5742d5/*light blue*/,#78817A},
          textColor2={#5742d5/*light blue*/,#78817A};
  PImage[] heart;
  PImage grassOverlay,popupWindow;
  PVector pos, arrowPos, textPos,text2Pos;
  color[] waterColor={#0C73ED/*light blue*/, #5344E8/*dark blue*/};
  int screen, score, hearts, highscore;
  String[] fontList=PFont.list();
  Timer timer;
  int time=1000,w=75,h=75;//1 secs timer
  float pulse,buttonOpacity=100.00;
  //CONSTRUCTORS
  UI (float x, float y) {
    pos= new PVector(x, y);
    textPos= new PVector (width/2.70,height/1.51);
    text2Pos= new PVector (width/2.65,height/1.21);
    arrowPos= new PVector(width/3.00, height/1.36);
    score=0;
    highscore=score;
    screen=0;
    hearts=3;
    grassOverlay=loadImage("GrassOverlay.png");
    popupWindow=loadImage("popupwindow.png");
    heart= new PImage[2];
    heart[0]= loadImage("lives.png");
    heart[1]= loadImage("liveslost.png");
    redAlert= createFont(fontList[21], 40);
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
  void grassland(){
     background(#4b8424);//green
    image(grassOverlay,0,0);
  }
  void water() {
    fill(waterColor[0]);
    noStroke();
    rect(riverL.x, riverL.y, riverR.x, riverR.y);
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
    image(heart[0], 5, 30,w,h);
  }
  void heart2 () {
    image(heart[0],55, 30,w,h);
  }
  void heart3 () {
    image(heart[0], 105, 30,w,h);
  }
   void noHeart1 () {
    image(heart[1], 5, 30,w,h);
  }
  void noHeart2 () {
    image(heart[1], 55, 30,w,h);
  }
  void noHeart3 () {
    image(heart[1], 105, 30,w,h);
  }

  void loadingScreen() {
    grassland();
    //water();
    image(popupWindow,width/8.0, height/12.6,width/1.48,height/1.1);
    fill(0);
    textFont(redAlert);
    textAlign(CENTER);
    pulse=(sin(0.0625*frameCount)*10);
    text ("River\n Game", width/3.0, (height/4.0));
    textSize(39);
    text ("Do you want to start game?", width/2.2, (height/2.0-pulse));
    textAlign(LEFT);
    textSize(40);
    fill(textColor[0]);
    text ("Start Game", textPos.x, textPos.y);
    fill(textColor2[0]);
    text ("Exit Game", text2Pos.x, text2Pos.y);
   physics.startScreenControls();
    selectArrow();
  }
  void selectArrow() {
    //println("hello");
    float rounded = 6.17;
    strokeWeight(5);
    stroke(#161a17);
    fill(button[0],buttonOpacity);
    rect( arrowPos.x+30, arrowPos.y,textPos.x-170,textPos.y/8.46,
    rounded,rounded,rounded,rounded);
    noStroke();
  }
  void gameScreen() {
    grassland();
    water();//WATER DISPLAY & MOVEMENT
    physics.gameplayControls();//IMPORT GAME CONTROLS
    scoreDisplay();
    heartsDisplay();
    assets.display();//IMPORT ASSETS DISPLAY & UPDATE
    assets.update();
  }
  void endGame() {
    opacity=0;
    background(0);
    fill(255);//white fill
    textAlign(CENTER);
    text ("YOU LOSE!", width/2.0, height/2.0);
    textAlign(LEFT);
    text("Reset Game", textPos.x,textPos.y);
    text("Exit Game",text2Pos.x,text2Pos.y);
    physics.startScreenControls();
    selectArrow();
  }
  void resetGame() {
    score=0;
    hearts=3;
    if (hearts==0) {
      screen=2;
    }
  }
}
