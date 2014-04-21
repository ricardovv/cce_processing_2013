

class ButCircle {
  String text;
  float tw; 
  int circX, circY;  // Ellipse Button Pos
  int circSize;// Ellipse diameter
  color botColorNormal;
  color botColorOver;
  color botColorPressed;
  color botCurrentColor;
  boolean botOver;


  //CONSTUCTOR
  ButCircle(int _x, int _y, int _size, String _t) {
    text = _t;
    tw = textWidth(text);
    circX = _x;
    circY = _y;
    circSize = _size + int(tw/2); 
    botColorNormal = color(30);
    botColorOver = color(100);
    botColorPressed = color(200, 0, 0);
    botCurrentColor = color(0);
    botOver = false;
  }//COONSTRUCTOR ENDS


  //METHODS
  //CHECK IF IS OVER OR NOT
  void display() {

    //update 
    if ( overCircle(circX, circY, circSize) ) {
      botOver = true;
    } else {
      botOver = false;
    }//end update 

      //change color button
    if (botOver) {
      if (mousePressed == true) {         
        botCurrentColor = botColorPressed;
        //select button
        if (text == "close") { boxUp = false; }
        if (text == "open") { boxUp = true; }
      } else {
        botCurrentColor = botColorOver;
      }//mousePressed end
    }//if (botOver) END
    //Set nor al color state
    else { 
      botCurrentColor = botColorNormal;
    }

    //ELLIPSE GRAPHICS
    fill(botCurrentColor); 
    noStroke();
    ellipseMode(CENTER);
    ellipse(circX, circY, circSize, circSize);
    //TEXT BUTTON
    fill(250);
    textAlign(CENTER); 
    textSize(14);
    text(text, circX, circY+4);

  }//DISPLAY END


  //CHECK IF IS INSIDE
  boolean overCircle(int x, int y, int diameter) {  
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }//overCircle

}//CLASS CLOSE


void textBox(float _posY) {
  //  float posY =_posY;
  if (boxUp) {
    posY = lerp(posY, 100, .1);
  }
  else {
    posY = lerp(posY, 600, .1);
  }
  pushMatrix();
  translate(0, posY);
  rect(50, 0, 500, 400);
  popMatrix();
}//CLOSE textBox

