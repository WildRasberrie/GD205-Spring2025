class UI {
  PVector pos;
  int score, spaceLives;
  PImage spaceLife;
  UI(float x, float y) {
    pos= new PVector(x, y);
    score=0;
    spaceLives=3;
    spaceLife= loadImage("SpaceLife.png");//(MODIFIED) Original Art By Christopher_Konrad
  }
  void display () {
    scoreDisplay();
    spaceLivesDisplay ();
  }
  //SCORE DISPLAY
  void scoreDisplay() {
    float scale=0.5;
    fill (255);//white
    textFont(gs.redAlert);
    text (score, 50*scale, 200*scale);
  }
  void spaceLife1 () {
    image(spaceLife, 0, height-150);
  }
  void spaceLife2 () {
    image(spaceLife, 100, height-150);
  }
  void spaceLife3 () {
    image(spaceLife, 200, height-150);
  }
  //PLAYER HEALTH DISPLAY
  void spaceLivesDisplay () {
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
    if (spaceLives == 0) {//IF NO PLAYER LIVES REMAIN
      gs.screen=2;        //END GAME SCREEN
    }
  }
  void updateScore() {
    score+=100;
  }
}
