class Box {
  PVector parent_Rotate;
  PVector rotate;
  Box babyBox;
  float strokeWei;
  color strokeColor=#000000;

  PVector ro_Vel=PVector.random2D().setMag(0.008);
  PVector counter_Vel=ro_Vel.copy().normalize().mult(-1);

  boolean Jiggling=false;
  PVector recoveryVec;

  boolean prev_Back=false;

  float boxSize=125;


  Box() {
    rotate=new PVector(-0.20339543, 0.608251, -1.5389652);
    strokeWei=5;
  }

  Box(String hier) {    
    if (hier=="parent") {
      rotate=new PVector(-0.20339543, 0.608251, -1.5389652);
      strokeWei=5;
      babyBox=new Box(ro_Vel);
    }
  }

  Box(PVector vel) {
    rotate=new PVector(-0.20339543, 0.608251, -1.5389652);
    strokeWei=2;
    strokeColor=color(#000000);
    ro_Vel=vel;
  }

  void check() {
    if (Jiggling==true) {
      run(recoveryVec);
      Jiggling=false;
    }
    if (backAccident==true&&prev_Back==false) {
      back();
    }
    prev_Back=backAccident;

    if (loudAccident==true) {
      Jiggling=true;
    } 

    if (babyBox!=null) {
      babyBox.check();
    }

    if (highAccident==true&&babyBox!=null) {
      babyBox.wander();
      babyBox.Jiggling=true;
    }
  }

  void back() {
    run(counter_Vel.setMag(0.2));
  }
  void wander() {
    run(PVector.random3D().setMag(random(0.06, 0.1)));
    boxSize+=0.3;
  }

  void run() {
    if (parent_Rotate!=null&&highAccident==false) {
      rotate.lerp(parent_Rotate, 0.1);
      boxSize=lerp(boxSize, 125, 0.1);
    }
    if (Jiggling) {
      recoveryVec=counter_Vel.setMag(random(0.1, 0.15));
      rotate.add(recoveryVec);
      recoveryVec.mult(-1);
    } else {
      rotate.add(ro_Vel);
    }    

    if (babyBox!=null) {
      babyBox.trace(rotate.copy());
      babyBox.run();
    }
  }

  void run(PVector tempVec) {
    rotate.add(tempVec);
  }

  void trace(PVector vec) {
    parent_Rotate=vec;
  }

  void show() { 
    pushMatrix();
    translate(width/2, height/2);
    noFill();
    stroke(strokeColor);
    strokeWeight(strokeWei);  
    rotateX(rotate.x);
    rotateY(rotate.y);
    rotateZ(rotate.z);
    box(boxSize);
    popMatrix();

    if (babyBox!=null) {
      babyBox.show();
    }
  }
}