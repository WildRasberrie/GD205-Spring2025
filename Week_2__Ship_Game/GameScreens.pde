class GameScreens {
  //PROPERTIES
  Ship s;
  Bullet[] bullet= new Bullet[1];
  Enemy e;
  Physics physics;
  PFont redAlert;
  PImage spaceLife, selectArrow;
  PVector pos;
  int screen, score, spaceLives, highscore;
  String[] fontList=PFont.list();
  float arrowPOSY=height/2.0+145, arrowPOSX=width/4.0, posx=0, pulse;
  //CONSTRUCTORS
  GameScreens(float x, float y) {
    e=new Enemy(width, height, 1);
    s=new Ship(width/2.0, height/2.0+200);
    physics=new Physics(width, height);
    //initialize Bullet Class
    bullet[0] = new Bullet(width/2.0, height);
    for (int i=0; i<bullet.length; i++) {
      minDist = dist(bullet[i].pos.x, bullet[i].pos.y, e.pos.x, e.pos.y);
    }
    pos= new PVector(x, y);
    score=0;
    selectArrow=loadImage("selectArrow.png");
    highscore=score;
    screen=0;// set screen to intro
    spaceLives=3;
    spaceLife= loadImage("SpaceLife.png");//(MODIFIED) Original Art By Christopher_Konrad
    redAlert= createFont(fontList[21], 140);
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
  void scoreDisplay() {
    //SCORE
    fill (255);//white
    pushMatrix();
    scale(0.65);
    textFont(redAlert);
    text (score, 50, 100);
    popMatrix();
    resetMatrix();
  }
  void spaceLife1 () {
    image(spaceLife, 0, height-300);
  }
  void spaceLife2 () {
    image(spaceLife, 50, height-300);
  }
  void spaceLife3 () {
    image(spaceLife, 100, height-300);
  }
  void spaceLivesDisplay () {
    scale(1.25);
    if (spaceLives>=3&&spaceLives>2) {
      spaceLife1();
      spaceLife2();
      spaceLife3();
    }
    if (spaceLives<3&&spaceLives>=2) {
      spaceLife2();
      spaceLife3();
    }
    if (spaceLives<2&&spaceLives>=1) {
      spaceLife3();
    }
    if (spaceLives == 0) {
      screen=2;
    }
  }
  void loadingScreen() {
    switch(screen) {
    case 0:
      screen=0;
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
      physics.startControls();
      break;
    }
  }
  void gameScreen() {
    switch(screen) {
    case 1:
      pushMatrix();
      background(0);
      noStroke();
      stroke(map(millis(), 0, 1000, 0, 120)%255);
      for (int i = 0; i <width; i = i+300) {
        for (int j = 0; j < height; j = j+450) {
          point(i+(cos(frameCount*0.0005)*160), j-(sin(frameCount*0.0005)*160));
        }
      }
      stroke(map(millis(), 0, 1000, 0, 100)%255);
      for (int i = 20; i < width; i = i+300) {
        for (int j = 0; j <height; j = j+400) {
          point(i-(cos(frameCount*0.0005)*160), j+(sin(frameCount*0.0005)*160));
        }
        stroke(map(millis(), 0, 1000, 0, 70)%255);
        for (int i = 20; i < width; i = i+100) {
          for (int j = 0; j <height; j = j+200) {
            point(i-(cos(frameCount*0.0005)*130), j+(sin(frameCount*0.0005)*160));
          }
        }
        popMatrix();
        resetMatrix();
        spaceLivesDisplay();
        e.display();
        e.update();
        s.display();
        scoreDisplay();
        physics.gameplayControls();
        physics.updateEnemy();
        break;
      }
    }
  }
  void endGame() {
    switch(screen) {
    case 2:
      resetMatrix();
      screen=2;
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
      physics.startControls();
      break;
    }
  }
  void resetGame() {
    switch(screen) {
    case 1:
      score=0;
      spaceLives=3;
      if (spaceLives==0) {
        screen=2;
        break;
      }
    }
  }
  void updateScore() {
    score+=100;
  }
}
