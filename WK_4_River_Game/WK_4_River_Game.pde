UI ui;
Physics physics;
Assets assets;
void setup() {
  size(1000, 1000);
  ui=new UI(width, height);
  physics=new Physics(width, height);
  assets=new Assets(width, height);
}
void draw() {
  printArray("DIST LOG1 & PLAYER:\t"+(dist(assets.playerPos.x, assets.playerPos.y,
        assets.logPos.x, assets.logPos.y))+
  "DIST LOG2 & PLAYER:\t"+(dist(assets.playerPos.x, assets.playerPos.y,
      assets.logPos2.x, assets.logPos2.y)));
  ui.update();
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
  if (key==' ') {
    println("WORKING SPACEBAR (GOOD JOB!)");
    if (physics.atWaterEdgeL) {
      physics.jumping =true;
    }
  }
}
