
clear
clc
% a = arduino('COM5', 'Uno', 'Libraries', 'Servo');
% s = servo(a,'D4', 'MinPulseDuration', 1e-3, 'MaxPulseDuration', 2e-3);
%   for angle = 0:0.2:1
%        writePosition(s, angle);
%        current_pos = readPosition(s);
%        current_pos = current_pos*180;
%        fprintf('Current motor position is %d degrees\n', current_pos);
%        pause(2);
%    end
a = arduino('COM5', 'Uno', 'Libraries', 'Adafruit');
shield = addon(a, 'Adafruit');


  s = servo(shield, 2);
   for angel = 0.2:0.1:1
   writePosition(s, angel);
   pause(2)
   end
%    dcm = dcmotor(shield, 2)
%     dcm.Speed = 0.2;
%        start(dcm);
%    dcm.Speed = 0.3;
%    pause(2);
%    dcm.Speed = -0.2;
%    pause(2);
%    stop(dcm);