float x;      
float y; 
float speedX = random(1, 5);
float speedY = random(1, 5);            
float radius = 13;           

void setup(){
  // setup function will be called once
  
  
  size(600, 500);
  background(0);
  
  x= random(width);
  y = random(height);              
}


void draw(){

  // set parameters for drawing
  background(0);   
  fill(255);
  
  // Adjust the drawing parameters. Adjust the x and y such that circle is correctly rendered on the screen
  // correctly adjusted. If the ball's position and radius seems to exceed the wall, it is adjusted to correct value. 
  if(x-radius <= 0){
    x = radius;    
  }else if(x+radius >= width){
    x = width - radius;     
  }
  if(y-radius <= 0){
    y = radius; 
  }else if(y+radius >= height){
    y = height - radius; 
  }  
  
  
  
  // draw the object on the screen. 
  ellipse(x, y, radius*2, radius*2);       
  
 
 
  // bounce the ball if the ball hits the corner of the horizontal wall
  if((x + radius) >= width || (x - radius) <= 0){ 
    // this denotes that the ball hits the corner of the wall
    speedX *= -1;    
  }   
  // bounce the ball if the ball hits the corner of the vertical wall
  if(y+radius >= height || y-radius <= 0){
    speedY *= -1;    
  }
 
  
  
  // update the object's location 
  x = x + speedX; 
  y = y + speedY;    
  
  
} // end of draw()
