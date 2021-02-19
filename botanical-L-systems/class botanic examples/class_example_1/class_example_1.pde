import Turtle.*;

Turtle t;

void setup() {
  size(864,864);
  background(255);
  t = new Turtle(this);
  
  //the L-system:
  L_System l = new L_System();
  
  //move the starting position of the drawing:
  t.penUp();
  t.back(height/2 - 50);
  t.penDown();
  
  //build the string and draw the design:
  l.iterate(4);
  l.drawLSystem(t);
}


void draw() {
  
}
