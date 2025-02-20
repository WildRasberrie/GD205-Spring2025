GameScreens gs;
Observer[] observer;
Bullet[] bullet= new Bullet[1];
Enemy e;
Physics physics;
Ship s;
UI ui;
boolean playerControl=true, canShoot=true;
float minDist =0;

void setup () {
  size(1000, 1000);
  noStroke();
  gs=new GameScreens(width, height);
  observer=new Observer[2];
  observer[0]=new Observer();
  observer[1]=new Observer();
  e=new Enemy(width/2.0-250, height/2.0-500, 1);
  s=new Ship(width/2.0, height-300);
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
   for (int i=0; i<bullet.length; i++) {
      //println("Bullet POS\t"+bullet[i].pos.x+"\t,\t"+bullet[i].pos.y);
   }
}
/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVER
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
void updateScore() {
  for (int i=0; i<bullet.length; i++) {
    float minDist = dist(bullet[i].pos.x, bullet[i].pos.y, e.pos.x, e.pos.y);
    boolean enemyWasHit=(minDist<5); //DIST BTWN BULLET SPRITE AND ENEMY SPRITE
    boolean enemyisDisplaying=(e.enemyDisplay==1);//ENEMY IS DISPLAYING = TRUE
    if (enemyWasHit && enemyisDisplaying &&
        keyPressed==true && keyCode==' ') {                   //IF ENEMY IS ON SCREEN AND ENEMY COLLISION
      observer[0].notify=true;                                   // NOTIFY OBSERVER THAT THERE WAS A COLLISION
      e.accelerate.add(e.negGravity);                         // START EVENT (ENEMY HEIGHT DECREASES)
      if (observer[0].notify==true && physics.hasFallen==true ) {//IF OBSERVER IS NOTIFIED AND ENEMY OFFSCREEN
        ui.updateScore();                                     //UPDATE SCORE
      }
    }
  }
}
