PImage grasshopper;    

void setup(){
  size(800, 600);
  grasshopper = loadImage("grasshopper.jpg");  
  
}


void draw(){
  //image(grasshopper, 0, 0);    
  
  loadPixels();   
  grasshopper.loadPixels();   
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      int loc = x + y * width;   
      
      // change the pixels by half
      //pixels[loc] = grasshopper.pixels[loc] / 2;       
      
      float r = red(grasshopper.pixels[loc]);
      float g = green(grasshopper.pixels[loc]);
      float b = blue(grasshopper.pixels[loc]);
      float d = dist(mouseX, mouseY, x, y);
      //map(value,low1,high1,low2,high2)
      float factor = map(d, 0, 200, 2, 0);
      
      // changes for x > width/2
      //if(x > width/2){
      //  pixels[loc] = color(g, r, b * 2);    
      //}else{
      //  pixels[loc] = color(r, g, b);     
      //}
      
      // changes the brightness to maximum
      //pixels[loc] = color(r+mouseX, g+mouseX, b+mouseX);   
      
      // black and white
      //float brightness = brightness(grasshopper.pixels[loc]);
      //if(brightness > 100){ // mouseX
      //  pixels[loc] = color(255); 
      //}else{
      //  pixels[loc] = color(0);    
      //}
      
      
      // increase the brighness to double
      //pixels[loc] = color(r*2, g*2, b*2);           
      
      
      //torch light effect
      pixels[loc] = color(r*factor, g*factor, b*factor);    
      
      
    } // end of for y loop
  } // end of for x loop
  updatePixels(); 


} // end of draw()
