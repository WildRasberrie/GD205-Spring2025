GameScreens gs;
Observer observer;
boolean playerControl=true, canShoot=true;
void setup () {
  size(1000, 1000);
  noStroke();
  gs=new GameScreens(width, height);
  observer=new Observer(notify=false);
}
void draw () {
  gs.display();
  switch(gs.screen) {
  case 1:
    if (canShoot) {
      updateScore();
      break;
    }
  }
}
/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVER
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
void updateScore() {
  boolean enemyWasHit=(gs.minDist>height);
  boolean enemyisDisplaying=(e.enemyDisplay==1);
  if (enemyWasHit && enemyisDisplaying) {
    observer.notify=true;
    if (observer.notify==true && physics.hasFallen==true) {
      e.accelerate.add(e.negGravity);
      gs.updateScore();
    }
  }
}
