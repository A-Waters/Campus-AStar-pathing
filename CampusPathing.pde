//Campus pathing by Alex Waters - attemp 2, Just lost all my work from a bug in the complier 

ArrayList <Buildings> Locations = new ArrayList<Buildings>();                      //All the strutcures in the world
ArrayList <Node> ClosedSet = new ArrayList<Node>();                                //Nodes not avaiable for pathing - A*
ArrayList <Node> OpenSet = new ArrayList<Node>();                                  //Nodes being tested for pathing - A*
ArrayList <Node> Path = new ArrayList<Node>();                                     //the most effecnt path - A*
ArrayList <Button> SelBut = new ArrayList<Button>();                               //selction buttons for ease
ArrayList <Button> EndBut = new ArrayList<Button>();                               //end buttons for ease
Button RunBut;                                                                     //RunButton
Buildings StartHouse;                                                              //the begiing node
Buildings EndHouse;                                                                //the ending node
Node start = null;                                                                 //the bringin node
Node end = null;                                                                   //the goal node
PImage map;                                                                        //the image of the campus
Float TempG;                                                                       //the temperary g for A* Calc
boolean run;

//a-1 - the sections of the maps I took on at a time
//ccm
Button SelCCM;                                                                     //create the buttons for each building
Button EndCCM;
Buildings CCM;                                                                     //create all buildings and doors
Node CCM1;
Node CCM2;
Node CCM3;

//pearl
Button SelPearl;                                                                    //repeate
Button EndPearl;
Buildings Pearl;
Node Pearl1;

//cushing
Button SelCushing;
Button EndCushing;
Buildings Cushing;
Node Cushing1;

//bader
Button SelBader;
Button EndBader;
Buildings Bader;
Node Bader1;

//IDX
Button SelIDX;
Button EndIDX;
Buildings IDX;
Node IDX1;
Node IDX2;


//a-2                      
//joyce
Button SelJoy;
Button EndJoy;
Buildings Joyce;
Node Joy1;
Node Joy2;
Node Joy3;

//Freeman
Button SelFree;
Button EndFree;
Buildings Freeman;
Node Free1;
Node Free2;

//Alumni
Button SelAlumn;
Button EndAlumn;
Buildings Alumn;
Node Alumn1;

//eats
Button Seleats;
Button Endeats;
Buildings eats;
Node eats1;
Node eats2;
Node eats3;

//Ireland
Button SelIre;
Button EndIre;
Buildings Ireland;
Node Ire1;
Node Ire2;
Node Ire3;
Node Ire4;

//a3
//wick
Button SelWick;
Button EndWick;
Buildings Wick;
Node Wick1;

//carrige
Button SelCarr;
Button EndCarr;
Buildings Carriage;
Node Carr1;


//foster
Button SelFoster;
Button EndFoster;
Buildings Foster;
Node Foster1;

//Lib
Button SelLib;
Button EndLib;
Buildings Library;
Node Lib1;


//Aiken
Button SelAik;
Button EndAik;
Buildings Aiken;
Node Aik1;
Node Aik2;


//Schillhammer
Button SelSchill;
Button EndSchill;
Buildings SchillHammer;
Node Schill1;

//Presidents hall
Button SelPres;
Button EndPres;
Buildings President;
Node Pres1;


//a-1
Buildings Outside;                                                                 //create outside 
Node IDXWalkway;                                                                   //each node is an interscetion in the sidewalk
Node leftPearl;
Node OutsidePearl;
Node RightCushing;
Node OutsideCushing;
Node MainCenter;
Node RightBader;
Node OutsideBader;
Node BotLeftCorner;
Node LowerLeftStreet;
Node BotStoneStairs;
Node CCMDouble;
//a-2
Node TopStoneStairs;
Node MiddleCommon;
Node LeftCommon;
Node TopCommon;
Node OutsideIreland;
Node StreetCenter;
Node CCMLeft;
Node TopRight;
Node BehindJoyce;
//a-3
Node MidStairs;
Node RightStairs;
Node WickCorn;
Node LowLeftIre;
Node HighLeftIre;
Node IreCorn;
Node BelowAike;
Node ThreeWayIter;
Node RightWick;
Node OutsideCarriage;
Node OutsideFoster;
Node OutsideLib;
Node TopToplawn;
Node RightAike;
Node AikeDrive;
Node TopRightAike;
Node TopStreet;
Node OutsideSchill;
Node OutsidePres;
Node TopLeftCorn;


