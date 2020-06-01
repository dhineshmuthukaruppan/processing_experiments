/*

  R   G    B
  0  100  255
 200  50  255
--------------
200 50 0 =  250 - similarity score

float diff = dist(r1, g1, b1, r2, g2, b2);   

lerp function - linear interpolation
-------------------------------------
lerp(val1, val2, 0.3); = 30
val1= 0; 
val2= 100; 


x       targetx

- we can go to targetx from x using x=targetx
- but for smooth transition we have to use lerp function

interpolation
-------------
interpolation is an estimation of a value within two known values in a sequence of values. when graphical data contains a gap, but data is available on either side of the gap or at a few specific points within the gap, 
interpolation allows us to estimate the values within the gap. 

*/

// single pixel tracking

import processing.video.*; 

Capture video;   

// variable for color we are searching for
color trackColor;    

int threshhold = 20;   

void setup(){
  size(640, 480);
  video = new Capture(this, Capture.list()[0]);
  video.start();   
  trackColor = color(0, 0, 255); 
  
  
  
  //println(video.width); // 640
  //println(video.height); // 480
  
} // end of setup


void captureEvent(Capture video){
  video.read();   
} // end of captureEvent

void draw(){
  
  video.loadPixels();
  image(video, 0, 0);
  
  // we have to set the highValue to highnumber so that is easy for the first pixel to beat
  float highValue = 1000;     
  
  // XY coordinate of the closest color
  int closestX = 0; 
  int closestY = 0;
  
  for(int x=0; x<video.width; x++){
    for(int y=0; y<video.height; y++){
      int loc = x + y * video.width;   
      
      color currentColor = video.pixels[loc];   
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor); 
      float b2 = blue(trackColor);
      
      float d = dist(r1, g1, b1, r2, g2, b2); 
      
      if(d < highValue){
        highValue = d; 
        closestX = x; 
        closestY = y; 
      }
      
    }
  }  // end of for x loop 
  
  
  // we only consider the color found if it less than the threshhold value
  if(highValue < threshhold){
    // draw a circle at the tracked pixel
    fill(trackColor);
    strokeWeight(3);
    stroke(0); 
    ellipse(closestX, closestY, 25, 25);     
  }
  
  
  textSize(18);     
  fill(255, 0, 0);          
  text("Threshhold - "+ threshhold, 10, 50);  
  text("Tracked object - "+ red(trackColor) + ", "+ green(trackColor) + ", "+ blue(trackColor), 10, 80);        

} // end of draw()

void mousePressed(){
  // save color when mouse is pressed to the trackColor variable
  //int loc = mouseX + mouseY * video.width;  
  //trackColor = video.pixels[loc];   
  trackColor = video.get(mouseX, mouseY);   
  println(trackColor);    
}  
