GameScreens gs;
Observer[] observer;
Bullet[] bullet= new Bullet[1];
Physics physics;
Ship s;
Enemy e[], e2[], e3[];
Timer timer;
UI ui;
boolean playerControl=true;
PVector enemyMovement;
float minDist =0;


void setup () {
  size(1000, 1000);
  noStroke();
  gs=new GameScreens(width, height);
  observer=new Observer[2];
  observer[0]=new Observer();
  observer[1]=new Observer();
  timer=new Timer(2000);//2 second timer
  s=new Ship(width/2.0, height-50);
  e=new Enemy[5];
  for (int i=0; i<e.length; i++) {
    e[i] = new Enemy(300 + (100 * i), 100, 1, 0);
    println("L");
  }
  e2=new Enemy[3];
  for (int i=0; i<e2.length; i++) {
    e2[i] = new Enemy(300 + (100 * i), 200, 1, 1);
  }
  e3=new Enemy[2];
  for (int i=0; i<e3.length; i++) {
    e3[i] = new Enemy(300 + (100 * i), 300, 1, 2);
  }
  physics=new Physics(width, height);
  ui = new UI(width, height);
  ////initialize Bullet Class
  bullet[0] = new Bullet(s.pos.x, s.pos.y);
}


void draw () {
  gs.update();
}
/*  TEXTBOOK REFERENCE: CHAPTER 4 OBSERVER
 GAMING PROGRAMMING PATTERNS     BY:ROBERT NYSTROM  */
void updateScore() {
  //float widthDist=dist(bullet[i].pos.x, bullet[i].pos.y, e.pos.x, e.pos.y);
  //float heightDist= dist(bullet[i].pos.x, bullet[i].pos.y, e.pos.x, e.pos.y);
  //boolean enemyWasHit=(heightDist<150||widthDist<150);                        //DIST BTWN BULLET SPRITE AND ENEMY SPRITE
  //boolean enemyisDisplaying=(e.enemyDisplay==1);         //ENEMY IS DISPLAYING = TRUE
  //if (enemyWasHit && enemyisDisplaying) {                   //IF ENEMY IS ON SCREEN AND ENEMY COLLISION
  //  observer[0].notify=true;                                // NOTIFY OBSERVER THAT THERE WAS A COLLISION
  //  e.vel.add(e.negGravity);
  //}
  //// START EVENT (ENEMY HEIGHT DECREASES)
  //if (observer[0].notify==true && physics.hasFallen==true) {//IF OBSERVER IS NOTIFIED AND ENEMY OFFSCREEN
  //  ui.updateScore();                                     //UPDATE SCORE
  //}
}

void addEnemies() {
  //println("I AM HERE:\t"+e[0].pos.x+",\t"+e[0].pos.y);
  for (int i=0; i<e.length; i++) {
    e[i]=new Enemy(e[i].pos.x, e[i].pos.y, 1, 0);
    e[i].update();
  }
    for (int i=0; i<e2.length; i++) {
    e2[i]=new Enemy(e2[i].pos.x,e2[i].pos.y,1,1);
    e2[i].update();
  }
  for (int i=0; i<e3.length; i++) {
    e3[i]=new Enemy(e3[i].pos.x,e3[i].pos.y,1,2); 
    e3[i].update();
  }
}