void setup() {  
  frameRate(15);                                                                   //change this to change the speed of the ai and menu selcetion checking
  size(800, 900);
  background(#898989);
  map = loadImage("Section A.PNG");                                                //the img of the campus
  map.resize(500, 800);                                                            //resizeing
  image(map, 300, 100);                                                            //display the map

  RunBut = new Button("run", 150, 800, 60, 10);

  //a-1
  //ccm
  SelCCM = new Button("CCM", 75, 150, 50, 10);                                     //creating the CCM startining button
  EndCCM = new Button("CCM", 200, 150, 50, 10);                                    //same for end button
  CCM = new Buildings();                                                           //create building
  CCM1 = new Node(350, 735, 15);                                                   //create doors
  CCM2 = new Node(450, 735, 15);
  CCM3 = new Node(520, 720, 15);
  CCM.addDoor(CCM1, CCM2, CCM3);                                                   //add doors to building
  Locations.add(CCM);                                                              //add building to locations
  SelCCM.DirBuild = CCM;                                                           //realteing the house to the button
  EndCCM.DirBuild = CCM;
  EndBut.add(EndCCM);                                                              //adding the button to the Selction list
  SelBut.add(SelCCM);

  //pearl
  SelPearl = new Button("Pearl", 75, 184, 50, 10);
  EndPearl = new Button("Pearl", 200, 184, 50, 10);
  Pearl = new Buildings();                                                         //repeat
  Node Pearl1 = new Node(630, 810, 15);
  Pearl.addDoor(Pearl1);
  Locations.add(Pearl);
  SelPearl.DirBuild = Pearl;
  SelBut.add(SelPearl);
  EndPearl.DirBuild = Pearl;
  EndBut.add(EndPearl);

  //cushing
  SelCushing = new Button("Cushing", 75, 218, 50, 10);
  EndCushing = new Button("Cushing", 200, 218, 50, 10);
  Cushing = new Buildings();
  Cushing1 = new Node(525, 810, 15);
  Cushing.addDoor(Cushing1);
  Locations.add(Cushing);
  SelCushing.DirBuild = Cushing;
  SelBut.add(SelCushing);
  EndCushing.DirBuild = Cushing;
  EndBut.add(EndCushing);

  //idx
  SelIDX = new Button("IDX", 75, 252, 50, 10);
  EndIDX = new Button("IDX", 200, 252, 50, 10);
  IDX = new Buildings();
  IDX1 = new Node(700, 725, 15);
  IDX.addDoor(IDX1);
  IDX2 = new Node(690, 620, 15);
  IDX.addDoor(IDX2);                                                          //post creation note- just realized I made a method for adding mutiple doors doors I dont use 90% of the time but im not gonna go back and change it
  SelIDX.DirBuild = IDX;
  SelBut.add(SelIDX);
  EndIDX.DirBuild = IDX;
  EndBut.add(EndIDX);

  //badder
  SelBader = new Button("Bader", 75, 286, 50, 10);
  EndBader = new Button("Bader", 200, 286, 50, 10);
  Bader = new Buildings();
  Bader1 = new Node(375, 810, 15);
  Bader.addDoor(Bader1);
  Locations.add(Bader);
  SelBader.DirBuild = Bader;
  SelBut.add(SelBader);
  EndBader.DirBuild = Bader;
  EndBut.add(EndBader);


  //Joyce a-2
  SelJoy = new Button("Joyce", 75, 320, 50, 10);
  EndJoy = new Button("Joyce", 200, 320, 50, 10);
  Joyce = new Buildings();
  Joy1 = new Node(670, 600, 15);
  Joyce.addDoor(Joy1);
  Joy2 = new Node(630, 600, 15);
  Joyce.addDoor(Joy2);
  Joy3 = new Node(590, 580, 15);
  Joyce.addDoor(Joy3);
  Locations.add(Joyce);
  SelJoy.DirBuild = Joyce;
  SelBut.add(SelJoy);
  EndJoy.DirBuild = Joyce;
  EndBut.add(EndJoy);

  //Alumni
  SelAlumn = new Button("Alumni", 75, 354, 50, 10);
  EndAlumn = new Button("Alumni", 200, 354, 50, 10);
  Alumn = new Buildings();
  Alumn1 = new Node(515, 615, 15);
  Alumn.addDoor(Alumn1);
  Locations.add(Alumn);
  SelAlumn.DirBuild = Alumn;
  SelBut.add(SelAlumn);
  EndAlumn.DirBuild = Alumn;
  EndBut.add(EndAlumn);

  //Eats
  Seleats = new Button("EATS", 75, 388, 50, 10);
  Endeats = new Button("EATS", 200, 388, 50, 10);
  eats = new Buildings();
  eats1 = new Node(450, 580, 15);
  eats.addDoor(eats1);
  eats2 = new Node(390, 560, 15);
  eats.addDoor(eats2);
  eats3 = new Node(340, 625, 15);
  eats.addDoor(eats3);
  Locations.add(eats);
  Seleats.DirBuild = eats;
  SelBut.add(Seleats);
  Endeats.DirBuild = eats;
  EndBut.add(Endeats);

  //Freeman
  SelFree = new Button("Freeman", 75, 422, 50, 10);
  EndFree = new Button("Freeman", 200, 422, 50, 10);
  Freeman = new Buildings();
  Free1 = new Node(550, 530, 15);
  Freeman.addDoor(Free1);
  Free2 = new Node(580, 490, 15);
  Freeman.addDoor(Free2);
  Locations.add(Freeman);
  SelFree.DirBuild = Freeman;
  SelBut.add(SelFree);
  EndFree.DirBuild = Freeman;
  EndBut.add(EndFree);

  //Ireland
  SelIre = new Button("Ireland", 75, 456, 50, 10);
  EndIre = new Button("Ireland", 200, 456, 50, 10);
  Ireland = new Buildings();
  Ire1 = new Node(425, 480, 15);
  Ireland.addDoor(Ire1);
  Ire2 = new Node(340, 475, 15);
  Ireland.addDoor(Ire2);
  Ire3 = new Node(340, 390, 15);
  Ireland.addDoor(Ire3);
  Ire4 = new Node(390, 450, 15);
  Ireland.addDoor(Ire4);
  Locations.add(Ireland);
  SelIre.DirBuild = Ireland;
  SelBut.add(SelIre);
  EndIre.DirBuild = Ireland;
  EndBut.add(EndIre);



  //a3
  //wick
  SelWick = new Button("Wick", 75, 490, 50, 10);
  EndWick = new Button("Wick", 200, 490, 50, 10);
  Wick = new Buildings();
  Wick1 = new Node(500, 445, 15);
  Wick.addDoor(Wick1);
  Locations.add(Wick);
  SelWick.DirBuild = Wick;
  SelBut.add(SelWick);
  EndWick.DirBuild = Wick;
  EndBut.add(EndWick);


  //carriage  
  SelCarr = new Button("Carriage", 75, 524, 50, 10);
  EndCarr = new Button("Carriage", 200, 524, 50, 10);
  Carriage = new Buildings();
  Carr1 = new Node(640, 465, 15);
  Carriage.addDoor(Carr1);
  Locations.add(Carriage);
  SelCarr.DirBuild = Carriage;
  SelBut.add(SelCarr);
  EndCarr.DirBuild = Carriage;
  EndBut.add(EndCarr);

  //foster
  SelFoster = new Button("Foster", 75, 558, 50, 10);
  EndFoster = new Button("Foster", 200, 558, 50, 10);
  Foster = new Buildings();
  Foster1 = new Node(540, 370, 15);
  Foster.addDoor(Foster1);
  Locations.add(Foster);
  SelFoster.DirBuild = Foster;
  SelBut.add(SelFoster);
  EndFoster.DirBuild = Foster;
  EndBut.add(EndFoster);



  //Lib
  SelLib = new Button("Library", 75, 592, 50, 10);
  EndLib = new Button("Library", 200, 592, 50, 10);
  Library = new Buildings();
  Lib1 = new Node(530, 280, 15);
  Library.addDoor(Lib1);
  Locations.add(Foster);
  SelLib.DirBuild = Library;
  SelBut.add(SelLib);
  EndLib.DirBuild = Library;
  EndBut.add(EndLib);

  //Aiken
  SelAik = new Button("Aiken", 75, 626, 50, 10);
  EndAik = new Button("Akien", 200, 629, 50, 10);
  Aiken = new Buildings();
  Aik1 = new Node(450, 250, 15);
  Aiken.addDoor(Aik1);
  Aik2 = new Node(410, 220, 15);
  Aiken.addDoor(Aik2);
  Locations.add(Aiken);
  SelAik.DirBuild = Aiken;
  SelBut.add(SelAik);
  EndAik.DirBuild = Aiken;
  EndBut.add(EndAik);


  //Schillhammer
  SelSchill = new Button("SchillHammer", 75, 660, 50, 10);
  EndSchill = new Button("SchillHammer", 200, 660, 50, 10);
  SchillHammer = new Buildings();
  Schill1 = new Node(635, 150, 15);
  SchillHammer.addDoor(Schill1);
  Locations.add(SchillHammer);
  SelSchill.DirBuild = SchillHammer;
  SelBut.add(SelSchill);
  EndSchill.DirBuild = SchillHammer;
  EndBut.add(EndSchill);


  //Presidents hall
  SelPres = new Button("President", 75, 694, 50, 10);
  EndPres = new Button("President", 200, 694, 50, 10);
  President = new Buildings();
  Pres1 = new Node(720, 150, 15);
  President.addDoor(Pres1);
  Locations.add(President);
  SelPres.DirBuild = President;
  SelBut.add(SelPres);
  EndPres.DirBuild = President;
  EndBut.add(EndPres);


  //outside - a-1
  Outside = new Buildings();    
  IDXWalkway = new Node(700, 820, 15);                                             //sidewalk intersections
  leftPearl = new Node(600, 845, 15);
  OutsidePearl = new Node(630, 840, 15);
  RightCushing= new Node(550, 845, 15);
  OutsideCushing = new Node(525, 845, 15);
  MainCenter = new Node(450, 845, 15);
  RightBader = new Node(400, 895, 15);
  OutsideBader = new Node(375, 895, 15);
  BotLeftCorner = new Node(305, 895, 15);
  LowerLeftStreet = new Node(305, 750, 15);
  BotStoneStairs = new Node(550, 740, 15);
  CCMDouble = new Node(340, 750, 15);
  //a-2
  TopStoneStairs = new Node(570, 620, 15);
  MiddleCommon = new Node(520, 580, 15);
  LeftCommon= new Node(450, 540, 15);
  TopCommon = new Node(460, 495, 15);
  TopRight = new Node(520, 490, 15);
  BehindJoyce = new Node(550, 480, 15);
  OutsideIreland = new Node(445, 480, 15);
  StreetCenter = new Node(305, 525, 15);
  CCMLeft = new Node(305, 625, 15);
  //a-3
  MidStairs = new Node(440, 450, 15);
  RightStairs = new Node(460, 440, 15);
  WickCorn = new Node(490, 440, 15);
  LowLeftIre = new Node(305, 475, 15);
  HighLeftIre = new Node(305, 390, 15);
  IreCorn = new Node(400, 440, 15);
  BelowAike = new Node(385, 315, 15);
  ThreeWayIter = new Node(520, 410, 15);
  RightWick = new Node(550, 440, 15);
  OutsideCarriage = new Node(570, 440, 15);
  OutsideFoster = new Node(520, 370, 15);
  OutsideLib = new Node(520, 315, 15);
  TopToplawn = new Node(470, 315, 15);
  RightAike = new Node(470, 250, 15);
  AikeDrive = new Node(410, 200, 15);
  TopRightAike = new Node(470, 200, 15);
  TopStreet = new Node(500, 110, 15);
  OutsideSchill = new Node(635, 110, 15);
  OutsidePres = new Node(720, 110, 15);
  TopLeftCorn = new Node(305, 110, 15);


  //a-1
  Outside.addDoor(IDXWalkway, leftPearl, OutsidePearl);                              //add the sidewalks to the sidewalk
  Outside.addDoor(RightCushing, OutsideCushing, MainCenter);
  Outside.addDoor(RightBader, OutsideBader, BotLeftCorner);
  Outside.addDoor(LowerLeftStreet, BotStoneStairs, CCMDouble);
  //a-2
  Outside.addDoor(TopStoneStairs, MiddleCommon, LeftCommon);
  Outside.addDoor(TopCommon, BehindJoyce, OutsideIreland);
  Outside.addDoor(StreetCenter, CCMLeft, TopRight);
  //a-3
  Outside.addDoor(MidStairs, RightStairs, WickCorn );
  Outside.addDoor(LowLeftIre, HighLeftIre, IreCorn );
  Outside.addDoor(BelowAike, ThreeWayIter, RightWick );
  Outside.addDoor(OutsideCarriage, OutsideFoster, OutsideLib );
  Outside.addDoor(TopToplawn, AikeDrive, RightAike);
  Outside.addDoor(TopRightAike, TopStreet, OutsideSchill );
  Outside.addDoor(OutsidePres, TopLeftCorn);

  Locations.add(Outside);                                                            //adding outside to the world


  //linking the intersctions - a-1
  IDXWalkway.LinkNode(OutsidePearl);
  OutsidePearl.LinkNode(leftPearl);
  leftPearl.LinkNode(RightCushing);
  leftPearl.LinkNode(BotStoneStairs);
  RightCushing.LinkNode(OutsideCushing);
  RightCushing.LinkNode(BotStoneStairs);
  OutsideCushing.LinkNode(MainCenter);
  MainCenter.LinkNode(CCM2);
  MainCenter.LinkNode(RightBader);
  RightBader.LinkNode(OutsideBader);
  OutsideBader.LinkNode(BotLeftCorner);
  BotLeftCorner.LinkNode(LowerLeftStreet);
  LowerLeftStreet.LinkNode(CCMDouble);
  CCMDouble.LinkNode(CCM2);
  CCM2.LinkNode(BotStoneStairs);
  //a-2
  TopStoneStairs.LinkNode(BotStoneStairs);
  TopStoneStairs.LinkNode(MiddleCommon);
  MiddleCommon.LinkNode(TopRight);
  MiddleCommon.LinkNode(LeftCommon);
  LeftCommon.LinkNode(TopCommon);
  LeftCommon.LinkNode(OutsideIreland);
  LeftCommon.LinkNode(StreetCenter);
  TopRight.LinkNode(TopCommon);
  TopRight.LinkNode(BehindJoyce);
  StreetCenter.LinkNode(CCMLeft);
  CCMLeft.LinkNode(LowerLeftStreet);
  //a-3
  LowLeftIre.LinkNode(StreetCenter);
  MidStairs.LinkNode(OutsideIreland);
  RightStairs.LinkNode(TopCommon);
  RightWick.LinkNode(BehindJoyce);
  RightWick.LinkNode(OutsideCarriage);
  HighLeftIre.LinkNode(LowLeftIre);
  MidStairs.LinkNode(RightStairs);
  MidStairs.LinkNode(IreCorn);
  RightStairs.LinkNode(WickCorn);
  WickCorn.LinkNode(ThreeWayIter);
  ThreeWayIter.LinkNode(OutsideFoster);
  ThreeWayIter.LinkNode(RightWick);
  OutsideFoster.LinkNode(OutsideLib);
  OutsideLib.LinkNode(TopToplawn);
  TopToplawn.LinkNode(BelowAike);
  BelowAike.LinkNode(IreCorn);
  TopToplawn.LinkNode(RightAike);
  RightAike.LinkNode(TopRightAike);
  TopRightAike.LinkNode(AikeDrive);
  AikeDrive.LinkNode(TopLeftCorn);
  TopRightAike.LinkNode(TopStreet);
  TopLeftCorn.LinkNode(HighLeftIre);
  TopStreet.LinkNode(OutsideSchill);
  OutsideSchill.LinkNode(OutsidePres);
  //oh my word, im done, thank god, only took me days


  //Linking Buildings to sidewalks - a-1
  CCM1.LinkNode(CCMDouble);
  CCM3.LinkNode(BotStoneStairs);
  Pearl1.LinkNode(OutsidePearl);
  Bader1.LinkNode(OutsideBader);
  Cushing1.LinkNode(OutsideCushing);
  IDX1.LinkNode(IDXWalkway);
  //a-2
  IDX2.LinkNode(Joy1);
  IDX2.LinkNode(Joy2);
  IDX2.LinkNode(TopStoneStairs);
  Joy1.LinkNode(TopStoneStairs);
  Joy2.LinkNode(TopStoneStairs);
  Joy3.LinkNode(TopStoneStairs);
  Free1.LinkNode(MiddleCommon);
  Free2.LinkNode(BehindJoyce);
  Alumn1.LinkNode(MiddleCommon);
  eats1.LinkNode(LeftCommon);
  eats2.LinkNode(LeftCommon);
  eats3.LinkNode(CCMLeft);
  Ire1.LinkNode(OutsideIreland);
  //a-3
  Wick1.LinkNode(WickCorn);
  Ire4.LinkNode(IreCorn);
  Carr1.LinkNode(OutsideCarriage);
  Foster1.LinkNode(OutsideFoster);
  Lib1.LinkNode(OutsideLib);
  Aik1.LinkNode(RightAike);
  Aik2.LinkNode(AikeDrive);
  Schill1.LinkNode(OutsideSchill);
  Pres1.LinkNode(OutsidePres);
  Ire2.LinkNode(LowLeftIre);
  Ire3.LinkNode(HighLeftIre);


  run = false;
  DrawNodes();
  textSize(30);
  text("where do you want to go?", width/2,40);
  textSize(14);  
  text("Starting Location", 75,120);
  text("Ending Location", 200,120);
}


void draw() {
  if (run == true) {
    DrawNodes();                                                                   //draw nodes
    ColorNodes();
    if (OpenSet.size() > 0) {
      print("working");
      int SmallestF = 0;
      for (int i = 0; i<OpenSet.size(); i++) {                                     //finds the smallest f value of the open set
        if (OpenSet.get(i).f < OpenSet.get(SmallestF).f) {
          SmallestF = i;
        }
      }
      Node current = OpenSet.get(SmallestF);
      if (current == end) {                                                        //check to see if we are at the end
        Node temp = current;
        Path.add(temp);
        while (temp.pre !=null) {                                                  //create the path of most efficint
          Path.add(temp.pre);
          temp = temp.pre;
        }
        DrawNodes();                                                               //draw the nodes
        ColorNodes();                                                              //draw the colored path before end
        if (temp.pre == null) {
          run = false;
          println("done");
        }
      }


      ClosedSet.add(current);                                                      //take the current node and move it to the closed set so we dont go back to it as a possible path
      OpenSet.remove(current);                                                     //its doing the same thing here its a two step process


      for (int i = 0; i< current.Links.size(); i++) {                              //scan though all node links to find neighbors or connected nodes
        Node neighbor = current.Links.get(i);                                      //neighbor is current focus
        if (ClosedSet.contains(neighbor)) {                                        //make sure we didnt close it
          continue;                                                                //if we did ignore
        }

        TempG = current.g + Dist_Between(current, neighbor);                       //calculate possible g score 

        if (!OpenSet.contains(neighbor)) {                                         //not in open set add to open set
          OpenSet.add(neighbor);
        } else if (TempG >= neighbor.g) {                                          //if the g is lower when found, that means it was found in a shorter route before 
          continue;                                                                //ignore
        }
        neighbor.g = TempG;                                                        //repalce g value
        neighbor.h = Dist_Between(neighbor, end);                                  //mesure heurisitc
        neighbor.f = neighbor.g + neighbor.h;                                      //calculate f
        neighbor.pre = current;                                                    //note where it moved from to get to this node
      }
    } else {
      println("no solution");                                                      //self explanitory
      run = false;
    }
  }
}


void mousePressed() {
  if (mouseY > 130 && mouseY < 700) { 
    if (mouseX < 120 && mouseX > 80) {                                            //check to see if mouse is in the left colom of buttons
      for (int i = 0; i < SelBut.size(); i++) {                                    //scan through all the left buttons
        if (SelBut.get(i).CheckClick(0, 255, 0) != SelBut.get(i).content) {       //if the check click dosnt return with sting of the corispoing content
          SelBut.get(i).deSelect();                                               //deselect it
        } else {
          StartHouse = SelBut.get(i).DirBuild;                                    //get the house of the selected button
        }
      }
    }
    if (mouseX < 300 && mouseX > 150) {
      for (int i = 0; i <EndBut.size(); i++) {                                    //scan through all the right buttons
        if (EndBut.get(i).CheckClick(255, 0, 0) != EndBut.get(i).content) {       //if the check click dosnt return with sting of the corispoing content
          EndBut.get(i).deSelect();                                               //deselect it
        } else {
          EndHouse = EndBut.get(i).DirBuild;                                      //get the house of the selected button
        }
      }
    }
  }
  
  if (mouseX > 100 && mouseX < 200 && mouseY < 840 && mouseY > 760) {             //if mouse is hovering over the run button
    print("RUN");
    for (int i = 0; i < Locations.size(); i++) {
      Locations.get(i).reset();                                                   //reset all the nodes
    }
    ClosedSet.clear();                                                            //clear the closedset
    OpenSet.clear();                                                              //clear the openset
    Path.clear();
    DrawNodes();                                                                  //draw white nodes
    ColorNodes();                                                                 //draw colored nodes(there should be node);
    if (StartHouse != null && EndHouse != null) {                                 //if the houses havnt been selected
      Node[] ans = BestDoor(StartHouse, EndHouse);                                //get the nodes
      start = ans[0];                                                             //just starting nodes
      end = ans[1];                                                               //get the goal node
      OpenSet.add(start);                                                         //add the starting noode to the openset
      run = true;                                                                 //tell ai to run
    } else {                                                                      //if the houses havnt been noted
      textSize(17);                                                               
      text("Click On and Starting and End Point", 150, 780);                      //error message for the user if they are bad
    }
  }
}



void DrawNodes() {
  for (int i = 0; i < Locations.size(); i++) {                                     //draw the nodes
    Locations.get(i).DrawDoors();
  }
}

void ColorNodes() {                                                                //color the nodes based on weather they are important
  for (int i = 0; i < OpenSet.size(); i++) {
    OpenSet.get(i).ReColorNodes(0, 255, 0);
  }
  for (int i = 0; i < ClosedSet.size(); i++) {
    ClosedSet.get(i).ReColorNodes(255, 0, 0);
  }
  for (int i = 0; i < Path.size(); i++) {
    Path.get(i).ReColorNodes(0, 0, 255);
  }
}



Node[] BestDoor (Buildings Build1, Buildings Build2) {
  float BestCombo = Dist_Between(Build1.doors.get(0), Build2.doors.get(0));
  int door1 = 0;
  int door2 = 0;
  for (int i = 0; i < Build1.doors.size(); i++) {
    for (int j = 0; j < Build2.doors.size(); j++) {
      if (Dist_Between(Build1.doors.get(i), Build2.doors.get(j)) <  BestCombo) {
        BestCombo =  Dist_Between(Build1.doors.get(i), Build2.doors.get(j));
        door1 = i;
        door2 = j;
      }
    }
  }
  Node[] BestDoors = {Build1.doors.get(door1), Build2.doors.get(door2)};
  return BestDoors;
}



float Dist_Between(Node Node1, Node Node2) {                                       //calc the distance between two nodes
  float val = sqrt(sq(Node1.x-Node2.x) + sq(Node1.y-Node2.y));
  return val;
}
