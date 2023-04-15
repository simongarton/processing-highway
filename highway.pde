Freeway freeway;

void setup() {
  // can't use variables here, doh
  size(1000, 400);
  int width = 1000;
  int height = 400;
  freeway = new Freeway(width, height);
}

void draw() {
  background(50);
  freeway.run();
}

void mousePressed() {
  freeway.randomize();
}
