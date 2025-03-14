UI ui;
Physics physics;
Assets assets;
Animation idle, jumping, dead;
PVector collisionBox, collisionBox2, riverL, riverR;
float x,y;

void setup() {
  size(1000, 1000);
  frameRate(24);
  ui=new UI(width, height);
  physics=new Physics(width, height);
  assets=new Assets(width, height);
  riverL=new PVector (width/4.4, 0);
  riverR=new PVector (width/2.0, height);
  collisionBox= new PVector (assets.lilyPos.x, assets.lilyPos.y-200);
  collisionBox2=new PVector (assets.lilyPos2.x, assets.lilyPos2.y-205);
}

void draw() {
  //println("Is Player Jumping?\t"+physics.jumping);
  ui.update();
  debugBoxes();
  
}

void keyPressed() {
  if (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT)) {
    physics.left=true;
  }
  if (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT)) {
    physics.right=true;
  }
  if (key == 'w'||key=='W' || (key==CODED && keyCode ==UP)) {
    physics.up=true;
  }
  if (key == 's'||key=='S' || (key==CODED && keyCode ==DOWN)) {
    physics.down=true;
  }
  /****************************************
   SCORE COUNTER
  /****************************************/
  if (physics.scoreCount==true) {
    ui.score=ui.score+100;
  } else {
    physics.scoreCount=false;
  }
  if (physics.playerControl==false) {
    assets.playerPos.x=width/10.0;
    if (physics.isDying) {
      physics.playerControl=true;
    }
  }
}

void debugBoxes() {
  /****************************
   LILYPAD COLLISION BOXES
  /***************************/
  collisionBox= new PVector (assets.lilyPos.x+40, assets.lilyPos.y-180);
  collisionBox2=new PVector (assets.lilyPos2.x+40, assets.lilyPos2.y-180);
  strokeWeight(3);
  stroke(#E10AED);
  fill(255, 0);
  rect(collisionBox.x, collisionBox.y, 40, 250);
  rect(collisionBox2.x, collisionBox2.y, 40, 250);
  noStroke();
}
