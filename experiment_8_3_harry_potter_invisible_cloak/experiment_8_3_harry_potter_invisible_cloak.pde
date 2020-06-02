
/*
  Author name: Dhinesh Muthukaruppan
  Date Created: 02/06/2020
*/

import processing.video.*;

Capture harryPotter; 
PImage snap; 

Boolean boolSnap = false;      

float threshold = 70;                

color trackClr;        

void setup(){
  size(640, 480);
  harryPotter = new Capture(this, Capture.list()[0]);
  harryPotter.start(); 
  snap = createImage(640, 480, RGB); 
  
  trackClr = color(0, 0, 255); 
  
  println(harryPotter.width);
  println(harryPotter.height);      

} // end of setup()

void keyPressed(){
  if(key == 's'){
      snap.copy(harryPotter, 0, 0, harryPotter.width, harryPotter.height, 0, 0, snap.width, snap.height);
      snap.updatePixels();    
      boolSnap = true;    
  }   
} // end of keyPressed()


void mousePressed(){
  trackClr = harryPotter.get(mouseX, mouseY);     
  
} // end of mousePressed

void captureEvent(Capture video){
  video.read();    

} // end of captureEvent()



void draw(){
  
  image(harryPotter, 0, 0);        

  harryPotter.loadPixels();   
  snap.loadPixels();   
  
  loadPixels();    
  
  for(int x=0; x<harryPotter.width; x++){
    for(int y=0; y<harryPotter.height; y++){    
      
       int location = x + y * harryPotter.width;    
       
       // get the current location pixel
       color currentPixel = harryPotter.pixels[location];
       float r1 = red(currentPixel); 
       float g1 = green(currentPixel);
       float b1 = blue(currentPixel); 
       //color snapPixel = snap.pixels[location]; 
       //float r2 = red(snapPixel); 
       //float g2 = green(snapPixel);
       //float b2 = blue(snapPixel);     
       float r2 = red(trackClr); 
       float g2 = green(trackClr);
       float b2 = blue(trackClr);    
       
       //float d = distanceSquare(r1, g1, b1, r2, g2, b2);   
       
       //if(d < threshold * threshold){
       //  // replace the current pixel with snap pixel
       //  pixels[location] = snap.pixels[location];   
       //}
       
       float d = dist(r1, g1, b1, r2, g2, b2);     
       
       if(d < threshold){
         // replace the current pixel with snap pixel
         pixels[location] = snap.pixels[location];   
       }
       
       
    
    } // end of for y loop
  } // end of for x loop 
  
  updatePixels();    
  
  
  textSize(18);     
  fill(255, 0, 0);          
  text("Threshhold - "+ threshold, 10, 50);  
  text("Snap - "+ boolSnap, 10, 80);         
  text("Tracked Object - "+ red(trackClr) + ", "+ green(trackClr) + ", "+ blue(trackClr), 10, 110);     
  
} // end of draw()

float distanceSquare(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;    
}
