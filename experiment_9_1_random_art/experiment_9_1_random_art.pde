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


/*
  Notes:
  if( random(100) < 10 )  - 10% probability
  
  Gaussian distribution
  ---------------------
  import java.util.Random; 
  Random gen = new Random(); 
  float h = gen.nextGaussian();  // mean = 0, stdDeviation = 1 = which means it gives values from -1 to +1
  h *= stddev;    
  h = h + mean; 
  
  
  perlin noise
  ------------
  Returns the Perlin noise value at specified coordinates. Perlin noise is a random sequence generator producing a more natural, harmonic succession of numbers than that of the standard random() function. 
  
  float t = 0; 
  void draw(){
    t += 0.01; 
    float x = noise(t);
    x = map(x, 0, 1, 0, width);
    ellipse(x, height/2, 40, 40); 
  }
*/
