//Name : NJ2_04 (homage to Manfred Mohr)
//Author : Lee Eul ( EZ )
//contact me at leeeulism@gmail.com or https://eullee.tumblr.com/
import com.hamoid.*;

VideoExport videoExport;

float movieFPS = 60;

int frameWeight;
color strokeColor;
color frameColor;

PVector ro_Vel;
PVector counter_Vel;

boolean loudAccident=false;
boolean highAccident=false;
boolean backAccident=false;

Box box;

void setup() {
  size(480, 640, P3D);
  smooth(8);

  strokeJoin(MITER);
  strokeCap(PROJECT);

  frameWeight=15;
  frameColor=#000000;

  box=new Box("parent");
  background(246, 245, 232);

  videoExport = new VideoExport(this);
  videoExport.setFrameRate(movieFPS); 
  //videoExport.startMovie();
}

void draw() {
  background(246, 245, 232);
  //background(255);

  if (keyPressed) {
    if (key=='l') {
      loudAccident=true;
    }
    if (key=='h') {
      highAccident=true;
    }
    if (key=='b') {
      backAccident =true;
    }
  }

  box.check();
  box.run();
  box.show();

  frame(frameWeight, frameColor);

  videoExport.saveFrame();

  if (key=='z') {
    videoExport.endMovie(); 
    exit();
  }
}

void frame(float wei, color col) {
  beginShape();
  strokeWeight(wei);
  stroke(col);
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void keyReleased() {
  loudAccident=false;
  highAccident=false;
  backAccident=false;
}