GameScreens gs;
Observer[] observer;
Bullet[] bullet= new Bullet[1];
Enemy e;
Physics physics;
Ship s;
Timer timer;
UI ui;
boolean playerControl=true, canShoot=true;
float minDist =0;
int i =0, j=0;

void setup () {
  size(1000, 1000);
  noStroke();
  gs=new GameScreens(width, height);
  observer=new Observer[2];
  observer[0]=new Observer();
  observer[1]=new Observer();
  timer=new Timer(2000);//2 second timer
  e=new Enemy(width/2.0-250 +j, height/2.0-500, 1);
  s=new Ship(width-200, height-150);
  physics=new Physics(width, height);
  ui = new UI(width, height);
  //initialize Bullet Class
  bullet[0] = new Bullet(s.pos.x, s.pos.y);
}

void draw () {
  gs.display();
  gs.update();
  switch(gs.screen) {
  case 1:
    if (canShoot) {
      physics.shoot();
      updateScore();
      break;
    }
  }
  println("SHIP POS:\t"+(s.pos.x)+","+(s.pos.y));
}
/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVER
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
void updateScore() {
  float minDist = dist(bullet[i].pos.x, bullet[i].pos.y, e.pos.x, e.pos.y);
  boolean enemyWasHit=(minDist<150);                        //DIST BTWN BULLET SPRITE AND ENEMY SPRITE
  boolean enemyisDisplaying=(e.enemyDisplay==1);         //ENEMY IS DISPLAYING = TRUE
  if (enemyWasHit && enemyisDisplaying) {                   //IF ENEMY IS ON SCREEN AND ENEMY COLLISION
    observer[0].notify=true;                                // NOTIFY OBSERVER THAT THERE WAS A COLLISION
    e.accelerate.add(e.negGravity);
  }
  // START EVENT (ENEMY HEIGHT DECREASES)
  if (observer[0].notify==true && physics.hasFallen==true) {//IF OBSERVER IS NOTIFIED AND ENEMY OFFSCREEN
    ui.updateScore();                                     //UPDATE SCORE
  }
}
