import processing.video.*; 

Capture video;   

int x = 0;   

void setup(){
  size(640, 480);   
  video = new Capture(this, Capture.list()[0]);   
  video.start();   

}

void captureEvent(Capture video){
  video.read();   
}


void draw(){
  //image(video, 0, 0);   
  int w = video.width;   
  int h = video.height;   
  // copy(src, sx, sy, sw, sh, dx, dy, dw, wh);
  copy(video, w/2, 0, 1, h, x, 0, 1, h);
  
  x = x + 1;  
  if(x > width){
    x = 0; 
  }   

}
