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
    for (int i = 0; i < 1000; i = i+33) {
      stroke(0);
      strokeWeight (18);
      line(473, i, 480, i);
    }
    noStroke();
    scoreDisplay();
    
  }
  void update(){
    boolean offScreen=b.pos.x>width||b.pos.x<0;
    if(offScreen){
      endGame();
    }
    if (key=='r'||key=='R'){
      println("R is Being Pressed");
      loop();
      resetGame();
    }
    if (screen==1){
      scoreDisplay(); 
    }else{
      
    }
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
    textSize(180);
    textAlign(CENTER);
    text ("YOU LOSE!",width/2.0,height/2.0);
    textSize(50);
    text ("Press 'R' to reset game",width/2.0,height/2.0+50); 
    noLoop();
  }
  
  void resetGame(){
      screen=1;
    }
}
