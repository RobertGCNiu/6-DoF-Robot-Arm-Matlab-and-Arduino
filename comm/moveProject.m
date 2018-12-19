clear angles
clear new_angles

x_5= [1;0;0];
y_5 = [0;-1;0];
z_5 = [0;0;-1];
Pos = [10;0;5];
%d_1 = 6;
%d_2 = 6;d_3 = 6;
d_1 =  6;%% distance for 0->1 is 60mm
d_5 =10;
a_2 = 12;
a_3 = 6;
[q_1,q_2,q_3,q_4,q_5]=inverse5DoF(Pos, x_5, y_5, z_5);

%angles = [1,q_1+90, q_2+60,q_3+90,q_4+150,q_5,95];
% new_angles = angle2str(angles);
 %fprintf(a, angles); pause(3);    %%%grip the ball
angles= [0,q_1,q_2,q_3,q_4,q_5];

%angles(1:7)=[0, 180+theta_1, theta_2, 90+theta_3, theta_4, theta_5, 90+theta_6];
%angles = [0,90, 20,85,q_4-90,q_5,180]; %%%Position 1
% angles = [0,110, 30,90,100, 90,180];
angles = floor(angles);
x(1,:) =  [0,0,0]; A_1 = [cos(angles(2)),0,-sin(angles(2)),0; sin(angles(2)), 0, cos(angles(2)), 0; 0, -1,0,d_1; 0,0,0,1];
% x_1=  A_1 * [eye(3) x(1,:)'; 0,0,0,1]; 
% %  x_1=   [eye(3) x(1,:)'; 0,0,0,1]*A_1; 
% x_pos(1,:) = x_1(1:3, 4);
A_2 = [cos(angles(3)),-sin(angles(3)),0, a_3*cos(angles(3)); sin(angles(3)), cos(angles(3)), 0,a_3*sin(angles(3)); 0, 0,1,0; 0,0,0,1];
% x_2 =A_2*x_1 ;
% % x_2 = x_1*A_2 ;
% x_pos(2,:) = x_2(1:3, 4);
A_3=[cosd(q_3), -sind(q_3), 0, q_3*cosd(q_3); sind(q_3), cosd(q_3), 0, q_3*sind(q_3);0,0,1,0;0,0,0,1];
% x_3=A_3 *x_2;
% % x_3 = x_2*A_3 ;
% x_pos(3,:) = x_3(1:3, 4);
A_4=[cosd(q_4), 0, -sind(q_4),  0; sind(q_4), 0, cosd(q_4), 0;0,-1,0,0;0,0,0,1];
% x_4=A_4 *x_3;
% % x_4 = x_3*A_4 ;
% x_pos(4,:) = x_4(1:3, 4);
A_5=[cosd(q_5), -sind(q_5), 0, 0; sind(q_5), cosd(q_5), 0, 0;0,0,1,d_5;0,0,0,1];
% x_5 = A_5 *x_4;
% % x_5 = x_4*A_5 ;
% x_pos(5,:) = x_5(1:3, 4);

% x_4 = inv(A_5)* [eye(3) Pos;0,0,0,0];
% x_3 = inv(A_4) *x_4;
% x_2 = inv(A_3)*x_3;
% x_1 = inv(A_2)*x_2;
% x_4 =  [eye(3) Pos; 0,0,0,0]*inv(A_5);
% x_3 = x_4*inv(A_4) ;
% x_2 = x_3*inv(A_3);
% x_1 = x_2*inv(A_2);
x_4 = A_5* [eye(3) Pos;0,0,0,0];
x_3 = A_4*x_4;
x_2 = A_3*x_3;
x_1 = A_2*x_2;

x_pos(1,:) = x_1(1:3, 4);
x_pos(2,:) = x_2(1:3, 4);
x_pos(3,:) = x_3(1:3, 4);
 x_pos(4,:) = x_4(1:3, 4);
 x_pos(5,:) = Pos;
scatter3(x_pos(1,1), x_pos(1,2), x_pos(1,3),'r*'); hold on
plot3(x_pos(1:end,1), x_pos(1:end,2), x_pos(1:end,3));


% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(3);    %%%grip the ball

 angles = [0, q_1+90, q_2+90,q_3,q_4,q_5+90,90];
new_angles = angle2str(angles);
fprintf(a, new_angles); pause(3);    %%%grip the ball
% angles = [q_1+90, 90,150,90,80,0];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(3);    %%%grip the ball


% angles = [1,q_1+90, q_2+180,q_3+60,q_4+150,q_5,100];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(3); 
% angles = [q_1+90, q_2+180,q_3+60,q_4+150,q_5,130];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(3);     
% angles = [q_1+90, q_2+180,q_3+60,q_4+100,q_5,140];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(2);
% angles = [q_1+90, q_2+180,q_3+60,q_4+100,q_5,85];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(2);
% angles = [q_1+90, q_2+100,q_3+60,q_4+100,q_5,80];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(3);

% for pos = 180:-20:1
% angles = [q_1+90, q_2+pos,q_3+60,q_4+100,q_5,pos];
% new_angles = angle2str(angles);
% fprintf(a, new_angles); pause(2);
% end