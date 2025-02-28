GameScreens gs;
void setup(){
  size(1000,1000);
  gs=new GameScreens(width,height);
}
void draw(){
  println(mouseX+",\t"+mouseY);
  gs.update();
}
