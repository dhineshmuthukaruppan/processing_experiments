float x = 0;   
float ending = 0; 

void setup(){
  
  size(600, 500);
  background(0);

} // end of setup


void draw(){
  stroke(255);
  strokeWeight(2);
  
  while(x < ending){
    x = x + 50;    
    line(x, 0, x, height);   
  }
  
  ending += 1;  
  
}  // end of draw
