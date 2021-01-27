void setup() {
  size (800, 800);
  background(0);
  text("click on screen", width/2, height/2);
}

void draw () {
}

void lineAtAngle (float x, float y, float lineLength, float angle) {
  float x1, y1;
  x1 = x + cos(radians(angle))*lineLength;
  y1 = y + sin(radians(angle))*lineLength;
  line (x,y,x1,y1);
  ellipse(x1, y1, 5, 5);
}

void starBurst (float x, float y, float size, int numberOfSpokes) {
  float angle = 360/numberOfSpokes;
  for (float i=0; i<360; i=i+angle) {
    lineAtAngle(x, y, random (size/2, size), i);
  }
}

void mouseClicked () {
  int starsPerRow = 5;
  background(0);
  for (int j=0;j<starsPerRow;j++)
  {
    for (int i=0;i<starsPerRow;i++)
    {
      stroke(random(150,250),random(150,250),random(150,250));
      starBurst((width/starsPerRow)*i + width/(starsPerRow*2), 
                      (height/5)*j + height/(starsPerRow*2), 
                      random(30,40), 
                      10);
    }
  }
}
