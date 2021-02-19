import Turtle.*;

Turtle t; 
L_System l;
int fileNumber = 1;


void setup() {
  size(864,864);
  background(255);
  stroke(150);
  t = new Turtle(this);
  strokeWeight(0);
  
  //construct the L-system:
  l = new L_System();
  
  //build the string:
  l.iterate(7);
  noLoop();
  
  //draw design:
  drawMold();
}

void draw() {
  
}

//draw the design:
void drawMold() {
  for (int i = 0; i < 10; i++) {
    l.size -= random(0, 4) * 0.1;
    for (int j = 0; j <= 10; j++) {
      l.drawLSystem(t);
      t.setX(width/2);
      t.setY(height/2);
      t.right(random(10, 40));
    }
  }
}

//capture image:
void keyPressed() {
  if (key == ' ') {
    println("image captured");
    save("botanical-" + fileNumber + ".jpg");
    fileNumber++; 
  }
}
