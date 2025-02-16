Enemy e;
GameScreens gs;
Ship s;
void setup (){
  size(1000,1000);
  noStroke();
  gs=new GameScreens(width,height);
  e=new Enemy(width,height,1);
  s=new Ship(width,height/2.0);
}
void draw (){ 
  background (0);//black background 
  gs.display();
  gs.update();
}
