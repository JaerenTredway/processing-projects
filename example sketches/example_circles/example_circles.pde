int fileNumber = 0;

void setup () {
  size(500, 500);
  println("INSTRUCTIONS:");
  println("PRESS SPACEBAR to capture current stage to a .jpg");
  println("CLICK MOUSE to spew circles everywhere");
}


void draw () {
  //background(155);
  stroke(0, 255, 255);
  strokeWeight(5);
  //noStroke();
  //fill(255, 0, 0);
  ellipse(mouseX, mouseY, 50, 50);
}


void keyPressed() {
  if (key == ' ') {
    save("circles-" + fileNumber + ".jpg");
    fileNumber++;
  }
}


void mouseClicked() {
  float myRandom = random(0, 255);
  int circleSize;
  //background(0);
  for (int i = 0; i < 100; i++) {
    circleSize = (int)random(10,50);
    fill(myRandom);
    ellipse(random(0, width), random(0, height), circleSize, circleSize);
  }
}
