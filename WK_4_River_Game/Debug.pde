class DebugPlatforms {
  float x2, y2;
  PVector pos;
  DebugPlatforms (float x, float y, float x2, float y2) {
    pos = new PVector (x, y);
    this.x2=x2;
    this.y2=y2;
  }

  void display() {
    strokeWeight(3);
    stroke(#E10AED, opacity);
    fill(255, 0);

    rect(pos.x, pos.y, this.x2, this.y2); //lilly debug rect
    rect(pos.x, pos.y, this.x2, this.y2); //lilly 2 debug rect
    noStroke();
  }
  void update(){
  
  }
  
}

void debugBoxes() {
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

  for (int i=0; i<debugplats.length; i ++) {
    debugplats[i].display();
    debugplats[i].update();
  }
}
