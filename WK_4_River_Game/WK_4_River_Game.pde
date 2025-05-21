UI ui;
Physics physics;
DebugPlatforms[] debugplats;
Assets assets;
Animation idle, jumping, dead;
PVector collisionBox, collisionBox2, riverL, riverR;
float x, y, opacity=100.0;

void setup() {
  size(1000, 1000);
  frameRate(24);
  ui=new UI(width, height);
  physics=new Physics(width, height);
  assets=new Assets(width, height);
  debugplats= new DebugPlatforms[6];

  for (int i=0; i<debugplats.length; i ++) {
    debugplats[i] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y-200, 75, 75);
  }

  riverL=new PVector (width/4.4, 0);
  riverR=new PVector (width/2.0, height);
}

void draw() {
  ui.update();
  for (int i=0; i<debugplats.length; i++) {
    println(dist (assets.playerPos.x, assets.playerPos.y, debugplats[i].pos.x, debugplats[i].pos.y));
  }
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
}
