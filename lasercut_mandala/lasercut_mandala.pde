import Turtle.*;
import processing.pdf.*;

/*
 * author: Jaeren Tredway
 * description: parametric design program that draws a polygonal mandala object
 *    -The line segment length, angle, and line width are changed with 
 *    a,z; s,x; and d,c respectively. Space bar to capture image. 
 *    -jpegs will be converted to pdfs elsewhere.
 *    -for fine detail set lineWidth to 1 (hit 'c')
 *    -interesting capture angles: 63, 70, 72, 75, 77, 78, 83, 84, 86, 99, 101, 105, 106 
 *    -golden angles: 59, 
 *    -simple mandalas: at and near 1 degree, 45,
 *    -interesting noveae malforamtions at 68
 *    -be patient, render times can be long even at high frameRate
 */


//important note: many mandala look insignificant at thicker lineWidths. Use 0 for the 
//finer meshes. Also overall size of the mandala shrinks as angle increases. Use the 
//keboard controla to increase size as you get higher angles.
Turtle t;
int size = 90;
int angle = 90;
int lineWidth = 1; 


void setup() {
  stroke(150,150,255);
  size(864, 864); //or 432x432
  background(255);
  t = new Turtle(this); //'this' passes this sketch to the turtle object
  frameRate(500); //default frameRate is 60
  
  drawMandala();
}


void draw() { 
  
}


//drawing stops when the sum of angles is a multiple of 360:
void polygon(int size, int angle) {
  t.forward(size);
  t.right(angle);
  int sumOfAngles = angle;
  while (sumOfAngles % 360 != 0) {
    t.forward(size);
    t.right(angle);
    sumOfAngles = sumOfAngles + angle;
  }
}


//this draws one poly then turns right and repeats to create a mandala:
void drawMandala() {
  beginRecord(PDF, "mandala-angle-"+ angle + ".pdf"); 
  t.setX(width/2);
  t.setY(height/2);
  strokeWeight(lineWidth);
  background(255);
  stroke(150,150,255);
  
  for (int i = 0; i < 36; i++) {
    polygon(size, angle);
    t.right(10);
  }
  endRecord();
}


//alter parameters with key commmands:
void keyPressed() {
  if (key == ' ') {
    println("image captured");
    stroke(0);
    save("mandala-angle-" + angle + ".jpg");
  }
  if (key == 'a') {
    size += 10;
    println("size increased, size = " + size);
    drawMandala();
  }
  if (key == 'z') {
    size -= 10;
    println("size decreased, size = " + size);
    drawMandala();
  }
  if (key == 's') {
    angle++;
    println("angle increased, angle = " + angle);
    drawMandala();
  }
  if (key == 'x') {
    angle--;
    println("angle decreased, angle = " + angle);
    drawMandala();
  }
  if (key == 'd') {
    lineWidth++;
    println("stroke width increased, width = " + lineWidth);
    drawMandala();
  }
  if (key == 'c' && lineWidth >= 1) {
    lineWidth--;
    println("stroke width decreased, width = " + lineWidth);
    drawMandala();
  }
  if (key == 'q') {
    println("drawing stopped");
    t.penUp();
  } 
}
