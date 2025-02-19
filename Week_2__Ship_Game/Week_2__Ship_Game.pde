GameScreens gs;
Observer observer;
Bullet[] bullet= new Bullet[1];
Enemy e;
Physics physics;
Ship s;
UI ui;
boolean playerControl=true, canShoot=true;

void setup () {
  size(1000, 1000);
  noStroke();
  gs=new GameScreens(width, height);
  observer=new Observer(notify=false);
  e=new Enemy(width/2.0-250, height/2.0-500, 1);
  s=new Ship(width/2.0, height/2.0+200);
  physics=new Physics(width, height);
  ui = new UI(width, height);
  //initialize Bullet Class
  bullet[0] = new Bullet(width/2.0, height);
  for (int i=0; i<bullet.length; i++) {
    minDist = dist(bullet[i].pos.x, bullet[i].pos.y, e.pos.x, e.pos.y);
  }
}

void draw () {
  gs.display();
  gs.update();
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
  if (enemyWasHit && enemyisDisplaying) {                   //IF ENEMY IS ON SCREEN AND ENEMY COLLISION
    observer.notify=true;                                   // NOTIFY OBSERVER THAT THERE WAS A COLLISION
    e.accelerate.add(e.negGravity);                         // START EVENT (ENEMY HEIGHT DECREASES)
    if (observer.notify==true && physics.hasFallen==true ) {//IF OBSERVER IS NOTIFIED AND ENEMY OFFSCREEN
      gs.updateScore();                                     //UPDATE SCORE
    }
  }
}
