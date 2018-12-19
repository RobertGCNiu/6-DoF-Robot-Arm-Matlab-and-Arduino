clc

delete(instrfind({'Port'},{'COM6'}));
global a;
a=serial('COM6');
%set(a,'BaudRate¡¯,9600');
set(a,'DataBits',8);
set(a,'StopBits',1);
fopen(a);
pause(2)
%char Pos
Pos= '0,90,90,90,90,0,0';

 %   Pos = num2str(input('Number of Sservo->'));
    fprintf(a,num2str(Pos));
