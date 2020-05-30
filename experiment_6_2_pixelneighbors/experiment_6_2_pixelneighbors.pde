PImage grasshopper; 

void setup(){
  size(800, 600); 
  grasshopper = loadImage("grasshopper.jpg");   
  background(255);      
}


void draw(){
  
  for(int i=0; i<20; i++){  
    float x = random(width);
    float y = random(height);  
    
    color c = grasshopper.get(int(x), int(y));
    
    //fill(c, 25); // including alpha 
    fill(c);   
    //noStroke();
    ellipse(x, y, 8, 8);
    
  } // end of for loop
   

} // end of draw
