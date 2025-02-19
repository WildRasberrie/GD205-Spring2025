/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVABLE PHSYICS
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
class Physics {
  //PROPERTIES
  PVector pos, enemyPOS;
  boolean hasFallen=false;
  //CONSTRUCTORS
  Physics (float x, float y) {
    pos = new PVector(x, y);
    enemyPOS= new PVector(e.pos.x, e.pos.y);
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
    }
    shoot();
  }
  void shoot() {
    for (int i =0; i<bullet.length; i++) {
      bullet[i].display();
      bullet[i].update();
    }
  }
  /*START SCREEN CONTROLS*/
  void startControls() {
    if (keyPressed && key==CODED &&keyCode==DOWN) {
      gs.arrowPOSY=height/2.0+215;
    }
    if (keyPressed && key==CODED &&keyCode==UP) {
      gs.arrowPOSY=height/2.0+145;
    }
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER&&
      (gs.arrowPOSY==height/2.0+145)) {
      println("ENTER PRESSED");
      gs.screen=1;
      resetGame();
    }
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER&&
      (gs.arrowPOSY==height/2.0+215)) {
      println("ENTER PRESSED");
      exit();
    }
  }
  void updateEnemy() {
    hasFallen();
  }
  void hasFallen() {
    if (enemyPOS.y>height) {
      hasFallen=true;
    }
  }
}
