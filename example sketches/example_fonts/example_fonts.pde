PFont myFont;

void setup() {
  size(500,500);
  textSize(128);
  String[] fontList = PFont.list();
  printArray(fontList);
  myFont = createFont("GillSans-UltraBold", 40);
  textFont(myFont);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(155);
  text("JaerenT", mouseX, mouseY);
}
