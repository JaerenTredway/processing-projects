/*
 * Jaeren Tredway 2020
 * note: if you increase the number of cells, reduce the 
 * textSize() on line 25
 */


//member variables that the whole program can see:
int rows = 4; //the number of rows
int cols = 4; //the number of columns
int[][] theGrid= new int[rows][cols]; 
//assign screen dimensions here before size() function is called in setup():
int windowWidth = 500; 
int windowHeight = 500; 
//so that you can get these cell dimensions for global use:
float rectWidth = windowWidth/cols; 
float rectHeight = windowHeight/rows;
//these will track the starting x and y positions where each rect() is drawn:
float xCoord; 
float yCoord; //assign changing values to these with your i and j indexes below in setup()


void setup() {
    //silly: you can't use variables for args in size(), so this repeats windowWidth and windowHeight:
    size(500,500);
    textSize(40);
    //draw cells with array index addresses displayed inside each cell:
    for(int i=0; i<rows;i++){
        yCoord=i*(rectHeight); 
        for(int j=0;j<cols;j++){
            xCoord=j*(rectWidth);
            //draw cells here:
            drawCell(i, j, 55, 150);
        }
    } 
    //store initial random number in each array address:
    for(int i=0;i<rows;i++){
        for(int j=0;j<cols;j++){
            theGrid[i][j]=int(random(0,100));
        }
    } 
}//END setup()


//this re-draws a single cell from within a 2D for-loop:
void drawCell (int i, int j, int cellColor, int textColor) {
    //draw cell:
    fill(cellColor);
    rect(xCoord,yCoord,rectWidth,rectHeight);
    //write array addresses in cell:
    fill(textColor);
    textAlign(CENTER,CENTER);
    text("["+i+"]["+j+"]",xCoord,yCoord, rectWidth,rectHeight); 
}//END drawCell()


void draw () {
    for(int i=0; i<rows;i++){
        yCoord=i*(rectHeight); 
        for(int j=0;j<cols;j++){
            xCoord=j*(rectWidth);
            //if mouse is hovering on the cell at this position, redraw with int value displayed and lighter color:
            if ((mouseX > xCoord && mouseX < xCoord + rectWidth) &&
                (mouseY > yCoord && mouseY < yCoord + rectHeight)) {
                fill(200);
                rect(xCoord,yCoord,rectWidth,rectHeight);
                fill(0);
                text(str(theGrid[i][j]),xCoord,yCoord, rectWidth, rectHeight);
            } else {
                //otherwise redraw the original dark grey cell at this position: 
                drawCell(i, j, 55, 150);
            }
        }
    }
}//END draw()
 
 
//this gets the average of the entire array:
float averageValue () {
    float sum=0;
    for(int i=0;i<rows;i++){
        for(int j=0;j<cols;j++){
            sum += theGrid[i][j];
        }
    }
    float average= sum/(rows*cols);
    return average;
}//END average()


//this reassigns a random int into the cell you click on,
//and if you click the upper left cell it prints out the average of the entire array in the console:
void mouseClicked(){
    outerBlock: {
        for(int i=0; i<rows;i++){
            yCoord=i*(rectHeight); 
            for(int j=0;j<cols;j++){
                xCoord=j*(rectWidth);
                //reassign random int to cell you click on:
                if ((mouseX > xCoord && mouseX < xCoord + rectWidth) &&
                    (mouseY > yCoord && mouseY < yCoord + rectHeight)) {
                    theGrid[i][j] = int(random(0,100)); 
                //if the upper left cell is clicked, print out the average of the whole array:
                } else if (mouseX<rectWidth && mouseY<rectHeight) {
                    println("the average is: "+averageValue());
                    break outerBlock;
                }
            }   
        }
    }
}//END mouseClicked()
