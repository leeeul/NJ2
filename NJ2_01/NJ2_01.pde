//Name : NJ2_01 (homage to Manfred Mohr)
//Author : Lee Eul ( EZ )
//contact me at leeeulism@gmail.com or https://eullee.tumblr.com/

int frameWeight;

PVector rotate1;
PVector rotate2;

color strokeColor;
color frameColor;

void setup() {
  size(480, 640, P3D);
  smooth(8);
  strokeJoin(MITER);
  strokeCap(PROJECT);

  frameWeight=15;

  rotate1=PVector.random3D();
  rotate2=PVector.random3D();

  strokeColor=#000000;
  frameColor=#000000;
}

void draw() {
  background(246, 245, 232);

  pushMatrix();
  translate(width/2, height/2);
  noFill();
  stroke(strokeColor);
  strokeWeight(5);  
  rotateX(rotate1.x);
  rotateY(rotate1.y);
  rotateZ(rotate1.z);
  box(125);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  noFill();
  stroke(strokeColor);
  strokeWeight(1);  
  rotateX(rotate2.x);
  rotateY(rotate2.y);
  rotateZ(rotate2.z);
  box(125);
  popMatrix();

  beginShape();
  strokeWeight(frameWeight);
  stroke(frameColor);
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void keyPressed() {
  if (keyCode==' ') {
    rotate1=PVector.random3D();
    rotate2=PVector.random3D();
  }
  if (key=='s') {
    println("saveFrame");
    saveFrame("line-######.jpg");
  }
}