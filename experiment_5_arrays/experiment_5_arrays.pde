Bubble[] bubbles = new Bubble[20];          

int total = 1;        

void setup(){
  size(800, 600);   

  for(int i=0; i<bubbles.length; i++){
    //new Bubble(x, y, diameter, ySpeed, r_value, g_value, b_value);      
    bubbles[i] = new Bubble(random(width), random(height), random(5, 60), random(1, 4), random(255), random(255), random(255));         
  }

}


void draw(){
  
  // adjust/set the general parameter
  adjust();   
  
  for(int i=0; i<total; i++){
    // adjust the object parameter before display
    bubbles[i].top();
    
    // display the object
    bubbles[i].display();    
    
    // conditions to check if any
    
    // update the parameters for next round
    bubbles[i].ascend();    
  }


} // end of draw

void adjust(){
  background(255);           
}

void mousePressed(){
  total++;    
  
  if(total > 20){
    total = 20;       
    println("trying to exceed 20 baloons");
  }  
  
  println(total + " baloons are there. ");
  
} // end of mousePressed


void keyPressed(){
  total--;   
  
  if(total < 1){
    total = 1;   
  }    

  println(total + " baloons are there. ");

} // end of keyPressed
