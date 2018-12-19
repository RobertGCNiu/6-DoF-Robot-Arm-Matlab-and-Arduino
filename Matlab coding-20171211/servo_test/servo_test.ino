// Include the Servo library 
#include <Servo.h> 
// Create the servo object 
Servo Servo[6]; 
#define servo_NUM  6                                  //Define servo number 
byte servo_pin[servo_NUM] = {10, A2, A3, A0, A1, 7};  //Store PIN numbers
int max_limit[servo_NUM] = {180,180,180,180,180,180};
int min_limit[servo_NUM] = {0,0,0,0,0,0};
int Num_servo = 0;

// 程序不识别输入的负角度
void setup() { 
  
   // We need to attach the servo to the used pin number 
   int i = 0;
   // servo pin initial 
   for(i = 0; i < 6; i++)
     Servo[i].attach(servo_pin[i]); 
   // Serial initial
    Serial.begin(9600);
    while(Serial==-1){;}
   
   // postion inital
//   for(i = 0; i < 6; i++)
//   {
//     Servo[i].write(90);
//     delay(200);
//   }
}
void loop(){   
    char angle;
    angle = Serial.read();

    delay(500);
   
     //Serial.println(Serial.available());
     if(-1!=angle){
       Serial.println(angle);
      if(angle >= 180)
     {
        angle = 180;
     }
     if(angle <= 0)
     {
        angle = 0;
      }
     Servo[Num_servo].write(angle); 
    // Serial.print(angle);
      Num_servo ++;
      if(Num_servo==5){
      Num_servo = 0;
      }
      }
    
  
}



