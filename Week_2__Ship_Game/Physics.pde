/*  TeXTBOOK ReFeReNCe: CHAPTeR 4 OBSeRVABLe PHSYICS
 GAMING PROGRAMMING PATTeRNS     BY:ROBeRT NYSTROM  */
class Physics {
  //PROPeRTIeS
  PVector pos;
  boolean hasFallen=false, canShoot=true;
  //CONSTRUCTORS
  Physics (float x, float y) {
    pos = new PVector(x, y);
  }
  //MeTHODS
  /*START GAMePLAY CONTROLS*/
  void gameplayControls() {
    if (keyPressed &&
      (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))) {
      s.pos.x-=3;
    }
    if (keyPressed &&
      (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT))) {
      s.pos.x+=3;
    }
    if (keyPressed&&keyCode==' ') {
      observer[1].notify=true;
      if (timer.totalTime>2000) {
        println("SPACE");
        Bullet b = new Bullet(s.pos.x, s.pos.y);
        bullet= (Bullet[]) append(bullet, b);
        timer.resetTime();
      }
    }
  }

  /*START SCReeN CONTROLS*/
  void startControls() {
    if (keyPressed && key==CODED &&keyCode==UP) {//SeLeCT OPTION 1
      gs.arrowPOSY=height/2.0+145;
    }
    if (keyPressed && key==CODED &&keyCode==RETURN || keyCode==ENTER&&
      (gs.arrowPOSY==height/2.0+145)) {
      println("eNTeR PReSSeD");
      gs.screen=1;
      gs.resetGame();
    }
    if (keyPressed && key==CODED &&keyCode==DOWN) {//SeLeCT OPTION 2
      gs.arrowPOSY=height/2.0+215;
    }
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER&&
      (gs.arrowPOSY==height/2.0+215)) {
      println("eNTeR PReSSeD");
      exit();
    }
  }
}
