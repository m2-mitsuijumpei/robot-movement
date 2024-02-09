float θ1 = 0;
float θ2 = 0;
float θ3 = 0;
float θ4 = 0;

float A = 0;
float M = 0;
float B = 0;
float N = 0;
float C3 = 0;
float S3 = 0;
float L = 0;

float Px = 300;
float Py = 0;
float Pz = 0;

void move(){
   L = arm3L + wiperL;
  θ1= atan2(Px,Py);
   C3 = (Px*Px + Py*Py + (Pz - arm1L)*(Pz - arm1L) - arm2L*arm2L - L*L) / (2*arm2L*L);
  θ3 = atan2(C3,sqrt(1 - C3*C3));
   S3 = sqrt(1 - C3*C3);
   A = sqrt(Px*Px + Py*Py);
   M = arm2L + L*C3;
   B = Pz - arm1L;
   N = L*S3;
  θ2 = atan2(N*A + M*B,M*A - N*B);
  θ2 = θ2 - PI/2;
  θ3 = θ3 - PI/2;
}

void screw(){
  Pz = (millis()%1000);
  Px = 500;
  Py = 0;
}
/*void auto(){
  if ((Px=0)
  
  if */
