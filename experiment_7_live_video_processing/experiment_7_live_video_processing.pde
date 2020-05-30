import processing.video.*;    

Capture video; 

void setup(){
  size(600, 400);
  //println(Capture.list());  
  String[] cameras = Capture.list();
  if(cameras.length == 0){
    println("There are no cameras available for capture");
    exit();
  }else{
    println("Available cameras:");
    for(int i=0; i<cameras.length; i++){
      println(cameras[i]);
    }
    video = new Capture(this, cameras[0]);   
    video.start();   
    println("video width: "+ video.width);   
  }
}

void captureEvent(Capture video){
  video.read();   
}

//void mousePressed(){
//  video.read();   
//}


void draw(){ 
  background(0);
  
  //if(video.available()){
  //  video.read();   
  //}
  
  
  image(video, 0, 0, width, height);

}    
