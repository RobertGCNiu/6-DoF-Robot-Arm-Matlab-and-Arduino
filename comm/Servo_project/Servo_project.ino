// Include the Servo library 
#include <Servo.h> 
// Create the servo object 
Servo servo[6]; 
#define servo_NUM  6                                  //Define servo number 
byte servo_pin[servo_NUM] = {10, A2, A3, A0, A1, 7};  //Store PIN numbers

int Num_servo, numdata[6]={0};
double a_0,a_1,a_2,a_3,a_4,a_5;
int mark = 0;
String comdata = "";
int times = 10;

void setup() { 
  
   // We need to attach the servo to the used pin number 
   int i = 0;
   // servo pin initial 
   for(i = 0; i < 6; i++)
     servo[i].attach(servo_pin[i]); 
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
    int j=0;
    int trow = 0;
    while (Serial.available() > 0)  
    {
        comdata += char(Serial.read());
        delay(20);
        mark = 1;
    }
    if(mark ==1){
      Serial.println(comdata);
      if(comdata[0]=='1'){
        trow=1;
      }
      for(int i=2;i<comdata.length();i++){
        if(comdata[i]==','||comdata[i]=='['||comdata[i]==']'){
          j++;
        }
        else{
          numdata[j] = numdata[j]*10+(comdata[i]-'0');
        }
      }
      comdata=String("");
      for(int i=0;i<6;i++){
        Serial.print("Pin");
        Serial.println(numdata[i]);
        //servo[i].write(numdata[i]);
        //delay(200); 
        moveslow(i,numdata[i]);
        numdata[i]=0;   
        mark =0;
    }
    if(trow==1){
      delay(100);
      servo[1].write(150);
    delay(times);
    servo[2].write(90);
   delay(100);
    servo[3].write(90);
    delay(800);
    servo[5].write(0);
    trow=0;
    }
}
}
void moveslow(int num_servo,int pos){
  int initial_speed=servo[num_servo].read();
  if(initial_speed<pos){
  for(int i=servo[num_servo].read(); i<pos;i++)
  servo[num_servo].write(i);
  delay(500);
  }else{
  for(int i=servo[num_servo].read(); i>pos;i--)
  servo[num_servo].write(i);
  delay(500);
  }
}

