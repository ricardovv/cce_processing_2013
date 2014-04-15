float lerpFactor = 0.05; 

float x1 = 100;
float x2 = x1 + 100;
float x3 = x2 + 200;
float xCurrent = x1;
int y = 250;
int sz = 20;

void setup () {
  size(500, 500);
  background(100);
}


void draw () {
  background(100);

  if (keyPressed == true) {
    // 1
    if (key == '1') {
      xCurrent = lerp(xCurrent, x1, lerpFactor);
    }
    // 2
    if (key == '2') {
      xCurrent = lerp(xCurrent, x2, lerpFactor);
    }

    // 3
    if (key == '3') {
      xCurrent = lerp(xCurrent, x3, lerpFactor);
    }

  }
    fill(200);
    rect(xCurrent, y, sz, sz);

    rect(xCurrent, y, sz, sz);


}

