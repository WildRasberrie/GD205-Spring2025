Boolean col(PVector playerPos, PVector plat, int dist) {
  if (dist (playerPos.x, playerPos.y, plat.x, plat.y) < dist) {
    return true;
  } else return false;
}

/**************************************
 SET COLLISIONS
/**************************************/
void collisions () {
  for (int i = 0; i < debugplats.length; i ++) {
    if (col(player.pos, debugplats[i].pos, 70)) { // if btwn river and colliding
      player.colliding = true;
      player.pos.y= debugplats[i].pos.y;
      player.pos.x= debugplats[i].pos.x;
    
    } else if (!col(player.pos,debugplats[i].pos,70)){
        player.colliding = false;
      }
    //River Collisions
    /****************************************
     LIFE COUNTER
    /****************************************/
    
      if (player.atWaterEdgeL && player.atWaterEdgeR && !player.colliding) {
        player.isDying=true;
        player.playerControl=false;
      }
    
  }

  if (player.isDying) {
    player.animState=2;
    ui.hearts-=1;  //if with river bounds and not colliding, lose health
    player.pos = new PVector (100, height/2.0);
  }
}
