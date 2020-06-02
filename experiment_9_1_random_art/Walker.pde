class Walker{

  float x; 
  float y; 
  
  color clr; 
  
  Walker(){
     x = random(width - 1);    
     y = random(height - 1);       
     clr = color(random(255), random(255), random(255));        
  }
 
  
  void display(){
    stroke(clr);    
    point(x, y);     
  
  } // end of display()
  
  void move(){
    int ch = int(random(4));   
    
    if(ch == 0){
      x++; 
    }else if(ch == 1){
      x--;
    }else if(ch == 2){
      y++;
    }else{
      y--;   
    }  
    
    x = constrain(x, 0, width - 1); 
    y = constrain(y, 0, height - 1);    
  
  } // end of move()
  
 
  



} // end of Walker
