import processing .opengl.*;
MouseCamera mouseCamera;
void setup() {
  size(1200,1200,P3D);
  lights();
  mouseCamera = new MouseCamera(800.0, 0, 1500, (height/2.0)/tan(PI*30.0/180.0), 0, 0, 0, 0, 1, 0); // MouseCameraの生成
  draw();
}

float baseW = 200;
float baseD = 200;
float baseH = 100;

float arm1W = 70;
float arm1D = 100;
float arm1L = 300;

float arm2W = 70;
float arm2D = 100;
float arm2L = 300;

float arm3W = 70;
float arm3D = 100;
float arm3L = 300;

float wiperW = 400;
float wiperD = 10;
float wiperL = 70;

float dif = 1.0;

int pattern1 = 1;


void draw() {
    mouseCamera.update(); // MouseCameraのアップデート
    background(255);
    if(keyPressed){
    if(key == 'a'){
      Px += 2;
    }
    if(key == 'A'){
      Px -= 2;
    }
    if(key == 'b'){
      Py += 2;
    }
    if(key == 'B'){
      Py -= 2;
    }
    if(key == 'g'){
      Pz += 2;
    }
    if(key == 'G'){
      Pz -= 2;
    }
    if(key == 'R'){
      Px = 400;
      Py = 0;
      Pz = 0;
    }
    if (key == '1'){
      pattern1 = 1;
    }
    if (key =='2'){
      pattern1 = 2;
    }
  }
  if (pattern1 == 1){
   screw();
  }
  
  move();
  println(θ1,θ2,θ3);
  
  //window
  translate(-505,400,300);
  box(10,1000,1000);
  translate(505,-400,-300);
  
  //base
  translate(0,400,baseH/2);
  fill(150);
  box(baseW,baseD,baseH);
  
  //1st link
  //rotateZ(radians(angle1));
  rotateZ(θ1);
  translate(0,0,baseH/2+arm1L/2);
  fill(200);
  box(arm1W,arm1D,arm1L);
  
  //2nd link
  //go to 2nd joint
  translate(0,0,arm1L/2);
  //rotateX(radians(angle2));
  rotateX(θ2);
  //go to center of 2nd joint
  translate(0,0,arm2L/2);
  fill(175);
  box(arm2W,arm2D,arm2L);
  
  //3rd link
  // go to 3rd joint
  translate(0, 0, arm2L/2);
  //rotateX(radians(angle3));
  rotateX(θ3);
  // go to center of 3rd joint
  translate(0, 0, arm3L/2);
  fill(200);
  box(arm3W,arm3D,arm3L);
  
  //wiper
  translate(0,0,arm3L/2+wiperL/2);
  fill(150);
  box(wiperW,wiperD,wiperL);
  
}


// マウス操作に応じたMouseCameraの関数を呼び出す
void mousePressed() {
    mouseCamera.mousePressed();
}
void mouseDragged() {
    mouseCamera.mouseDragged();
}
void mouseWheel(MouseEvent event) {
    mouseCamera.mouseWheel(event);
}
