
class Buildings {
  ArrayList <Node> doors = new ArrayList<Node>(0);                    //doors on the building
  Buildings() {
  }
  
  void addDoor(Node Door1) {                                  //constructor, changeing for simplciity 
    doors.add(Door1);
  }  
  void addDoor(Node Door1, Node Door2) {
    doors.add(Door1);
    doors.add(Door2);
  }
  void addDoor(Node Door1, Node Door2, Node Door3) {
    doors.add(Door1);
    doors.add(Door2);
    doors.add(Door3);
  }


  void DrawDoors() {                                          //draw the doors again, related to ReDraw() in nodes
    for (int i = 0; i < doors.size(); i++) {
      doors.get(i).ReDraw();
    }
  }

  void reset() {                                                        //resets all the a* calc values readying for another run
    for (int i = 0; i < doors.size(); i++) {
      doors.get(i).Reset();
    }
  }
}
