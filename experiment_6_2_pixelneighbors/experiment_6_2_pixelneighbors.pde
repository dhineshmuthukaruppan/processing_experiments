//PImage grasshopper; 
PImage family; 

void setup(){
  //size(800, 600); 
  size(1152, 864);        
  //size(4608, 3456);    
  //grasshopper = loadImage("grasshopper.jpg");   
  family = loadImage("soorakudi.jpg");    // 4608 * 3456
  background(255);         
}


void draw(){
  
  for(int i=0; i<100; i++){                  
    float x = random(width);    
    float y = random(height);  
    
    //color c = grasshopper.get(int(x), int(y));
    color c = family.get(int(x*4), int(y*4));           
    
    //fill(c, 25); // including alpha 
    fill(c);             
    //noStroke();   
    ellipse(x, y, 4, 4);          
    
  } // end of for loop
   
  //image(family, 0, 0);   

} // end of draw
