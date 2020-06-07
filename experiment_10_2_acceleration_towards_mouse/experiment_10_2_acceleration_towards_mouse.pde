/*
  Authorname: Dhinesh Muthukaruppan
  Date: 07/06/20
*/


ArrayList<Accelerator> a; 

int count = 2;                          


void setup(){
  size(800, 600); 
  a = new ArrayList<Accelerator>();   
  
  for(int i=0; i<count; i++){   
    a.add(new Accelerator());      
  }
  
}




void draw(){
  
  // set the general parameters for drawing
  //background(255, 255, 255, 0);                        
    
  
  for(int i=0; i<a.size(); i++){   
    Accelerator current = a.get(i);   
    
    // adjust the drawing parameters
    
    // draw the object
    current.display();   
    
    // checks any condition
    current.check(); 
        
    // update the drawing parameters    
    current.update();    
        
  }

} // end of draw()




class Accelerator{
  
  PVector position; 
  PVector velocity; 
  PVector acceleration;     
  float topSpeed;     
  color c; 
  float diameter; 

  Accelerator(){
    position = new PVector(random(width), random(height));    
    velocity = new PVector(0, 0);
    topSpeed = random(4, 6);                              
    c = color(random(255), random(255), random(255));      
    diameter = random(4, 6);                    
  }  

  void display(){
    noStroke(); 
    fill(c); 
    ellipse(position.x, position.y, diameter, diameter);          
  
  }
  
  void check(){
    // check whether it hits the wall. If it hits then let it pass through it and comes out of other edge
  
  }

  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, position);   
    
    
    // set the magnitude of acceleration
    // // magnitude 
    // // float m = mouse.mag(); // m = sqrt(x^2 + y^2); - right angled triangle after applying pythogoras theoram
    //acceleration.setMag(0.3);           
              //or
    // // normalize the vector - normalize() the vector to length/magnitude to 1 by adjusting x and y 
    // // mouse.x = mouse.x / m; 
    // // mouse.y = mouse.y / m;  
    acceleration.normalize();    
    acceleration.mult(0.3);                                                                         
    
    
    // velocity changes according to the acceleration  
    velocity.add(acceleration); 
    // limit the velocity by topSpeed
    velocity.limit(topSpeed);                         
    // adjust the position according to the velocity
    position.add(velocity); 
       
  
  }
  
} // end of Accelerator
