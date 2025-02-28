/*  TeXTBOOK ReFeReNCe: CHAPTeR 4 OBSeRVABLe PHSYICS
 GAMING PROGRAMMING PATTeRNS     BY:ROBeRT NYSTROM  */
class Physics {
  //PROPeRTIeS
  PVector pos;
  boolean hasFallen=false,canShoot=true;
  //CONSTRUCTORS
  Physics (float x, float y) {
    pos = new PVector(x, y);
  }
  //MeTHODS
  /*START GAMePLAY CONTROLS*/
  void gameplayControls() {
    if (keyPressed==true &&
      (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))) {
      s.pos.x-=3;
    }
    if (keyPressed==true &&
      (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT))) {
      s.pos.x+=3;
    }
    //SePARATe BULLeTS
    if (timer.totalTime<1000) {
      playerControl=false;
    }
    if (timer.isFinished()) {
      playerControl=true;
      timer.start();
    }
    if (keyPressed==true && key==' '&&playerControl==true) {
      println("SPACeD PReSSeD");
      Bullet b = new Bullet(s.pos.x,s.pos.y);
      bullet= (Bullet[]) append(bullet, b);
    }
  }
  /*START SCReeN CONTROLS*/
  void startControls() {
    if (keyPressed && key==CODED &&keyCode==UP) {//SeLeCT OPTION 1
      gs.arrowPOSY=height/2.0+145;
    }
    if (key==CODED &&keyCode==RETURN || keyCode==ENTER&&
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
  void hasFallen() {
    for(int i=0;i<e.length;i++){
      if (e[i].pos.y<0||e[i].pos.y<0) {
        hasFallen=true;
      }
    }
    
  }
  void collisions(){
    //BULLET TO ENEMY COLLISION
      for (int i=0;i<bullet.length;i++){
        for (int j=0;j<e.length;j++){
        if(dist(bullet[i].pos.x,bullet[i].pos.y,e[j].pos.x,e[j].pos.y)<25/2){
          e[j].vel.add(e[j].negGravity);
      }
    }
  }
}
}
