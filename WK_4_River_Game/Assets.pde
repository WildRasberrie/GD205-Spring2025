class Assets {
  PVector pos, playerPos, enemyPos, logPos,logPos2;
  PVector vel,negVel;
  PImage froggie;
  PImage log;
  int logLength;

  //CONSTRUCTORS
  Assets (float x, float y) {
    pos= new PVector(x, y);
    playerPos= new PVector(width/10.0, height/2.0);
    enemyPos=new PVector(width, height);
    logPos=new PVector(width/5.8, height);
    logPos2=new PVector(width/2.8, 0);
    vel=new PVector (0, -5);
    negVel= new PVector(0,5);
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
    logPos2.add(negVel);
  }
  void enemyDisplay() {
  }
  void playerDisplay() {
    image(froggie, playerPos.x, playerPos.y);
  }
  void logDisplay() {
    boolean logOffscreen = logPos.y<25;
    boolean logOffscreen2=logPos2.y>height;
    logLength=2;
    for (int i=0; i<logLength; i++) {
      for(int j=0;j<logLength;j++){
      image(log, logPos.x+(i*110), logPos.y+(j*500), 100, 100);
      image(log, logPos2.x+(i*110), logPos2.y+(j*300), 100, 100);
      }
    }
    if (logOffscreen){
      logPos.y=height;
    }
    if (logOffscreen2){
      logPos2.y=0;
    }
  }
}
