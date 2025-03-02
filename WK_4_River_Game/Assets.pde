class Assets {
  PVector pos, playerPos, enemyPos, logPos,logPos2;
  PVector vel;
  PImage froggie;
  PImage log;
  int logLength;

  //CONSTRUCTORS
  Assets (float x, float y) {
    pos= new PVector(x, y);
    playerPos= new PVector(width/10.0, height/2.0);
    enemyPos=new PVector(width, height);
    logPos=new PVector(width/4.5, height);
    logPos2=new PVector(width/3.0, height*1.5);
    vel=new PVector (0, -5);
    froggie=loadImage("frog.png");
    log=loadImage("log.png");
  }

  //METHODS
  void display() {
    logDisplay();
    playerDisplay();
  }
  void update() {
    logPos.add(vel);
    logPos2.add(vel);
  }
  void enemyDisplay() {
  }
  void playerDisplay() {
    image(froggie, playerPos.x, playerPos.y);
  }
  void logDisplay() {
    logLength=2;
    for (int i=0; i<logLength; i++) {
      image(log, logPos.x+(i*100), logPos.y+i, 100, 100);
      image(log, logPos2.x+(i*100), logPos2.y+i, 100, 100);
    }
  }
}
