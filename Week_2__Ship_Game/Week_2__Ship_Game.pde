Enemy e;
GameScreens gs;
Ship ship;
void setup (){
  size (1000,1000);
  noStroke();
  gs=new GameScreens(width,height);
  e=new Enemy(width,height,1);
}
void draw (){
  background (0);//black background 
  gs.display();
  gs.update();
  switch(gs.screen){
    case 1:
    e.display();
    e.update(); 
    break;
  }
}
