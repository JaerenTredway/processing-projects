import Turtle.*;

Turtle t; 
L_System l;


void setup() {
  size(864,864);
  background(255);
  t = new Turtle(this);
  t.back(height/2 - 50);
  
  //construct the L-system:
  l = new L_System();
  
  //build the string:
  l.iterate(4);
  noLoop();
}

//draw the design:
void draw() {
  background(255);
  l.drawLSystem(t);
}
