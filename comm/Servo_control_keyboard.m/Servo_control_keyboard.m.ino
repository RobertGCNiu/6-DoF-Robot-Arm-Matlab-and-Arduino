// Include the Servo library 
#include <Servo.h> 
// Create the servo object 
Servo servo[6]; 
#define servo_NUM  6                                  //Define servo number 
byte servo_pin[servo_NUM] = {10, A2, A3, A0, A1, 7};  //Store PIN numbers
int max_limit[servo_NUM] = {180,180,180,180,180,180};
int min_limit[servo_NUM] = {0,0,0,0,0,0};
int Num_servo = 0;
double a_0,a_1,a_2,a_3,a_4,a_5;
int steps = 5;
int PN = 1;
// 程序不识别输入的负角度
void setup() { 
  
   // We need to attach the servo to the used pin number 
   int i = 0;
   // servo pin initial 
   for(i = 0; i < 6; i++)
     servo[i].attach(servo_pin[i]); 
   // Serial initial
    Serial.begin(9600);
    while(Serial==-1){;}
   servo[4].write(0);
   servo[5].write(0);
   // postion inital
//   for(i = 0; i < 6; i++)
//   {
//     Servo[i].write(90);
//     delay(200);
//   }
}
void loop(){   
    char key;
    
    key = Serial.read();
     
     //Serial.println(Serial.available());
     if(-1!=key){
      Serial.println(key);
       switch(key){
        case '8': PN = 1;break;
        case '9': PN = -1;break;
        
     case '0':
     a_0=servo[0].read();
     if(PN==1){
     servo[0].write(a_0+steps);
     }else{ 
     servo[0].write(a_0-steps);}
     Serial.println(a_0);break;
     case '1':
     a_1=servo[1].read(); 
      if(PN==1){
     servo[1].write(a_1+steps); 
       }else{ 
     servo[1].write(a_1-steps);}
     Serial.println(a_1);break;
     case '2':
     a_2=servo[2].read(); 
      if(PN==1){
     servo[2].write(a_2+steps); 
       }else{ 
     servo[2].write(a_2-steps);}
     Serial.println(a_2);break;
     case '3':
     a_3=servo[3].read(); 
      if(PN==1){
     servo[3].write(a_3+steps); 
       }else{ 
     servo[3].write(a_3-steps);}
     Serial.println(a_3+steps);break;  
     case '4':
     a_4=servo[4].read(); 
      if(PN==1){
     servo[4].write(a_4+steps); 
       }else{ 
     servo[4].write(a_4-steps);}
     Serial.println(a_4+steps);break;  
     case '5':
     a_5=servo[5].read(); 
      if(PN==1){
     servo[5].write(a_5+steps); 
       }else{ 
     servo[5].write(a_5-steps);}
     Serial.println(a_5+steps);break;   
    // Serial.print(angle);
      case '7':
    delay(100);
    servo[1].write(120);
    delay(50);
    servo[2].write(90);
   delay(100);
    servo[3].write(90);
    delay(800);
    servo[5].write(0);
    break;
      }
      }
      
     }
  

