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
    assets.rect= new PVector(assets.playerPos.x+15, assets.playerPos.y+30);
    assets.size= new PVector(50, 50);
    rect (assets.rect.x, assets.rect.y, assets.size.x, assets.size.y); // player debug rect
    rect(pos.x, pos.y, this.x2, this.y2); //lilly debug rect
    rect(pos.x, pos.y, this.x2, this.y2); //lilly 2 debug rect
    noStroke();
  }
}

void debugBoxes() {
  for (int i=0; i<debugplats.length; i ++) {
    debugplats[0] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y-200, 75, 75);
    debugplats[1] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y-100, 75, 75);
    debugplats[2] = new DebugPlatforms(assets.lilyPos.x+25, assets.lilyPos.y, 75, 75);
    debugplats[3] = new DebugPlatforms(assets.lilyPos2.x+25, assets.lilyPos2.y-200, 75, 75);
    debugplats[4] = new DebugPlatforms(assets.lilyPos2.x+25, assets.lilyPos2.y-100, 75, 75);
    debugplats[5] = new DebugPlatforms(assets.lilyPos2.x+25, assets.lilyPos2.y, 75, 75);
    debugplats[i].display();
  }
}
