class L_System {
  String axiom, computedString;
  String[][] rules =  {{"+", "+", "+", "+"},
                      {"-", "-", "-", "-"},
                      {"[", "[", "[", "["},
                      {"]", "]", "]", "]"},
                      //imbalance the pushes and pops:
                      {"X", "F[+X][-X]FX", "F[+X][-XFX", "F[+X]-X]XFX"},
                      {"F", "FF", "FF", "FF"}};
  public float size;
  public float angle;
  
  
  //constructor:
  L_System () {
    axiom = "X";
    computedString = axiom;
    size = 1.9;
    angle = 40;
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
            String addition = rules[k][(int)random(0,4)];
            computedString = computedString + addition;
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
      case 'X':
        fill(random(75,255),0,0);
        noStroke();
        rect(t.getX(), t.getY(), 75, 5);
        stroke(0);
        noFill();
        break;
      case '+':
        t.right(angle);
        break;
      case '-':
        t.left(angle);
        break;
      case '[':
        t.push();
        break;
      case ']':
        t.pop();
        break;
      }
    }
  }
  
}//EOF
