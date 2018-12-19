function [V50,V5y0] = armTransform(a,b,c,d,d5)
L0 = 2; 
L1 = 2;
L2 = 2;
L3 = 2;
L4 = 2;
T01 = [ cosd(a) -sind(a)  0  0  ;
        sind(a)  cosd(a)  0  0  ;
          0         0     1  0  ;
          0         0     0  1 ];
T12 = [-sind(b) -cosd(b)  0  0  ;
          0         0    -1  0  ;
       cosd(b)  -sind(b)  0  0  ;
          0         0     0  1 ];
T23 = [cosd(c)  -sind(c)  0 L2  ;
       sind(c)   cosd(c)  0  0  ;
          0         0     1  0  ;
          0         0     0  1 ];
T34 = [-cosd(d)  sind(d)  0 L3  ;
           0        0    -1  0  ;
       -sind(d) -cosd(d)  0  0  ;
           0        0     0  1 ];
T45 = [-1  0  0  0 ;
        0 -1  0  0 ;
        0  0  1  0 ;
        0  0  0  1];
T05 = T01*T12*T23*T34*T45;   

V5   = [0;0;L4;1];
V50t = T05*V5; 
V50  = [V50t(1),V50t(2),(V50t(3) + L0 + L1)];

V5y   = [0;d5;L4;1];
V5y0t = T05*V5y; 
V5y0  = [V5y0t(1),V5y0t(2),(V5y0t(3) + L0 + L1)];