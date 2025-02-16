Enemy e;
GameScreens gs;
Ship s;
Shoot shoot;
void setup (){
  size(1000,1000);
  noStroke();
  gs=new GameScreens(width,height);
  e=new Enemy(width,height,1);
  s=new Ship(width,height/2.0);
  shoot=new Shoot(width,height);
}
void draw (){
  
  background (0);//black background 
  gs.display();
  gs.update();
}
