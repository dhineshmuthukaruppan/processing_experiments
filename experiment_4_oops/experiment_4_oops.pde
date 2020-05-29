Bubble b1; 

void setup(){
  size(600, 400);
  b1 = new Bubble(64);       
}


void draw(){
  // adjust/set  the general parameter 
  adjust();  
  
  // adjust the object parameter before display     
  b1.top();    
  
  // display the object
  b1.display();   
  
  
  // conditions to check if any
  
  
  // update the parameter for next round
  b1.ascend();    

}


void adjust(){
  background(0);    
}
