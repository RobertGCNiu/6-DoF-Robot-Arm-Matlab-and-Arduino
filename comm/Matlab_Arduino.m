

close all;
clc;


%Inicializo el puerto serial que utilizar¨¦
delete(instrfind({'Port'},{'COM6'}));
s=serial('COM6');
s.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%Abro el puerto serial
fopen(s); 
fwrite(s, '0');
out = fscanf(s);

