//CS152 Lab week 3 : Challenge 2
//move mouse to control orb, click to change color

void setup (){
  size(600, 600);
  background(0);
  noStroke();
  fill(255,0,0,15);       //transparency is the 4th parameter 255 = opaque
  text("click to change color", width/2, height/2);
  text("move with mouse", width/2, height/2 + 25);
}

void draw() {
  background(0);
  glowingCircle(10, mouseX, mouseY);
}

void glowingCircle(int diameter, int x, int y){
  int i = diameter;
  
  while(i < 250) {
    ellipse(mouseX,mouseY, i, i);
    i=i+10;
  }
}

void mouseClicked () {
  background(0);
  fill(random(0,255),random(0,255),random(0,255),15);
  glowingCircle(10, mouseX, mouseY);
}
