 

void setup(){

  size(600, 500); 
}



void draw(){

  background(255);
  strokeWeight(2);
  stroke(0);
  noFill(); 
  
  translate(width/2, height/2);
  ellipse(0, 0, 4, 4);
  
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  
  // Vector subtraction
  mouse.sub(center);  
  //mouse.mult(0.5);  
  

  
  // magnitude 
  //float m = mouse.mag(); // m = sqrt(x^2 + y^2); - right angled triangle after applying pythogoras theoram
  //fill(255, 0, 0);
  //rect(0, 0, m, 20);  
   
  
  // normalize the vector - normalize() the vector to length/magnitude to 1 by adjusting x and y 
  // // mouse.x = mouse.x / m; 
  // // mouse.y = mouse.y / m;   
  mouse.normalize();    
  mouse.mult(50);    
  //mouse.setMag(50); // combinined command for above 2 commands
  
  line(0, 0, mouse.x, mouse.y); 
}











/*

  PVector location; 
  location = new PVector(100, 50);     

  class Ball{
    PVector location; 
    PVector velocity; 
    PVector acceleration; 
    float topSpeed;
    
    Ball(){
      location = new PVector(width/2, height/2); // x, y
      velocity = new PVector(0, 2); // xspeed, yspeed   
      acceleration = new PVector(0.01, 0); // X acceleration, Y acceleration  
      topSpeed = 10;   
    } 
    
    void move(){   
      // acceleration = PVector.random2D(); // random acceleration
      // acceleration.mult(random(2));    
      
      
      velocity.add(acceleration);     
      velocity.limit(topSpeed);  
      location.add(velocity);   
      
     
      
      // // x += xspeed; 
      // // y+= yspeed; 
    }
    void bounce(){
      if((location.x > width) || (location.x < 0)){
        velocity.x = velocity.x * -1; 
      }
      // same for location.y and velocity.y
      
    }
    
    void display(){
      // draw an ellipse
    }      
  }


  vector math
  -----------
  add() = w = v + u
  mult() 
  mag() 
  normalize()    
  
  location + velocity = new location
  new location - prev location = velocity
  
  - vectors don't have a place and it just describe magnitude and direction
  
  acceleration 
  ------------
  - constant acceleration 
  - random acceleration
  

*/
