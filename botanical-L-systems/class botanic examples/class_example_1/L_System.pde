class L_System {
  String axiom, computedString;
  String[][] rules = {{"F", "F-F++F-F"}};
  float size;
  float angle;
  
  
  //constructor:
  L_System () {
    axiom = "F";
    computedString = axiom;
    size = 6;
    angle = 60;
  }
  
  
  //this builds up the string that is the "code" for the drawing:
  void iterate(int generations) {
    println(computedString);
    for (int i = 0; i< generations; i++) {
      String newString = computedString;
      computedString = newString.replaceAll(rules[0][0], rules[0][1]); 
    }
  }
  
  
  //this interprets the "code-string" to make the drawing:
  void drawLSystem(Turtle t) {
    for (int i = 0; i< computedString.length(); i++) {
      switch (computedString.charAt(i)) {
        case 'F':
          t.forward(size);
          break;
        case '+':
          t.right(angle);
          break;
        case '-':
          t.left(angle);
          break;
      }
    }
  }
  
}//EOF
