

private float pointerLineX2 = 0;
private float pointerLineY2 = 0;
private float teta = 0;

private float circleCenterX = 0;
private float circleCenterY = 0;

//pointer click variables
private boolean clickedOnPointer = false;
private boolean isDragging = false;

Pointer pointer = new Pointer(0, 0, 30);

BouncingCircle bouncingCircle = new BouncingCircle(ScaleWave.Cosine, 0, 0);

Button sineBtn = new Button(ButtonType.Sine, 30, 75);
Button cosineBtn = new Button(ButtonType.Cosine, 30, 75);
Button waveBtn = new Button(ButtonType.Wave, 30, 75);
Button circleBtn = new Button(ButtonType.BouncingCircle, 30, 75);

// waves variables

int xspacing = 20;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;



void setup() {
  fullScreen();
  background(255);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  circleCenterY = height * 2 / 6 ;
  circleCenterX = width * 3 / 8 ;
  



sineBtn.x = circleCenterX + 400;
sineBtn.y =  40;

cosineBtn.x = sineBtn.x  + sineBtn.rWidth + 20;
cosineBtn.y = sineBtn.y;

waveBtn.x = sineBtn.x;
waveBtn.y = sineBtn.rHeight + 40 + 20;

circleBtn.x = waveBtn.x + waveBtn.rWidth + 20;
circleBtn.y = waveBtn.y;


}

void draw() {
  stroke(0);
  strokeWeight(4);
  background(255);

  float mouseDx = mouseX - circleCenterX;
  float mouseDy = mouseY - circleCenterY;
  float distance = sqrt(sq(mouseDx)+sq(mouseDy));

  circleCenterY = height * 2 / 6 ;
  circleCenterX = width * 3 / 8 ;

  pointerLineX2 = circleCenterX + (cos(teta) * (width * 3 / 20)); //r*cos(teta) + distance from (0,0)
  pointerLineY2 = circleCenterY + (sin(teta) * (width * 3 / 20)); // r*sin(teta) + distance from (0,0)

  createTrinagluarCircle();

  //pointer line : x1 y1 are circle center
  line(circleCenterX, circleCenterY, pointerLineX2, pointerLineY2);

  // cosine line
  stroke(255, 0, 0);
  line(circleCenterX, circleCenterY, pointerLineX2, circleCenterY );

  // sine line
  stroke(102, 178, 255);
  line(circleCenterX, circleCenterY, circleCenterX, pointerLineY2 );

  setUpPointer();

  clickedOnPointer = (dist(mouseX, mouseY, pointerLineX2, pointerLineY2) < 15) && mousePressed;

  // its clicking inside pointer (pressing)


  if (clickedOnPointer || isDragging ) {
    isDragging = true;
    if (distance > width * 3 / 20 ) {
      mouseDx = (mouseDx / distance) * (width * 3 / 20);
      mouseDy = (mouseDy / distance) * (width * 3 / 20);
      teta = atan2(mouseDy, mouseDx);
    } else {
      teta = atan2(mouseDy, mouseDx);
    }

    pointer.x = circleCenterX + (width * 3 / 20) * cos(teta);
    pointer.y = circleCenterY + (width * 3 / 20) * sin(teta);

    if (! mousePressed ) {
      isDragging = false;
    }
  }
  
  bouncingCircle.x = (circleCenterX + width * 3 / 10) + 125;
  bouncingCircle.y = circleCenterY;
  fill(0,102,204);
  noStroke();
  bouncingCircle.drawCircle();
  
  setupWave();
  drawWave();
  
  sineBtn.drawButton();
  cosineBtn.drawButton();
  waveBtn.drawButton();
  circleBtn.drawButton();
  
  
  
  
  
}
 void createTrinagluarCircle() {
  line(0, 2 * height / 3, width, 2 * height / 3);
  noFill();
  circle( width * 3 / 8, height * 2 / 6, width * 3 / 10);
  line((width * 3 / 8), 30, (width * 3 / 8), (150 + (width * 3 / 10)));
  line( 250, height * 2 / 6, 400 + (width * 3 / 10), height * 2 / 6 );
  textSize(20);
  fill(0);
  text("Sin", (width * 3 / 8) + 20, 40);
  fill(0);
  textSize(20);
  text("Cos", 420 + (width * 3 / 10), height * 2 / 6);
}


 void setUpPointer() {
  noStroke();
  fill(0,128,255);
  pointer.x = pointerLineX2;
  pointer.y = pointerLineY2;
  pointer.createPointer();
}

//public void drawGuidline(){
  
//  stroke(0);
//  fill(125);
//  line(pointer.x, pointer.y, circleCenterX, ); // sine line
//  line(poiner.x, pointer.y, , );    // cosine line
//}

  void setupWave(){

  float x = 0;
  theta += 0.02;

  // For every x value, calculate a y value with sine function
   x = theta ;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
  
  }

void drawWave(){
noStroke();
  fill(0,102,204);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 1; x < yvalues.length; x++) {
    stroke(0);
    line(x*xspacing, (2 * height / 3)+ yvalues[x] + 120, x*xspacing, 800);
    noStroke();
    circle(x*xspacing, (2 * height / 3) + yvalues[x] + 120, 16);

  }
}