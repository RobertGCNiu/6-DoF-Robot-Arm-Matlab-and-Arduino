clear 
clc
a = arduino('COM5', 'Uno', 'Libraries', 'Servo');
shield = servo(a, 'D4');


 writePosition(shield, 1);


