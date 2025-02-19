/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVABLE PHSYICS
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
class Physics {
  //PROPERTIES
  PVector pos;
  boolean hasFallen=false;
  //CONSTRUCTORS
  Physics (float x, float y) {
    pos = new PVector(x, y);
  }
  //METHODS
  /*START GAMEPLAY CONTROLS*/
  void gameplayControls() {
    if (keyPressed==true &&
      (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))) {
      s.pos.x-=3;
    }
    if (keyPressed==true &&
      (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT))) {
      s.pos.x+=3;
    }
    if (keyPressed==true && keyCode==' ') {
      Bullet b = new Bullet(s.pos.x+100, s.pos.y+150);
      bullet= (Bullet[]) append(bullet, b);
      shoot();
    }   
  }
  //BULLET DISPLAY & UPDATE
  void shoot() {
    for (int i =0; i<bullet.length; i++) {
      bullet[i].display();
      bullet[i].update();
    }
  }
  /*START SCREEN CONTROLS*/
  void startControls() {
    if (keyPressed && key==CODED &&keyCode==UP) {//SELECT OPTION 1
      gs.arrowPOSY=height/2.0+145;
    }
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER&&
      (gs.arrowPOSY==height/2.0+145)) {
      println("ENTER PRESSED");
      gs.screen=1;
      resetGame();
    }
    if (keyPressed && key==CODED &&keyCode==DOWN) {//SELECT OPTION 2
      gs.arrowPOSY=height/2.0+215;
    }
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER&&
      (gs.arrowPOSY==height/2.0+215)) {
      println("ENTER PRESSED");
      exit();
    }
  }
  void hasFallen() {
    if (e.pos.y<0) {
      hasFallen=true;
    }
  }
}
