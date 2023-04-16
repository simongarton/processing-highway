Freeway freeway;

void setup() {
  // can't use variables here, doh
  size(1400, 800);
  int width = 1400;
  int height = 800;
  freeway = new Freeway(width, height);
}

void draw() {
  background(50);
  freeway.run();
}

void mousePressed() {
  freeway.randomize();
}
