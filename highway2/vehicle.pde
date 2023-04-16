class Vehicle {
  
  int x;
  int y;
  int size;
  int speed;
  int intendedSpeed;
  int laneLength;
  int laneWidth;
  boolean batMobile = false;
  int life = 0;
  int distanceToNextVehicle;
  int lengthOfNextVehicle;
  int speedOfNextVehicle;
  boolean leftToRight;
  
  int GAP = 4;
  
  Vehicle(int x, int y, int size, int speed, int laneLength, int laneWidth) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.intendedSpeed = speed;
    this.speed = speed;
    this.laneLength = laneLength;
    this.laneWidth = laneWidth;
    this.leftToRight = (speed > 0);
    if (int(random(1000)) == 0 && size < 50) {
      this.batMobile = true;
    }
  }
  
  boolean move() {
    this.x = this.x + this.speed;
    if (speed > 0) {
      if (this.x > (this.laneLength + (this.size * 2))) {
        return false;
      }
      return true;
    }
    if (this.x < (0 - (this.size * 2))) {
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
  
  void updatePosition(int distanceToNextVehicle, int lengthOfNextVehicle, int speedOfNextVehicle) {
    this.distanceToNextVehicle = distanceToNextVehicle;
    this.lengthOfNextVehicle = lengthOfNextVehicle;
    this.speedOfNextVehicle = speedOfNextVehicle;
  }
  
  void drive() {
    this.updateIntendedSpeed();
    this.matchIntendedSpeed();
  }
  
  void matchIntendedSpeed() {
    // if too fast, slow down
    if (this.speed > this.intendedSpeed) {
      this.speed = this.speed - 1;
      return;
    }
    
    // if too slow, speed up
    if (this.speed < this.intendedSpeed) {
      this.speed = this.speed + 1;
      return;
    }  
  }
  
  void maybeChangeSpeed() {
    if ((int(random(10)) == 0)) {
      int delta = this.leftToRight ? int(random(5)) : -int(random(5));
      this.intendedSpeed  = this.intendedSpeed + ((int(random(2)) == 0) ? delta : -delta);       
      if (this.leftToRight) {
        if (this.intendedSpeed < 1) {
          this.intendedSpeed = 1;
        }
      } else {
        if (this.intendedSpeed > -1) {
          this.intendedSpeed = -1;
        }  
      }
    }
  }
  
  void updateIntendedSpeed() {
    // if I'm the front car, what the hell.
    if (this.distanceToNextVehicle == -1) {
      this.maybeChangeSpeed();
      return;
    }
    // if I'm getting too close, slow down
    int delta = this.leftToRight ? this.speed : -this.speed;
    if (this.distanceToNextVehicle < (delta * 2+ this.lengthOfNextVehicle + this.size)) {
      if (leftToRight) {
        if (this.intendedSpeed > this.speedOfNextVehicle) {
          this.intendedSpeed = this.speedOfNextVehicle;
          this.speed = this.speedOfNextVehicle;
        }
      } else {
        if (this.intendedSpeed < this.speedOfNextVehicle) {
          this.intendedSpeed = this.speedOfNextVehicle;
          this.speed = this.speedOfNextVehicle;
        }
      }
      return;
    }
    
    // if I'm getting too close, slow down
    if (this.distanceToNextVehicle < (delta + this.lengthOfNextVehicle + this.size)) {
      if (leftToRight) {
        if (this.intendedSpeed > this.speedOfNextVehicle) {
          this.intendedSpeed = this.speedOfNextVehicle;
        }
      } else {
        if (this.intendedSpeed < this.speedOfNextVehicle) {
          this.intendedSpeed = this.speedOfNextVehicle;
        }
      }
      return;
    }
    
    // if I'm cruising consider if I shouldz randomly change speed
    if (this.speed == this.intendedSpeed) {
      this.maybeChangeSpeed();
      return;
    }
  }
  
  void renderBatmobile() {
      fill(0, 0, 0);
      stroke(250, 250, 250);
      rect(x - (size/2), this.y - (laneWidth / 2) + GAP, size, laneWidth - (2 * GAP));
  }
  
}
