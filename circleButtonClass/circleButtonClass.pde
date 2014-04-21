ButCircle butCircle1, butCircle2 ;
//Boolean TEXT BOX UP OR NOT 
boolean boxUp;

float posY;


void setup(){
size(600, 600);
background(2);

//TEXT BOX ELEMENTS
  boxUp = true; 
  posY = 0;

//BUTTONS CIRCLE ELEMENTS
  butCircle1 = new ButCircle(100, 100, 50, "open");
  butCircle2 = new ButCircle(500, 100, 50, "close");

}//END SETUP 


void draw() {
  background(200);

  textBox(posY);

//BUTTONS
//
  butCircle1.display();

//  butCircle2.update();
  butCircle2.display();


}

