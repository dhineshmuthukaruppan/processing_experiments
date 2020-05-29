class Bubble{
  float x;
  float y; 
  float diameter;    
  
  Bubble(float diameter){
    x = width/2; 
    y= height;    
    this.diameter = diameter;     
    
  }
  
  void ascend(){
    y--;   
    x = x + random(-1, 1);    
  }
   
  
  void display(){
    stroke(0);
    fill(127);
    ellipse(x, y, diameter, diameter);       
  }
  
  void top(){
    if(y < diameter/2){
      y = diameter /2; 
    }
  }
  

} // end of bubble
