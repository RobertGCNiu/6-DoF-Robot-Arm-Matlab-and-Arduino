clear;
clc;
T = [1, 0, 0, 3; 0, -1, 0, 0; 0, 0, -1, 2; 0, 0, 0, 1];

Pos = T(1:3, 4);
X_5 = T(1:3, 1);
Y_5 = T(1:3, 2);
Z_5 = T(1:3, 3);
[q_1, q_2, q_3, q_4, q_5] = inverse5DoF(Pos, X_5, Y_5, Z_5);
Q = [q_1, q_2, q_3, q_4, q_5];

[q_1, q_2, q_3, q_4, q_5] = inverse5DoF(Pos, X_5, Y_5, Z_5);
[theta_1, theta_2, theta_3, theta_4, theta_5] = inverseKinematics(T);