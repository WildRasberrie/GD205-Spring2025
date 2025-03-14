class Assets {
  PVector pos, playerPos, enemyPos, logPos,logPos2,
          lilyPos,lilyPos2;
  PVector vel,negVel;
  PImage froggie;
  PImage log,lilyPads;
  int logLength,loadImage=0;

  //CONSTRUCTORS
  Assets (float x, float y) {
    pos= new PVector(x, y);
    playerPos= new PVector(width/10.0, height/2.0);
    enemyPos=new PVector(width, height);
    logPos=new PVector(width/4.0, height);
    logPos2=new PVector(width/2.5, -600);
    lilyPos=new PVector(width/7.0, height+500);
    lilyPos2=new PVector(width/2.0, -300);
    vel=new PVector (0, -4);
    negVel= new PVector(0,5);
    froggie=loadImage("frog.png");
    log=loadImage("log.png");
    lilyPads=loadImage("lilypad.png");
  }

  //METHODS
  void display() {
    logDisplay();
    lilyDisplay();
    playerDisplay();
  }
  void update() {
    logPos.add(vel);
    logPos2.add(negVel);
    lilyPos.add(vel);
    lilyPos2.add(negVel);
  }
  void enemyDisplay() {
  }
  void playerDisplay() {
      image(froggie, playerPos.x,playerPos.y);
      if (loadImage==0){
        froggie=loadImage("frog.png");
      }
      if(loadImage==1){
        physics.playerControl=false;
        froggie=loadImage("deadFrog.png");
      }
  }
  void logDisplay() {
    boolean logOffscreen = logPos.y<-700;
    boolean logOffscreen2=logPos2.y>height+300;
    logLength=2;
    //LOGS POS
    for (int i=0; i<logLength; i++) {
      for(int j=0;j<logLength;j++){
        image(log, logPos.x+(i), logPos.y+(j*520), 100, 100);
        image(log, logPos2.x+(i), logPos2.y+(j*720), 100, 100);
      }
    }
    //TELEPORT LOGS
    if (logOffscreen){
      logPos.y=height;
    }
    if (logOffscreen2){
      logPos2.y=-height;
    }
  }
  
  void lilyDisplay(){
    boolean lilyOffscreen = lilyPos.y<-700;
    boolean lilyOffscreen2=lilyPos2.y>height+300;
    int lilyLength = 2; 
    float lilyHeight,lilyHeight2;
    //LILYPAD POS
     for (int i=0; i<lilyLength; i++) {
      for(int j=0;j<lilyLength+1;j++){
        lilyHeight=(lilyPos.y+(j*-104));
        lilyHeight2=(lilyPos2.y+(j*-104));
        image(lilyPads, lilyPos.x+(i), lilyHeight, 100, 100);
        image(lilyPads, lilyPos2.x+(i), lilyHeight2, 100, 100);
      }
    }
   //TELEPORT LILYPADS
    if (lilyOffscreen){
      lilyPos.y=height;
    }
    if (lilyOffscreen2){
      lilyPos2.y=-height;
    } 
  }
}
