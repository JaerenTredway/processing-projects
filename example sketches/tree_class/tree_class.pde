
/*
 * This program has a Tree class, which is a 'template' that can be used to
 * manumfacture distinct Tree objects. The 'constructor' is invoked to build
 * a new Tree object called myTree, then the displayTree method is 
 * invoked to display myTree on the screen.
 */

void setup() {
    size(600, 600);
    Tree myTree = new Tree();
    myTree.displayTree();
}

void draw() {
    
}

class Tree {
  //variables
  float xPosition;
  float yPosition;
  color treeColor;
  float size;
  
  //constructor:
  Tree () {
    xPosition = width/2;
    yPosition = height/2;
    size = 100;
    treeColor = color(100, 150, 100);
  }

  //method
  void displayTree () {
    //draws the tree trunk
    stroke(90, 70, 10);  //brown
    strokeWeight(size/10);
    line (xPosition, yPosition, xPosition, yPosition + size);
    
    //draws the top of the tree
    noStroke();
    fill(treeColor);
    triangle (xPosition - size/2, yPosition, 
      xPosition, yPosition - (size + size/2), 
      xPosition + size/2, yPosition);
  }
}
