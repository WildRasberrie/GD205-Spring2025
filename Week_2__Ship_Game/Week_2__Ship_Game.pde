GameScreens gs;
Observer[] observer;
Bullet[] bullet= new Bullet[1];
Enemy[] e;
Physics physics;
Ship s;
Timer timer;
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
  timer=new Timer(2000);//2 second timer
  e=new Enemy [320];
   for (int i = 0; i < 320; i = i+100) {
      for (int j = 0; j < 320; j = j+100) {
        e[i]=new Enemy(width/2.0-250 +i, height/2.0-500+j, 1);
        e[j]=new Enemy(width/2.0-250 +i, height/2.0-500+j, 1);
      }
    }
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
   for (int i=0; i<e.length; i++) {
      println("ENEMY IS DISPLAYING\t"+e[i].enemyDisplay);
   }
}
/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVER
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
void updateScore() {
  for (int i=0; i<bullet.length; i++) {
    float minDist = dist(bullet[i].pos.x, bullet[i].pos.y, e[i].pos.x, e[i].pos.y);
  }
    boolean enemyWasHit=(minDist<250); //DIST BTWN BULLET SPRITE AND ENEMY SPRITE
    boolean enemyisDisplaying=(e[i].enemyDisplay==1);//ENEMY IS DISPLAYING = TRUE
    if (enemyWasHit && enemyisDisplaying) {         //IF ENEMY IS ON SCREEN AND ENEMY COLLISION
      observer[0].notify=true;                      // NOTIFY OBSERVER THAT THERE WAS A COLLISION
      for (int j = 0; j < e.length; j = j+100) {
        e[i].accelerate.add(e[i].negGravity);
        e[j].accelerate.add(e[j].negGravity);// START EVENT (ENEMY HEIGHT DECREASES)
        }
      }
      if (observer[0].notify==true && physics.hasFallen==true){//IF OBSERVER IS NOTIFIED AND ENEMY OFFSCREEN
        ui.updateScore();                                     //UPDATE SCORE
      }
  }
