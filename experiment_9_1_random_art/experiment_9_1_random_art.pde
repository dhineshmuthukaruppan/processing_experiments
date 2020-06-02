/*
  Author name: Dhinesh Muthukaruppan
  Date: 02/06/2020
*/


ArrayList<Walker> w; 

int count = 500;             


void setup(){
  size(800, 600);   
  w = new ArrayList<Walker>();         
  
  for(int x=0; x<count; x++){
    w.add(new Walker());     
  }

} // end of setup()

void draw(){
  
  for(int i=0; i<w.size(); i++){
    Walker current = w.get(i);    
    current.display();  
    current.move();    
  }   


} // end of draw()
