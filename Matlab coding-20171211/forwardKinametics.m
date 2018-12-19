syms theta1 d2 theta3 l3
T0_1=[cos(theta1), -sin(theta1), 0, 0; sin(theta1), cos(theta1), 0,0; 0, 0, 1, 0; 0, 0, 0, 1];
T1_2=[1, 0, 0, 0; 0, 0, -1, -d2; 0, 1, 0, 0; 0, 0, 0, 1];
T2_3=[cos(theta3), -sin(theta3), 0, 0; sin(theta3), cos(theta3), 0,0; 0, 0, 1, 0; 0, 0, 0, 1];
T3_4=[1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, l3; 0, 0, 0, 1];
T0_2=T0_1*T1_2;
T0_3=T0_2*T2_3;
T0_4=T0_3*T3_4;
p_0=T0_4(1:3,4);
J=[diff(p_0,theta1), diff(p_0,d2), diff(p_0, theta3)]
J=[J; [T0_1(1:3,3), 0*T0_2(1:3,3), T0_3(1:3,3)]]
