import Turtle.*;

Turtle t; 
L_System l;
int fileNumber = 1;
int lineThickness = 15;
int iterations = 8;


void setup() {
  size(864,864);
  background(255);
  strokeWeight(lineThickness);
  t = new Turtle(this);
  t.back(height/2 - 200);
  
  //construct the L-system:
  l = new L_System();
  
  //build the string:
  l.iterate(iterations);
  noLoop();
}

//draw the design but don't loop:
void draw() {
  strokeWeight(lineThickness);
  background(255);
  l.drawLSystem(t);
}

//capture image:
void keyPressed() {
  if (key == ' ') {
    println("image captured");
    save("botanical-" + fileNumber + ".jpg");
    fileNumber++; 
  }
}
