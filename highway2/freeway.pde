class Freeway {
  
  ArrayList<Lane> lanes;
  int width;
  int height;
  int midPoint;

  Freeway(int width, int height) {
    lanes = new ArrayList<Lane>();
    this.width = width;
    this.height = height;
    
    randomize();
  }
  
  void randomize() {
    int maxSpeed = int(random(19)) + 1;
    lanes.clear();
    int laneWidth = 10 + int(random(40));
    int laneCount = height / laneWidth;
    this.midPoint = height / 2;
    
    for (int i = 0; i < (laneCount / 2); i++) {
      lanes.add(new Lane(true, width, laneWidth, midPoint - (laneWidth / 2) - (laneWidth * i), i, laneCount, maxSpeed));
      lanes.add(new Lane(false, width, laneWidth, midPoint + (laneWidth / 2) + (laneWidth * i), i, laneCount, maxSpeed));
    }
  }    

  void run() {
    for (Lane lane : lanes) {
      lane.render();
    }
    stroke(250, 250, 250);
    line(0, this.midPoint, this.width, this.midPoint);
    for (Lane lane : lanes) {
      lane.run();
    }
  }

}
