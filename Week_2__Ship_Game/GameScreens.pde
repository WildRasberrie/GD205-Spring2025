class GameScreens {
  //PROPERTIES
  PFont redAlert;
  PImage selectArrow;
  PVector pos;
  int screen,j=0;
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
      for (int i = 0; i < 320; i = i+100) {
        for (int j = 0; j < 320; j = j+100) {
        e[i].display();//ENEMY DISPLAY & UPDATE
        e[i].update();
        e[j].display();//ENEMY DISPLAY & UPDATE
        e[j].update();
        }
      }
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
  float starMovement=(sin(frameCount*0.0025)*120);
  noStroke();
  strokeWeight(2);
  stroke(map(millis(), 0, 1000, 0, 50)%100);
  for (int i = 0; i <width; i = i+70) {
    for (int j = -200; j < height+100; j = j+100) {
      point(i, j+starMovement); 
    }
  }
  stroke(map(millis(), 0, 1000, 0, 50)%90);
  for (int i = 20; i < width; i = i+100) {
    for (int j = -200; j <height+150; j = j+120) {
      point(i, j+starMovement);
    }
    stroke(map(millis(), 0, 1000, 0, 50)%80);
    for (int k = 20; k < width; k = k+120) {
      for (int j = -200; j <height+80; j = j+70) {
        point(i, j+starMovement+10);
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
