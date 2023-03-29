enum ScaleWave {
    Sine,
    Cosine;
}

class BouncingCircle {

public float diameter = 150;

public ScaleWave scaleWave = ScaleWave.Sine;

public float x;

public float y;

public float amplitude = 75.0;

public float angle = 0 ;

public BouncingCircle( ScaleWave scaleWave, float x, float y){
  
  this.scaleWave = scaleWave;
  this.x = x;
  this.y = y;
  
} 

public void drawCircle(){
  
  float scaledDiameterSine = 40 + (sin(angle) * this.diameter/2) + this.diameter/2 ;
  float scaledDiameterCosine = 40 + (cos(angle) * this.diameter/2) + this.diameter/2 ; 
  
  
switch (this.scaleWave){
  
  case Sine :
  circle(x,y,scaledDiameterSine);
  break;
  
  case Cosine : 
   circle(x,y,scaledDiameterCosine);
  break;
}
  angle += 0.02;
}


}
