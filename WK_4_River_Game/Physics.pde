/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVABLE PHSYICS
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
class Physics {
  //PROPERTIES
  PVector pos;
  boolean jumping=false, colliding=false, scoreCount=false, playerControl=true,
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
    if (playerControl==true) {
      if (keyPressed) {
        jumping=true;
      } else {
        jumping=false;
      }
      if (left==true) {
        assets.playerPos.x-=75;
        left=false;
        if (atWaterEdgeL) {
          left= false;
        }
      }
      if (right==true) {
        assets.playerPos.x+=75;
        right=false;
      }
      if (up==true) {
        assets.playerPos.y-=75;
        up=false;
      }
      if (down==true) {
        assets.playerPos.y+=75;
        down=false;
      }
      collisions();
    }
  }
  /**************************************
   SET COLLISIONS
  /**************************************/
  void collisions() {
    boolean
      collidingLogs=dist(assets.playerPos.x, assets.playerPos.y, assets.logPos.x, assets.logPos.y)<40,
      collidingLogs2=dist(assets.playerPos.x, assets.playerPos.y, assets.logPos2.x, assets.logPos2.y)<40,
      collidingLilies=dist(assets.playerPos.x, assets.playerPos.y, collisionBox.x, collisionBox.y)<40,
      collidingLilies2=dist(assets.playerPos.x, assets.playerPos.y, collisionBox2.x, collisionBox2.y)<40;

    //Log Collisions
    if (collidingLogs) {
      colliding=true;
      scoreCount =true;
      assets.playerPos.y=assets.logPos.y;
    } else {
      scoreCount=false;
    }
    if (collidingLogs2) {
      colliding=true;
      scoreCount =true;
      assets.playerPos.y=assets.logPos2.y;
    } else {
      scoreCount=false;
    }


    //Lilypad Collisions
    if (collidingLilies) {
      colliding=true;
      scoreCount =true;
      assets.playerPos.y=collisionBox.y;
    }
    if (collidingLilies2) {
      colliding=true;
      scoreCount =true;
      assets.playerPos.y=collisionBox2.y;
    } else if (!colliding) {
      scoreCount=false;
    }

    //River Collisions
    /****************************************
     LIFE COUNTER
    /****************************************/
    if (physics.scoreCount==false) {
      if (assets.playerPos.x>riverL.x-100 && assets.playerPos.x<riverR.x) {
        ui.hearts-=1;//if with river bounds and not colliding, lose health
        assets.loadImage=1;
      }
    }
  }
}
