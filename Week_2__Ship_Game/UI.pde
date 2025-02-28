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
    collisionBoxes();
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
  void collisionBoxes() {
    if (debugCollisionBoxes ==true) {
      stroke(#F030DA);
      fill(0, 0);
      strokeWeight(3);
      int size=42;
      float enemyMovement=cos(frameCount*0.045)*145;
      //ENEMY COLLISION BOX
      for (int i=0; i<500; i+=100) {
        for (int j = 0; j < 6; j++) {
          ellipse((e[0].pos.x+j)+enemyMovement, e[0].pos.y, size, size);
        }
          for (int j=0; j<5; j++) {
            if (i==1) {
              ellipse((e[1].pos.x+j)+enemyMovement, e[1].pos.y, size, size);
            }
          }
              for (int j=0; j<4; j++) {
                if (i==2) {
                  ellipse((e[2].pos.x+j)+enemyMovement, e[2].pos.y, size, size);
                }
              }
          }
              //SHIP COLLISION BOX
              ellipse(s.pos.x+25, s.pos.y+18, 42, size);
              //BULLET COLLISION BOX
              for (int i=0; i<bullet.length; i++) {
                ellipse(bullet[i].pos.x+20, bullet[i].pos.y, 29, 34);
              }
 
        }
      }
}
