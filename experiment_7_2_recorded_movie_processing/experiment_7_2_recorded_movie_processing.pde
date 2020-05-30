import processing.video.*; 

Movie video; 

void setup(){
  
  size(480, 270);   
  video = new Movie(this, "video.mov");     
  video.loop();  
  
}


void movieEvent(Movie video){  
  video.read();       

}

//void mousePressed(){
//  video.jump(3);   
//}


void draw(){
  float r = map(mouseX, 0, width, 0, 4);  
  video.speed(r);     
  image(video, 0, 0);   
}
