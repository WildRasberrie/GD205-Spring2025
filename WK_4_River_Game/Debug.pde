  
  void debugBoxes() {
  /****************************
   LILYPAD COLLISION BOXES
  /***************************/
  collisionBox= new PVector (assets.lilyPos.x, assets.lilyPos.y-180);
  collisionBox2=new PVector (assets.lilyPos2.x, assets.lilyPos2.y-180);
  strokeWeight(3);
  stroke(#E10AED,opacity);
  fill(255, 0);
  rect(collisionBox.x, collisionBox.y, 100, 250);
  rect(collisionBox2.x, collisionBox2.y, 100, 250);
  noStroke();
  
  //PLAYER COLLISION BOX
  assets.rect= new PVector(assets.playerPos.x,assets.playerPos.y);
  assets.size= new PVector(50, 100);
  fill (0,0);
  strokeWeight(3); 
  stroke (#F02CED);
  rect (assets.rect.x,assets.rect.y, assets.size.x,assets.size.y);
  
}
