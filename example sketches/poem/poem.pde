String[] inputFile;
int lineHeight, yPosition;

void setup() {
  size(600,800);
  background(255);
  inputFile = loadStrings("i_carry_your_heart.txt");
  PFont font;
  
  lineHeight = (height - 100)/inputFile.length;
  font = createFont("Zapfino", 12);
  textFont(font);
  
  textSize(15);
  fill(0);
  yPosition = lineHeight+25;
  
  for (int i=0;i<inputFile.length;i++) {
    text(inputFile[i], 50, yPosition);
    yPosition = yPosition + lineHeight;
  }
}
