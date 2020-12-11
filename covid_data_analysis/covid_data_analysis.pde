//variables:
String[] inputFile;
int[] data;
int numberOfDataPoints;
float rectWidth, rectHeight, xPosition, yPosition;
int max = 0;
int min = 0;
int sum = 0;
int average = 0;
int evenCounter = 0;

void setup() {
  size(1000,500);
  background(255);

  // build data array out of text file:
  inputFile = loadStrings("NMCovidData.txt");
  numberOfDataPoints = inputFile.length - 1;
  data = new int[numberOfDataPoints];
  for (int i = 1;i<inputFile.length; i++) {
    String[] pieces = split(inputFile[i], ",");
    data[i-1] = int(pieces[3]);
  }

  // draw rectangles:
  rectWidth = float(width)/numberOfDataPoints;
  xPosition = 0;
  yPosition = height;
  fill(255,255,0);
  for (int i=0;i<numberOfDataPoints;i++) {
    rect(xPosition, yPosition, rectWidth, -data[i]);
    xPosition = xPosition + rectWidth;
  }

  // title banner:
  textSize(20);
  fill(0);
  text("New NM COVID-19 cases 3/11 - 9/12/2020", 50, 50);

  /* Go through data array, and sum all the data.
   * Also, each step through the array,
   * if current number is > max, set max to current number,
   * or if current number is < min, set min to current number,
   * if current number / 2 has no remainder, increment evenCounter:
   */
  min = data[0];
  for(int i = 0; i < numberOfDataPoints; i++) {
    sum = sum + data[i];
    if(data[i] < min){
      min = data[i];
    }
    if(data[i] > max){
      max = data[i];
    }
    if(data[i] % 2 == 0){
      evenCounter++;
    }
  }
  
  // find the average:
  average = sum / numberOfDataPoints;
  
  //console report:
  println("Minimum Value: " + min);
  println("Maximum Value: " + max);
  println("Average: " + average);
  println("Even Numbers: " + evenCounter);
  
  //GUI report:
  text("Minimum: ", 50, 100);
  text(min, 50, 125);
  
  text("Maximum: ", 50, 150);
  text(max, 50, 175);
  
  text("Average: ", 50, 200);
  text(average, 50, 225);
  
  text("Even Numbers: ", 50, 250);
  text(evenCounter, 50, 275);
  
}//END setup()
