
import processing.video.*; 

Capture video; 

PImage prev; 

float lerpX = 0; 
float lerpY = 0; 


void setup(){
  size(640, 480);
  video = new Capture(this, Capture.list()[0]);
  video.start(); 
  prev = createImage(640, 480, RGB);      


}


void captureEvent(Capture video){
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);   
  prev.updatePixels();   
  video.read();    

}



void draw(){

  float threshhold = 60; 
  
  float avgX = 0; 
  float avgY = 0;   
  
  int count = 0; 
  
  float motionX = 0; 
  float motionY = 0; 
  

  
  video.loadPixels(); 
  prev.loadPixels();     
  
  loadPixels(); 
  
  for(int x=0; x<video.width; x++){
     for(int y=0; y<video.height; y++){
       int loc = x + y * video.width;    
       
        color currentColor =  video.pixels[loc];   
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        color prevColor = prev.pixels[loc];
        float r2 = red(prevColor);
        float g2 = green(prevColor);
        float b2 = blue(prevColor);

        float d = distSq(r1, g1, b1, r2, g2, b2);
        
        if(d > threshhold * threshhold){
          avgX += x; 
          avgY += y; 
          count++;   
          pixels[loc] = color(0, 0, 255);     
        
        }else{
          pixels[loc] = color(0, 255, 0);      
        }
       
     }
  } // end of for x loop 
  
  updatePixels();   
  
  if(count > 200){
    motionX = avgX / count; 
    motionY = avgY / count; 
  
  }
  
   
  lerpX = lerp(lerpX, motionX, 0.1); 
  lerpY = lerp(lerpY, motionY, 0.1); 
  
  fill(255, 0, 255);
  strokeWeight(2.0);
  stroke(0);
  ellipse(lerpX, lerpY, 36, 36);
  //ellipse(motionX, motionY, 30, 30);     

  textSize(18);     
  fill(255, 0, 0);          
  text("Threshhold - "+ threshhold, 10, 50);  
  text("Linear Interpolation - ( "+ lerpX + ", " + lerpY + " )", 10, 80);  
  
  
}


float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}
