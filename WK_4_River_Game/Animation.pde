/******************
 Animation Sprite Tutorial (Animated Sprite
 by James Paterson | processing.org/examples/animatedsprite.html )
 
 I followed as best as I could and tried to change up the variables
 to what felt more natural to use!
 *******************/
class Animation {
  PImage[] froggie;
  int numOfFrogs;
  int frame;

  Animation (String startImage, int number) {
    numOfFrogs=number;
    froggie=new PImage[numOfFrogs];

    for (int i =0; i<numOfFrogs; i++) {
      //use nf to format numbers into strings
      String frogAnims = startImage + nf(i)+".png";
      println(frogAnims);
      froggie[i]=loadImage(frogAnims);
    }
  }

  void display(float x, float y) {
    x=assets.playerPos.x;
    y=assets.playerPos.y;
    frame =(frame+1) % numOfFrogs;
    image(froggie[frame], x, y);
  }

  int getWidth() {
    return froggie[0].width;
  }
}
