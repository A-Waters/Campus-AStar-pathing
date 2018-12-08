class Button {
  int x, y, w, h;
  String content;
  Buildings DirBuild; 
  Button(String cont, int InX, int InY, int Inw, int Inh) {                                          //create the button
    textSize(14);
    textAlign(CENTER);
    rectMode(RADIUS);
    x = InX;
    y = InY;
    w = Inw;
    h = Inh;
    content = cont;
    fill(#898989);
    rect(x, y, w, h);
    fill(0);
    text(content, x, y+7);
  }

  String CheckClick(int r, int g, int b) {                                                           //make sure the mouse if over the button
    if (mouseY < y+h && mouseY > y-h) {
      fill(r, g, b);
      rect(x, y, w, h);
      fill(0);
      text(content, x, y+7);
      println("house selected");
      return content;
    } else
      return null;
  }

  void deSelect() {                                                                                   //deselect if not
    fill(#898989);
    rect(x, y, w, h);
    fill(0);
    text(content, x, y+7);
  }
}
