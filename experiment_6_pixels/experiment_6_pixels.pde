

color[] c;  


void setup(){
  size(600,600);
  c = new color[width];    
  
  int r = 0; 
  int g = 85;
  int b = 170;     
  
  for(int i=0; i<width; i++){
    c[i] = color(r, g, b);   
    r++; 
    g++; 
    b++; 
    if(r > 255){
      r = 0; 
    }
    if(g > 255){
      g = 0; 
    }
    if(b > 255){
      b = 0;   
    }
  }
}




void draw(){
  
  // mouse move color change pattern
  loadPixels();
  for(int x=0; x<width; x++){
    
    color currentcolor = c[x]; 
    if(x == mouseX){
      //println(get(x, 0));           
      //println(pixels[x]);    
      
      
      // modifies the existing color
      //color tempColor = pixels[x];
      //float red = (red(tempColor) + 1) % 255;   
      //float green = (green(tempColor) + 1) % 255;
      //float blue = (blue(tempColor) + 1) % 255;                
      
      
      // covers everything with blue
      //float red = random(0, 85) ;          
      //float green = random(85, 170);
      //float blue = random(170, 255);     
      
      // random everything 
      //float red = random(0, 255);               
      //float green = random(0, 255);
      //float blue = random(0, 255);         
      
      // black cover
      float red = 0;
      float green = 0; 
      float blue = 0;   
      
      currentcolor = color(red, green, blue);              
      c[x] = currentcolor;      
    }    
    
    for(int y=0; y<height; y++){
      int loc = x + y * width; 
      pixels[loc] = currentcolor;                       
    }
  }
  updatePixels();   
  
  
  // dynamic color circle around mouse position
  //loadPixels();   
  //for(int x=0; x<width; x++){
  //  for(int y=0; y<height; y++){
  //    float d = dist(x, y, mouseX, mouseY);        
  //    //println(d);  
  //    int loc = x + y * width; 
  //    pixels[loc] = color(d);            
      
  //  }
  //}
  //updatePixels();   
  // end of dynamic color circle around mouse position
  
  
  
  //// vertical black- white pattern
  //loadPixels();   
  
  //for(int x=0; x<width; x++){
  //  int r = x * 2 % 255; 
  //  int g = x * 3 % 255; 
  //  int b = x * 4 % 255; 
  //  color c = color(r, g, b);  
    
  //  for(int y=0; y<height; y++){   
  //    int loc = x + y * width; 
  //    //int colornum = x % 255;    
  //    //pixels[loc] = color(colornum, colornum, colornum);                  
  //    pixels[loc] =  c; 
  //  }
  //}
  //updatePixels();   
 
  
}


// static black - white circle
//loadPixels();   

//for(int x=0; x<width; x++){
//  for(int y=0; y<height; y++){
//    float d = dist(x, y, width/2, height/2);   
//    //println(d);
//    int loc = x + y * width; 
//    pixels[loc] = color(d);            
    
//  }
//}
//updatePixels();   
// end of static color circle
