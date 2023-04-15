class Lane {
  
  ArrayList<Vehicle> vehicles;
  boolean leftToRight;
  int laneLength;
  int laneWidth;
  int y;
  int speed;
  int vehicle_speed;
  
  int maxSize;
  int NEW_VEHICLE = 5;
  
  Lane(boolean leftToRight, int laneLength, int laneWidth, int y, int laneIndex, int laneCount, int maxSpeed) {
    this.leftToRight = leftToRight;
    this.laneLength = laneLength;
    this.laneWidth = laneWidth;
    this.vehicles = new ArrayList<Vehicle>();
    this.y = y;
    this.speed = int((random(maxSpeed) + maxSpeed) * (1.0 * (laneCount - laneIndex)/laneCount));
    this.vehicle_speed = this.leftToRight ? speed : -speed;
    this.maxSize = 10 + int(random(laneWidth * 5));
    
    addVehicle();
  }
  
  void run() {
    ArrayList<Vehicle> aliveVehicles = new ArrayList<Vehicle>();
    int leftVehicle = this.laneLength;
    int rightVehicle = 0;
    
    for (Vehicle vehicle : vehicles) {
      boolean alive = vehicle.move();
      vehicle.render();
      if (alive) {
        aliveVehicles.add(vehicle);
        if (vehicle.x < leftVehicle) {
          leftVehicle = vehicle.x;
        }
        if (vehicle.x > rightVehicle) {
          rightVehicle = vehicle.x;
        }
      }
    }
    vehicles.clear();
    vehicles.addAll(aliveVehicles);
    
    if (this.leftToRight) {
      if (leftVehicle > (2 * maxSize) && (int(random(NEW_VEHICLE)) == 0)) {
        addVehicle();
      }
    } else {
      if (rightVehicle < (this.laneLength - 2 * maxSize) && (int(random(NEW_VEHICLE)) == 0)) {
        addVehicle();
      }
    }
  }
  
  void addVehicle() {
    int size = int(10 + random(maxSize - 5));
    int x = leftToRight ? - (size * 2) : laneLength + (size * 2);
    
    vehicles.add(new Vehicle(x, y, size, vehicle_speed, laneLength, laneWidth));
  }
  
  void render() {
    // dashed lines not possible ?
    stroke(100, 100, 100);
    line(0, y - (laneWidth / 2), laneLength, y - (laneWidth / 2));
    line(0, y + (laneWidth / 2), laneLength, y + (laneWidth / 2));
  }
}
