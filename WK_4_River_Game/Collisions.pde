Boolean col(PVector playerPos, PVector plat, int dist) {
    if (dist (playerPos.x, playerPos.y, plat.x, plat.y) < dist) {
      return true;
    } else return false;
  }

/**************************************
 SET COLLISIONS
/**************************************/
void collisions (){
  for (int i = 0; i < debugplats.length; i ++){
    if (col(assets.playerPos, debugplats[i].pos, 100)){
      physics.colliding = true;
      assets.playerPos.y= debugplats[i].pos.y;
      assets.playerPos.x= debugplats[i].pos.x-20;

    }
    
  }
}
