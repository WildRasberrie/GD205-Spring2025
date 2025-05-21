UI ui;
Player player;
DebugPlatforms[] debugplats;
Assets assets;
Animation idle, jumping, dead;
PVector collisionBox, collisionBox2, riverL, riverR;
float x, y, opacity=100.0;

void setup() {
  size(1000, 1000);
  frameRate(24);
  ui=new UI(width, height);
  player=new Player(100, height-500);
  assets=new Assets(width, height);
  debugplats= new DebugPlatforms[10];
  //first set of lillies 
  debugplats[0] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y-200, 75, 75);
  debugplats[1] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y-100, 75, 75);
  debugplats[2] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y, 75, 75);
  // set of logs 
  debugplats[3] = new DebugPlatforms(assets.logPos.x, assets.logPos.y, 75, 75);
  debugplats[4] = new DebugPlatforms(assets.logPos.x, assets.logPos.y+500, 75, 75);
  // second set of logs 
  debugplats[5] = new DebugPlatforms(assets.logPos2.x, assets.logPos2.y, 75, 75);
  debugplats[6] = new DebugPlatforms(assets.logPos2.x, assets.logPos2.y-500, 75, 75);
  //second set of logs
  debugplats[7] = new DebugPlatforms(assets.lilyPos2.x+25, assets.lilyPos2.y-200, 75, 75);
  debugplats[8] = new DebugPlatforms(assets.lilyPos2.x+25, assets.lilyPos2.y-100, 75, 75);
  debugplats[9] = new DebugPlatforms(assets.lilyPos2.x+25, assets.lilyPos2.y, 75, 75);

  riverL=new PVector (width/4.4, 0);
  riverR=new PVector (width/2.0, height);
}

void draw() {
  ui.update();
  for (int i=0; i<debugplats.length; i++) {
    //println(col(player.pos, debugplats[i].pos, 80));
  }

}


void keyPressed() {
  if (player.pos.x > 100 && (key == 'a'||key=='A' || (key==CODED && keyCode ==LEFT))) {
    player.left=true;
  }
  if (key == 'd'||key=='D' || (key==CODED && keyCode ==RIGHT)) {
    player.right=true;
  }
  if ((player.pos.y>50) && key == 'w'||key=='W' || (key==CODED && keyCode ==UP)) {
    player.up=true;
  }
  if ((player.pos.y<720) &&key == 's'||key=='S' || (key==CODED && keyCode ==DOWN)) {
    player.down=true;
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
}
