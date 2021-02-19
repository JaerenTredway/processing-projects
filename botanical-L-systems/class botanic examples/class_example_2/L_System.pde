class L_System {
  String axiom, computedString;
  String[][] rules = {{"+", "+"},
                      {"-", "-"},
                      {"L", "L+R+"},
                      {"R", "-L-R"}};
  float size;
  float angle;
  
  
  //constructor:
  L_System () {
    axiom = "L";
    computedString = axiom;
    size = 4;
    angle = 90;
  }
  
  
  //this builds up the string that is the "code" for the drawing:
  void iterate(int generations) {
     println(computedString);
    for (int i=0; i<generations; i++) {
      String newString = computedString;
      computedString = new String();
      for (int j=0; j<newString.length(); j++) {
        for (int k=0;k<rules.length;k++) {
          if (newString.charAt(j) == rules[k][0].charAt(0)) {
            computedString = computedString + rules[k][1];
            break;
          }
        }
      }
      println(computedString);
    }
  }
  
  
  //this interprets the "code-string" to make the drawing:
  void drawLSystem(Turtle t) {
     for (int i=0; i<computedString.length(); i++) {
      switch(computedString.charAt(i)) {
      case 'F':
        t.forward(size);
        break;
      case 'L':
        t.forward(size);
        break;
      case 'R':
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
