/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVABLE PHSYICS
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
class Player {
  //PROPERTIES
  PVector pos;
  boolean isJumping=false, colliding=false, scoreCount=false, playerControl=true,
    isDying=false, up, down, left, right, space;
  boolean atWaterEdgeL, atWaterEdgeR;
  int animState=0;
  //CONSTRUCTORS
  Player (float x, float y) {
    pos = new PVector (x, y);
    //Import animations
    /*************************
     PLAYER STATES
    /*************************/
    idle= new Animation ("frog", 4);
    jumping= new Animation ("frogjump", 4);
    dead= new Animation ("deadFrog", 4);
  }
  //METHODS
  void playerDisplay() {
    switch (animState) {
    case 1:
      jumping.display(x, y);
      if (jumping.frame==3) {
        animState=0;
      }
      break;
    case 2:
      dead.frame=int(map(millis(), 0, 3000, 0, 4));
      dead.display(x, y);
      if (dead.frame==3) {
        animState=0;
        pos.x=width/10.0;
        playerControl=true;
      }
      break;
    default:
      idle.frame=int(map(millis(), 0, 1500, 0, 4));
      idle.display(x, y);
      break;
    }
  }

  /*START SCREEN CONTROLS*/
  void startScreenControls() {

   if (key == CODED && keyCode==UP||key=='w'||key=='W') {
      //println("UP");
      ui.arrowPos.y=height-425;
     }
     if (ui.arrowPos.y==height-425 && key==CODED&&keyCode==RETURN||keyCode==ENTER) {
        println("Enter");
        ui.button[0]=ui.button[1];// Change Button color after click
        ui.screen=1;
        ui.resetGame();
      }
    if (key == CODED && keyCode==DOWN||key=='s'||key=='S') {
      //println("DOWN");
      ui.arrowPos.y=height- 265;
    }
     if (ui.arrowPos.y==height- 265 && key==CODED&&keyCode==RETURN||keyCode==ENTER) {
         exit();
       }
  }

  /*GAMEPLAY CONTROLS*/
  void gameplayControls() {
    //println ( colliding+ "," + atWaterEdgeR+ "," + atWaterEdgeL);
    atWaterEdgeL=player.pos.x>100;
    atWaterEdgeR=player.pos.x<750;
    if (playerControl==true) {
      isDying=false;
      if (left==true) {
        animState=1;
        player.pos.x-=80;
        left=false;
      }
      if (right==true) {
        animState=1;
        player.pos.x+=80;
        right=false;
      }
      if (up==true) {
        animState=1;
        player.pos.y-=80;
        up=false;
      }
      if (down==true) {
        animState=1;
        player.pos.y+=80;
        down=false;
      }
    }
  }
}
