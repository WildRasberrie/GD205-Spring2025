/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVABLE PHSYICS
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
class Physics {
  //PROPeRTIeS
  PVector pos;
  boolean jumping=false,
    up, down, left, right, space;
  boolean atWaterEdgeL, atWaterEdgeR;
  //CONSTRUCTORS
  Physics (float x, float y) {
    pos = new PVector(x, y);
  }
  //METHODS
  /*START SCREEN CONTROLS*/
  void startScreenControls() {
    if (key==CODED&&keyCode==RETURN||keyCode==ENTER) {
      println("Enter");
      ui.screen=1;
      ui.resetGame();
    } else if (keyCode==UP) {
      println("UP");
      ui.arrowPos.y=height/1.45;
    } else if (keyCode==DOWN) {
      println("DOWN");
      ui.arrowPos.y=height/1.21;
    }
  }
  /*GAMEPLAY CONTROLS*/
  void gameplayControls() {
    atWaterEdgeL=assets.playerPos.x>100;
    atWaterEdgeR=740<assets.playerPos.x&&assets.playerPos.x<750;
    if (left==true) {
      assets.playerPos.x-=3;
      left=false;
      if (atWaterEdgeL) {
        left= false;
      }
    }
    if (right==true) {
      assets.playerPos.x+=3;
      right=false;
    }
    if (up==true) {
      assets.playerPos.y-=3;
      up=false;
    }
    if (down==true) {
      assets.playerPos.y+=3;
      down=false;
    }
    if (jumping==true) {
      assets.playerPos.x+=100;
      jumping=false;
      if (dist(assets.playerPos.x, assets.playerPos.y,
        assets.logPos.x, assets.logPos.y)<120) {
        assets.playerPos.x=assets.logPos.x;
        jumping=false;
      }
      if (dist(assets.playerPos.x, assets.playerPos.y,
        assets.logPos2.x, assets.logPos2.y)<120) {
        assets.playerPos.x=assets.logPos2.x;
        jumping=false;
      }
    }
  }
}
