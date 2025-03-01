class GameScreens {
  //PROPERTIE   S
  PFont redAlert;
  PImage selectArrow;
  PVector pos;
  int screen=0, j=0;
  String[] fontList=PFont.list();
  float arrowPOSY=height/2.0+145, arrowPOSX=width/4.0, posx=0, pulse;
  color[] oooPrettyColors= {#CB81C2,#4BE7F7,#AFF0A2,#E7F273};
  //CONSTRUCTORS
  GameScreens(float x, float y) {
    pos= new PVector(x, y);
    selectArrow=loadImage("selectArrow.png");
    redAlert= createFont(fontList[21], 140);//IMPORT CUSTOM FONT
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

  void loadingScreen() {
    introDisplay();//IMPORT INTRO BACKGROUND
    physics.startControls();//SeLeCT CONTROLS
  }
  void gameScreen() {
    starDisplay();//IMPORT START BACKGROUND
    ui.display();//UI DISPLAY
    for(int i=0;i<e.length;i++){
      addEnemies();//ADD ENEMY SPRITES
    }
    physics.gameplayControls(); //PLAYER CONTROLS
    s.display();//SHIP DISPLAY & UPDATE
    physics.canShoot=true;
    for(int i=0;i<bullet.length;i++){
      bullet[i].display();
      bullet[i].update();
    }
  }
  void endGame() {
    loseGameDisplay();      //IMPORT END GAME SCREEN
    physics.startControls();//PLAYER CONTROLS
  }
  void resetGame() {    //RESET GAME SCREEN
    ui.score=0;
    ui.spaceLives=3;
    if (ui.spaceLives==0) {
      screen=2;
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
    textSize(56);
    textAlign(LEFT);
    text ("NEW GAME\nEXIT GAME", width/2.0-150, height/2.0+200);
    image(selectArrow, arrowPOSX, arrowPOSY);
  }
  void starDisplay() {
    pushMatrix();
    background(0);
    float starMovement=(sin(frameCount*0.0025)*120);
    stroke(oooPrettyColors[int(random(3))],map(millis(), 0, 1000, 0, 50)%90);
    for (int i = 0; i <width; i = i+70) {
      for (int j = -200; j < height+100; j = j+100) {
        point(i, j+starMovement);
      }
    }
    for (int i = 0; i <width; i = i+30) {
      for (int j = -200; j < height+100; j = j+70) {
        point(i, j+starMovement);
      }
    }
    for (int i = 20; i < width; i = i+65) {
      for (int j = -200; j <height+129; j = j+151) {
        point(i, j+starMovement);
      } 
      for (int k = 20; k < width; k = k+56) {
        for (int j = -200; j <height+152; j = j+209) {
          strokeWeight(1.75);
          point(i, j+starMovement+10);
        }
      }
    }
    popMatrix();
    resetMatrix();
  }
  void loseGameDisplay() {
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
