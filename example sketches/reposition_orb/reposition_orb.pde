
//click on sketch to change orb position and color

void setup (){
  size(600, 600);
  background(0);
  text("click anywhere on screen to create an orb", width/2, height/2);
  noStroke();
  fill(255,0,0,15);       //transparency is the 4th parameter 255 = opaque
  //glowingCircle(500, mouseX, mouseY);
}

void draw() {
}

void glowingCircle(int diameter, int x, int y){
  int i = diameter;
  
  while(i > 1) {
    ellipse(x, y, i, i);
    i=i-10;
  }
}

void mouseClicked () {
  background(0);
  fill(random(0,255),random(0,255),random(0,255),15);
  glowingCircle(300, mouseX, mouseY);
}
