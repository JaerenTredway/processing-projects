/*   run the code
*  click on "browser window -->" to activate the window
*  press any key except 'c' to draw starburst at mouse location
*  press 'c' to clear screen
*/

void setup() {
  size (800, 800);
  background(0);
  instructions();
}

void draw () {
}

void instructions () {
  text("click on screen then", width/2, height/2);
  text("press space to launch a star at mouse location", width/2, height/2 + 25);
  text("press 'c' to reset", width/2, height/2 + 50);
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

void keyPressed () {
  stroke(random(150,250),random(150,250),random(150,250));
  starBurst(mouseX,mouseY,100,20);
  if (key == 'c')
  {
    background(0);
    instructions();
  }
}
