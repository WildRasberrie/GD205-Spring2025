class GameScreens{
//PROPERTIES
  PVector pos;
  int screen,score;
  //CONSTRUCTORS
  GameScreens(float x, float y){
    pos= new PVector(x,y);
    screen=1;
    score=0;
  }
  //METHODS
  void display (){
    background(180);
    scoreDisplay();
    
  }
  void update(){
    boolean offScreen=b.pos.x>width||b.pos.x<0;
    if(offScreen){
      //endGame();
    }
    if (key=='r'||key=='R'){
      resetGame();
    }
    scoreDisplay();    
  }
  
  void scoreDisplay(){
  resetMatrix();
  pushMatrix();
  fill (255,0,0);//red
  textSize(36);
  text ("Score: " + score,width-150,50);
  popMatrix();
  }
  
  void endGame(){
    resetMatrix();
    screen=2;
    background(0);
    fill(255);//white fill
    textSize(200);
    text ("YOU LOSE!",0,height/2.0);
    textSize(50);
    text ("Press 'R' to reset game",0,height/2.0+50);  
  }
  
  void resetGame(){
      screen=1;
    }
}
