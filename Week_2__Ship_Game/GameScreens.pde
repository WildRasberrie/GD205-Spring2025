class GameScreens {
  //PROPERTIES
  PFont redAlert;
  PImage selectArrow;
  PVector pos;
  int screen;
  String[] fontList=PFont.list();
  float arrowPOSY=height/2.0+145, arrowPOSX=width/4.0, posx=0, pulse;
  //CONSTRUCTORS
  GameScreens(float x, float y) {
    pos= new PVector(x, y);
    selectArrow=loadImage("selectArrow.png");
    screen=0;// START GAME ON INTRO SCREEN
    redAlert= createFont(fontList[21], 140);//IMPORT CUSTOM FONT
  }
  //METHODS
  void display() {
    switch(screen) {
    case 0:
      loadingScreen();
      break;
    }
    switch(screen) {
    case 1:
      gameScreen();
      break;
    }
    switch(screen) {
    case 2:
      endGame();
      break;
    }
  }
  void update() {
    switch(screen) {//IF SCREEN  = 0, SHOW LOADING SCREEN
    case 0:
      loadingScreen();
      break;
    }
    switch(screen) {// IF SCREEN = 1, SHOW GAME SCREEN
    case 1:
      gameScreen();
      break;
    }
    switch(screen) {// IF SCREEN = 2, SHOW LOSER SCREEN
    case 2:
      endGame();
      break;
    }
  }
  void loadingScreen() {
    switch(screen) {
    case 0:
      screen=0;
      introDisplay();//IMPORT INTRO BACKGROUND
      physics.startControls();//SELECT CONTROLS
      break;
    }
  }
  void gameScreen() {
    switch(screen) {
    case 1:
      starDisplay();//IMPORT START BACKGROUND
      e.display();//ENEMY DISPLAY & UPDATE
      e.update();
      s.display();//SHIP DISPLAY & UPDATE
      s.update();
      ui.display();//UI DISPLAY
      physics.gameplayControls(); //PLAYER CONTROLS
      break;
    }
  }
void endGame() {
  switch(screen) {
  case 2:
    screen=2;
    loseGameDisplay();      //IMPORT END GAME SCREEN
    physics.startControls();//PLAYER CONTROLS
    break;
  }
}
void resetGame() {    //RESET GAME SCREEN
  switch(screen) {
  case 1:
    ui.score=0;
    ui.spaceLives=3;
    if (ui.spaceLives==0) {
      screen=2;
      break;
    }
  }
}
void introDisplay() {
  background(0);
  fill(255);//white fill
  textAlign(CENTER);
  textFont(redAlert);
  pulse=(sin(0.0625*frameCount)*10);
  text ("GALAGA", width/2.0, (height/3.0)-pulse);
  textSize(36);
  text ("(Student Rendition)", width/2.0, height/3.0+50);
  fill(#9BF7FF);//light blue
  textSize(56);
  textAlign(LEFT);
  text ("START\nEXIT GAME", width/2.0-150, height/2.0+200);
  image(selectArrow, arrowPOSX, arrowPOSY);
}
void starDisplay() {
  pushMatrix();
  background(0);
  noStroke();
  stroke(map(millis(), 0, 1000, 0, 120)%255);
  for (int i = 0; i <width*2; i = i+300) {
    for (int j = 0; j < height*2; j = j+900) {
      point(i+(cos(frameCount*0.0005)*320), j-(sin(frameCount*0.0005)*160));
    }
  }
  stroke(map(millis(), 0, 1000, 0, 100)%255);
  for (int i = 20; i < width*2; i = i+600) {
    for (int j = 0; j <height*2; j = j+800) {
      point(i-(cos(frameCount*0.0005)*160), j+(sin(frameCount*0.0005)*160));
    }
    stroke(map(millis(), 0, 1000, 0, 70)%255);
    for (int k = 20; k < width*2; k = k+200) {
      for (int j = 0; j <height*2; j = j+400) {
        point(k-(cos(frameCount*0.0005)*130), j+(sin(frameCount*0.0005)*160));
      }
    }
  }
  popMatrix();
  resetMatrix();
}
  void loseGameDisplay(){
    background(0);//black
    pulse=(sin(0.025*frameCount)*20);
    fill(255);//white fill
    textFont(redAlert);
    textSize(70);
    textAlign(CENTER);
    text ("YOU LOSE!", width/2.0, height/2.0);
    textSize(56);
    text ("NEW GAME\nEXIT GAME", width/2.0-150, height/2.0+200);
    float posx =width/2.0;
    text("Try Again?", posx, height/2.0+100+pulse);
  }
}
