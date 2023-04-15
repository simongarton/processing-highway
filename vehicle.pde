class Vehicle {
  
  int x;
  int y;
  int size;
  int speed;
  int laneLength;
  int laneWidth;
  boolean batMobile = false;
  int life = 0;
  
  int GAP = 4;
  
  Vehicle(int x, int y, int size, int speed, int laneLength, int laneWidth) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
    this.laneLength = laneLength;
    this.laneWidth = laneWidth;
    if (int(random(1000)) == 0 && size < 50) {
      this.batMobile = true;
    }
  }
  
  boolean move() {
    this.x = this.x + this.speed;
    if (speed > 0) {
      if (this.x > (this.laneLength + (speed * 2))) {
        return false;
      }
      return true;
    }
    if (this.x < (0 - (speed * 2))) {
      return false;
    }
    return true;
  }
  
  void render() {
    life = life + 1;
    if (this.batMobile) {
      renderBatmobile();
    } else {
      fill(200, 200, 200);
      stroke(250, 250, 250);
      rect(x - (size/2), this.y - (laneWidth / 2) + GAP, size, laneWidth - (2 * GAP));
    }
  }
  
  void renderBatmobile() {
      fill(0, 0, 0);
      if (life % 50 < 25) {
        fill(200, 0, 0);
      }
      stroke(250, 250, 250);
      rect(x - (size/2), this.y - (laneWidth / 2) + GAP, size, laneWidth - (2 * GAP));
  }
  
}
