import megamu.mesh.*;

//author:      Jaeren Tredway jwtredway@unm.edu
//library:     http://leebyron.com/mesh/
//description: This program does the following:
//             1. sets up a stage
//             2. creates a Voronoi object using a 2D array of random points
//             3. draws the corresponding Voronoi diagram
//             4. on keyPress(spacebar) takes a picture of the current stage
//             5. on mousePress() changes color scheme
//             6. additional key commands: run program and see usage in 
//                console.


//variables:
int numCells = 10;
int lineThickness = 10;
float flashingRate = 12;
int fileNumber = 0;   //file number for each .jpg that gets captured
int red = 0;
int green = 0;
int blue = 0;
int colorScheme = 1; //the color scheme is changed in mouseClicked()
Voronoi myVoronoi = makeVoronoi(); 
boolean whiteCells = false;
String usage =   "\nINSTRUCTIONS:\n" +
                 "    'u' to show usage\n" +
                 "    line thickness: 'a' to increase, 'z' to decrease\n" +
                 "    number of cells: 's' to increase +10, 'x' to decrease -10\n" +
                 "    CLICK MOUSE to change color scheme\n" +
                 "    flashing rate: 'd' to increase, 'c' to decrease\n" +
                 "    rapid freeze: 'q'\n" +
                 "    SPACEBAR to capture current stage to a .jpg (saved in this project folder\n";
                 
                                                                                
//makes the stage:
void setup() {
  size(1000, 1000);
  println(usage); //prints user instructions in the console
}


//makes a Voronoi object that takes as an arg a 2D array of random points: 
Voronoi makeVoronoi () {
  float[][] points = new float[numCells][numCells];
  for (int i = 0; i < numCells; i++) {
    for (int j = 0; j < numCells; j++) {
      int rand = (int)random(990);
      points[i][j] = rand;
    }
  }
  Voronoi result = new Voronoi(points);
  return result;
}


//gets the cells of the Voronoi object and draws them on the stage:
void drawVoronoi() {
  MPolygon[] cells = myVoronoi.getRegions();
  for(int i = 0; i < cells.length; i++) {
    fill(random(50, red), random(50, green), random(50, blue));
    if (whiteCells) fill(255);
    cells[i].draw(this); //draws one cell
  }
}


//runs at frameRate to re-draw the stage over and over:
void draw() {
  frameRate(flashingRate); //how often draw() is called
  strokeWeight(lineThickness);
  drawVoronoi();
}


//user commands:  takes a picture of the current stage,
//                changes line thickness,
//                chnages colour flashing rate,
//                changes number of cells,
//                abruptly stops flashing colours,
//                or prints usage instructions in console:
void keyPressed() {
  if (key == ' ') {
    println("image captured");
    save("voronoi-" + fileNumber + ".jpg");
    fileNumber++; 
  }
  if (key == 'a') {
    lineThickness++;
    println("lineThickness = " + lineThickness);
  }
  if (key == 'z' && lineThickness >= 0) {
    if (lineThickness > 0) lineThickness--;
    println("lineThickness = " + lineThickness);
  }
  if (key == 'd') {
    flashingRate++;
    println("flashingRate = " + flashingRate);
  }
  if (key == 'c' && flashingRate > 1) {
    flashingRate--;
    println("flashingRate = " + flashingRate);
  }
  if (key == 's') {
    numCells += 10;
    println("numCells = " + numCells);
    myVoronoi = makeVoronoi();
  }
  if (key == 'x' && numCells > 10) {
    numCells -= 10;
    println("numCells = " + numCells);
    myVoronoi = makeVoronoi();
  }
  if (key == 'q') {
    flashingRate = 0.3;
    println("flashingRate = " + flashingRate);
  }
  if (key == 'u') {
    println(usage);
  }
}


//makes a fresh Voronoi Diagram when the mouse is clicked:
void mouseClicked() {
  if (colorScheme == 5) colorScheme = 0;
  switch (colorScheme) {
    case 0: //grey:
      whiteCells = false;
      red = 0;
      green = 0;
      blue = 0;
      break;
    case 1: //white:
      whiteCells = true;
      break;
    case 2:
      whiteCells = false;
      red = 255;
      green = 0;
      blue = 0;
      break;
    case 3:
      whiteCells = false;
      red = 0;
      green = 255;
      blue = 0;
      break;
    case 4:
      whiteCells = false;
      red = 0;
      green = 0;
      blue = 255;
      break;
  }
  println("colorScheme = " + colorScheme);
  colorScheme++;
}

//EOF 
