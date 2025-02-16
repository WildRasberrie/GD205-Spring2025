Enemy e;
GameScreens gs;
Ship s;
void setup (){
  size(1000,1000);
  noStroke();
  gs=new GameScreens(width,height);
  e=new Enemy(width,height,1);
  s=new Ship(width/2.0,height/2.0+200);
  println("PLAYER POS:\t:"+s.pos.x+",\t"+s.pos.y);
}
void draw (){ 
  background (0);//black background 
  gs.display();
  gs.update();
}
