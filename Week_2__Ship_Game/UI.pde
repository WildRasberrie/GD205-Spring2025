class UI {
  PVector pos;
  int score, spaceLives;
  PImage spaceLife;
  boolean debugCollisionBoxes = false;
  UI(float x, float y) {
    pos= new PVector(x, y);
    score=0;
    spaceLives=3;
    spaceLife= loadImage("SpaceLife.png");//(MODIFIeD) Original Art By Christopher_Konrad
  }
  void display () {
    scoreDisplay();
    spaceLivesDisplay ();
  }
  //SCORe DISPLAY
  void scoreDisplay() {
    float scale=0.5;
    fill (255);//white
    textFont(gs.redAlert);
    text (score, 50*scale, 200*scale);
  }
  void spaceLife1 () {
    image(spaceLife, 0, height-55);
  }
  void spaceLife2 () {
    image(spaceLife, 50, height-55);
  }
  void spaceLife3 () {
    image(spaceLife, 100, height-55);
  }
  //PLAYeR HeALTH DISPLAY
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
    if (spaceLives == 0) {//IF NO PLAYeR LIVeS ReMAIN
      gs.screen=2;        //eND GAMe SCReeN
    }
  }
  void updateScore() {
    score+=100;
  }
}
