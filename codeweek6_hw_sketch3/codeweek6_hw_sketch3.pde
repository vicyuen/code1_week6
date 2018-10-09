// Code 1 FA_18
// Bryan Ma

// 2d arrays part 3

// this sketch uses a 2d array of floats, used to store values that will be used as 
//  angles for matrix transformations. it creates the array with random angles, 
//  then draws lines at those angles in the draw loop.

// change the sketch so that the angles in setup are mapped somehow to the value of 
//  i and/or j. then in the draw loop, change the value of the angle at every position
//  in the 2d array by some amount, to make each line rotate. (see the gif in this folder for an example)
// experiment with sizes, shapes, colors, and adding additional 2d arrays to create 
// more values to store, draw with, and modify at runtime. 

int gridW = 20;
int gridH = 20;
float[][] rotatingArr = new float[gridW][gridH];
float[][] angles = new float[gridW][gridH];
float[][] lineColor = new float [gridW][gridH];

void setup() {
  size(800, 800);
  stroke(255);
  for (int i = 0; i < gridW; i++) {
    for (int j = 0; j < gridH; j++) {
      angles[i][j] = map(i*j, 0, gridW*gridH, 0, 360);
      rotatingArr[i][j] = map(i*j, 0, gridW*gridH, 2, 200);
      lineColor[i][j] = map(i*j, 0, gridW*gridH, 0, 100);
    }
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < gridW; i++) {
    for (int j = 0; j < gridH; j++) {
      pushMatrix();
      translate(i * width/gridW, j * height/gridH);
      colorMode(HSB, 100);
      stroke(lineColor[i][j], 80, 100);
      angles[i][j] += rotatingArr[i][j];
      rotate(radians(angles[i][j]));
      line(-width/gridW*0.5, 0, width/gridW*0.5, 0);
      popMatrix();
    }
  }
}
