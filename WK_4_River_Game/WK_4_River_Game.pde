UI ui;
Physics physics;
Assets assets;
Animation idle, jumping, dead;
PVector collisionBox, collisionBox2, riverL, riverR;
float x,y,opacity=100.0;

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
  ui.update();
 if (ui.screen ==1){
  debugBoxes(); 
 }
  //println("PlayerPOS\t"+ assets.playerPos.x+"\t,\t"+assets.playerPos.y);
}

void keyPressed() {
  if (assets.playerPos.x > 100 && (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))) {
    physics.left=true;
  }
  if (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT)) {
    physics.right=true;
  }
  if ((assets.playerPos.y>50) && key == 'w'||key=='W' || (key==CODED && keyCode ==UP)) {
    physics.up=true;
  }
  if ((assets.playerPos.y<720) &&key == 's'||key=='S' || (key==CODED && keyCode ==DOWN)) {
    physics.down=true;
  }
  if (key==CODED&&keyCode==RETURN||keyCode==ENTER) {
      //println("Enter");
      ui.button[0]=ui.button[1];
      ui.screen=1;
      ui.resetGame();
    }
    if (keyCode==UP||key=='w'||key=='W') {
      //println("UP");
      ui.arrowPos.y=height/1.64;
    }
    if (keyCode==DOWN||key=='s'||key=='S') {
      //println("DOWN");
      ui.arrowPos.y=height/1.29;
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
  void mouseClicked(){
    if(physics.up==true){
      ui.resetGame();
    }
  }
