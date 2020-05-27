void setup(){

  size(600, 500);
  background(0);        
  
}

void draw(){

   for(int i=0; i<height; i=i+20){
    for(int j=0; j<width; j=j+20){    
      // j refers to x value and i refers to y value
        
      // forms pattern in the center
      //if(dist(width/2, height/2, j, i) > 200){    
      //  fill(random(0, 140));
      //}else{
      //  fill(random(140, 250));    
      //}
      
      // forms pattern according to the mouse position
      if(dist(mouseX, mouseY, j, i) > 200){    
        fill(random(0, 140));      
      }else{
        fill(random(140, 250));    
      }
      
      rect(j, i, 20, 20);      
    
    } // end of j loop
  } // end of i loop



} // end of draw 
