/*****************************************
 * Assignment 1
 * Name:        Jaeren Tredway
 * E-mail:      jwtredway@unm.edu
 * Course:      CS 152 - Section 006 TA
 * Submitted:   8/23/2020
 *
 * An interactive sketch.
 * Click your mouse to activate animations.
***********************************************/

float x = 0;
float y = 0;
boolean reset = false;

void setup() {
  size(1200, 600, P3D);
  init();
}

void init() {
  fill(0);
  rect(0, 0, width, height);
  noLoop();
  background(0);
  fill(255);
  textSize(66); 
  text("JAEREN WILLIAM TREDWAY", width/4 - 30, height/2 - 30); 
  //textSize(24);
  //text("WORD", width/4 + 10, height/2 + 10);
  textSize(12); 
  stroke(255);
  text("hold down mouse button to make the magic happen", 875, 540);
  text("press spacebar to reset", 875, 555);
}

void draw() { 
  //the stripe that goes through my name:
  line(x, 200, x, 350); 
  
  //the fireball:
  stroke(140-x, 40-x, 0);
  ellipse(100+x, y/3-50, 50, 50);
  
  //the box:
  stroke(x-150, x-250, 0);
  fill(x/2-250, x/4-150, 0);
  strokeWeight(5); //make box border fat
  rect(width/2 + 60, height/2 + 80, 200, 200, 6, 16, 16, 78);
  
  //the trapezoid:
  if (x < 200) {
    strokeWeight(2+x/150);
    quad(100, 550, 300, 550, 300+x, 580, 100, 580);
  }
 
  strokeWeight(1); //reset lines back to thin
  stroke(255);
  //the vertical stripe:
  line(85, y, 30, y); 
  x += 4;
  y += 2;
  
  //modify horizontal stripe shade around name:
  if (x > 255) {
    stroke(150);
  }
  if (x > 1130) {
    stroke(255);
  } 
  
  //add more text later in the game:
  if (x==1100) {
    textSize(24);
    color(255);
    text("WORD TO THE MAN", width/4 + 10, height/2 + 10);
  } 
  
  //after spacebar is pressed:
  if (reset == true) {
    println("reset activated");
    init();
    reset = false;
  }
}//END draw()

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

//resets the graphics:
void keyPressed() {
  if(key==32){
    loop();
    key = 0;
    x = 0;
    y = 0;
    reset = true;
  }
}
