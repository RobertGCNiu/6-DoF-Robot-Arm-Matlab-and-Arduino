function [q_1, q_2, q_3, q_4, q_5] = inverse5DoF(Pos, X_5, Y_5, Z_5)

d_1 =  60;%% distance for 0->1 is 60mm
d_5 =60;
a_2 = 60;
a_3 = 60;

%%%%%%%
%------Pos = [P_5x, P_ 5y, P_5z]
%------X_5 = [x_5x, x_5y, x_5z],  so do [Y_5, Z_5]
 x_5x = X_5(1); x_5y= X_5(2); x_5z= X_5(3);
 y_5x = Y_5(1); y_5y= Y_5(2); y_5z= Y_5(3);
 z_5x = Z_5(1); z_5y= Z_5(2); z_5z= Z_5(3);
 
 
c_234 = -z_5z;
s_234 = sqrt(1-c_234^2);

q_1 = atand(Pos(2)/Pos(1));

a = d_1 - d_5*c_234 - Pos(3);
b = Pos(1) * cosd(q_1) + Pos(2)*sin(q_1) + d_5*s_234;

q_3 = acosd((a^2 + b^2 -a_2^2 - a_3^2)/(2*a_2*a_3));

c_3 =cosd(q_3);
s_3 = sind(q_3);

q_2 = atan2d(a*(a_2+a_3*c_3) - b*a_3*s_3, a*a_3*s_3 + b*(a_2+a_3*c_3));

q_234 = acosd(c_234);
q_4 = q_234 - q_2 -q_3;
q_5 = c_234*q_1 - atan2d(x_5y, x_5x);
%q_5 = atan2d(x_5y, x_5x) - q_234-q_1;

end