/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVABLE PHSYICS
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
class Physics {
  //PROPERTIES
  PVector pos;
  boolean isJumping=false, colliding=false, scoreCount=false, playerControl=true,
    isDying=false, up, down, left, right, space;
  boolean atWaterEdgeL, atWaterEdgeR;
  int animState=0;
  //CONSTRUCTORS
  Physics (float x, float y) {
    pos = new PVector(x, y);
  }
  //METHODS
  /*START SCREEN CONTROLS*/
  void startScreenControls() {
    if (key==CODED&&keyCode==RETURN||keyCode==ENTER) {
      //println("Enter");
      ui.button[0]=ui.button[1];// Change Button color after click
      ui.screen=1;
      ui.resetGame();
    }
    if (key == CODED && keyCode==UP||key=='w'||key=='W') {
      //println("UP");
      ui.arrowPos.y=height-425;
    }
    if (key == CODED && keyCode==DOWN||key=='s'||key=='S') {
      //println("DOWN");
      ui.arrowPos.y=height- 265;
    }
  }
  /*GAMEPLAY CONTROLS*/
  void gameplayControls() {

    atWaterEdgeL=assets.playerPos.x>100;
    atWaterEdgeR=740<assets.playerPos.x&&assets.playerPos.x<750;
    if (playerControl==true) {
      isDying=false;
      if (left==true) {
        animState=1;
        assets.playerPos.x-=50;
        left=false;
      }
      if (right==true) {
        animState=1;
        assets.playerPos.x+=50;
        right=false;
      }
      if (up==true) {
        animState=1;
        assets.playerPos.y-=50;
        up=false;
      }
      if (down==true) {
        animState=1;
        assets.playerPos.y+=50;
        down=false;
      }
    }
    lifeCounter();
  }

  void lifeCounter() {
    //River Collisions
    /****************************************
     LIFE COUNTER
    /****************************************/
    if (physics.scoreCount==false) {
      if (assets.playerPos.x>riverL.x-100 && assets.playerPos.x<riverR.x && !colliding) {
        isDying=true;
        physics.playerControl=false;
        ui.hearts-=1;//if with river bounds and not colliding, lose health
      }
    }
    if (isDying) {
      animState=2;
    }
  }
 
}
