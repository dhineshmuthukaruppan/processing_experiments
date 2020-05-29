class Bubble{
  
  float x; 
  float y; 
  float diameter; 
  float ySpeed;    
  
  // rgb values are generated randomly once during the setup of initialization
  float r_value;
  float g_value; 
  float b_value;    
  
  
  Bubble(float x, float y, float diameter, float ySpeed, float r_value, float g_value, float b_value){
    this.x = x; 
    this.y = y; 
    this.diameter = diameter;  
    this.r_value = r_value; 
    this.g_value = g_value; 
    this.b_value = b_value;    
    this.ySpeed = ySpeed;    
    
  }
  
  
  void top(){
    if(y < -diameter/2){
      y = height + diameter/2; 
    }    
  } // end of top

  void display(){
    
    noStroke();   
    fill(r_value, g_value, b_value);    
    ellipse(x, y, diameter, diameter);       
  
  } // end of display()


  void ascend(){
    y = y - ySpeed;    
    x = x + random(-2, 2);     
  
  } // end of ascend()
  

} // end of class Bubble
