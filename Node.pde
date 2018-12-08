class Node {
  int x; //x location
  int y;  //y location
  int Rad;  //radious of circle
  ArrayList <Node> Links = new ArrayList<Node>(0);      //what it links too
  float f, g, h;                                          //used in A* Calc
  Node pre;                                              //from what node it was accesed


  Node(int Inx, int Iny, int size) {                              //constructor 
    ellipseMode(CENTER);
    fill(255);
    stroke(1);
    x = Inx;
    y = Iny;
    Rad = size;
    ellipse(x, y, size, size);                    //draw white circle at location
    f = 0;                                          //set all values for a* to 0
    g = 0;
    h = 0;
    pre = null;                                    //isnt accessed from anywhere, note key part with while loop for end blue path
  }



  void LinkNode(Node other) {                                        //add node to link array
    Links.add(other);
    if (!other.Links.contains(this)) {                              //if the node being linked dosnt have this node in its linked array link it for it
      other.LinkNode(this);
    }
    line(x, y, other.x, other.y);                                  //draw a line in between nodes indicating linked
  }


  void ReDraw() {                                                  //redraw the node
    fill(255);
    stroke(1);
    ellipse(x, y, Rad, Rad);
  }

  void ReColorNodes(int r, int g, int b) {                            //chnage the nodes color
    fill(r, g, b);
    ellipse(x, y, Rad, Rad);
  }

  void Reset() {                                                  //reset all A* vlaues getting ready for antoher run
    f = 0;
    g = 0;
    h = 0;
    pre = null;
  }
}
