GameScreens gs;
Observer[] observer;
Bullet[] bullet= new Bullet[1];
Physics physics;
Ship s;
Enemy e[];
Timer timer;
UI ui;
boolean playerControl=true;
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
  e=new Enemy[20];
  for (int i =0; i < 3; i = i++) {
    e[i] = new Enemy(width, height, 1, 0);
  }
  physics=new Physics(width, height);
  ui = new UI(width, height);
  //initialize Bullet Class
  bullet[0] = new Bullet(s.pos.x, s.pos.y);
}


void draw () {
  gs.update();
  addEnemies();
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
  float enemyMovement=cos(frameCount*0.045)*145;
  for (int i = 0; i < 3; i = i++) {
    for (int j = 0; j < 10; j = j+2) {
      e[0] = new Enemy((200+j)+enemyMovement, 200, 1, 1);
      e[1] = new Enemy((200+j)+enemyMovement, 300, 1, 2);
      e[2] = new Enemy((200+j)+enemyMovement, 400, 1, 3);
      e[i].update();
    }
  }
}
