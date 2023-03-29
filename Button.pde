enum ButtonType{
Sine,
Cosine,
Wave,
BouncingCircle

}

class Button {

public float x = 0;
public float y = 0; 
public float rHeight;
public float rWidth;
public  ButtonType buttonType;


public Button(ButtonType buttonType, float rHeight, float rWidth) {

this.buttonType = buttonType;
this.rHeight = rHeight;
this.rWidth = rWidth;

}

public void drawButton(){
  fill(0, 99, 197);
rect(this.x, this.y, this.rWidth, this.rHeight);

switch (this.buttonType){
case Sine:
  textSize(20);
  fill(255);
  text("Sine", x + 10, y + 20);
  
break;

case Cosine:

  textSize(20);
  fill(255);
  text("Cosine", x + 10, y + 20);

break;

case Wave: 
  textSize(20);
  fill(255);
  text("Wave", x + 10, y + 20);

break;

case BouncingCircle:
  textSize(20);
  fill(255);
  text("Circle", x + 10, y + 20);

break;

}
}

public boolean isOverButton(){ // checking mouse cordinates for rectangle button.
  if ((mouseX >= x && mouseX <= x+rWidth && 
      mouseY >= y && mouseY <= y+rHeight)) {
    return true;
  } else {
    return false;
  }
}

}
