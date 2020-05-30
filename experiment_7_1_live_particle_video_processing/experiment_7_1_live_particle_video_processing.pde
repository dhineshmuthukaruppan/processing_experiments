import processing.video.*;
Particle[] particles;

//PImage video;
Capture video;

void setup() {
  size(640, 480);   

  video = new Capture(this, Capture.list()[0]);   
  video.start();
  particles = new Particle [3500];                          
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {

  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
}
