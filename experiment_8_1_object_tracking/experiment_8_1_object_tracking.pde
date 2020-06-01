

// Average pixel tracking

import processing.video.*;     

Capture video;   

// variable for color we are searching for
color trackColor;    

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
  
  int threshhold = 25;   
  float avgX = 0; 
  float avgY = 0; 
  int count = 0; 
    
  video.loadPixels();
  image(video, 0, 0);
  
  
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
      
      float d = distSq(r1, g1, b1, r2, g2, b2);   
      
      if(d < threshhold * threshhold){     
         //stroke(255);
         //strokeWeight(1);
         //point(x, y);
         avgX += x; 
         avgY += y; 
         count++;    
        
      }
      
    }
  }  // end of for x loop 
  
  println(count);    
  
  if(count > 0){   
    avgX = avgX / count; 
    avgY = avgY / count; 
    
    // Draw a circle at the tracked pixel
    fill(trackColor);   
    //noFill();   
    strokeWeight(3);
    stroke(0);
    ellipse(avgX, avgY, 24, 24);    
  
  }
  
  
  textSize(18);     
  fill(255, 0, 0);          
  text("Threshhold - "+ threshhold, 10, 50);  
  text("Tracked object - "+ red(trackColor) + ", "+ green(trackColor) + ", "+ blue(trackColor), 10, 80);        
  text("Object location - ( "+ int(avgX) + ", "+ int(avgY) + " )", 10, 110);      
} // end of draw()


float distSq(float x1, float y1, float z1, float x2, float y2, float z2){
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);   
  return d; 
}


void mousePressed(){
  // save color when mouse is pressed to the trackColor variable
  //int loc = mouseX + mouseY * video.width;  
  //trackColor = video.pixels[loc];   
  trackColor = video.get(mouseX, mouseY);   
  println(trackColor);    
}  
