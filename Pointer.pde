class Pointer{
 public float x;
 public float y;
  public float size;
 

public Pointer(float x, float y,  float size){
this.x = x;
this.y = y;
this.size = size;
 
}

public void createPointer() {
  
  circle(this.x, this.y, this.size);
  
}


}
