%% Project
% by Dr. Niu Mowang
clc
clear all
close all
format compact
aux = 1e2;
base = stlread('base.stl'); base.facecolor = [0 0 0]; base.edgecolor = 'none'; base.vertices = base.vertices / aux;
link1 = stlread('link1.stl'); link1.facecolor = [.1 .1 .1]; link1.edgecolor = 'none'; link1.vertices = link1.vertices / aux;
link2 = stlread('link2.stl'); link2.facecolor = [.2 .2 .2]; link2.edgecolor = 'none'; link2.vertices = link2.vertices / aux;
link3 = stlread('link3.stl'); link3.facecolor = [.3 .3 .3]; link3.edgecolor = 'none'; link3.vertices = link3.vertices / aux;
link4 = stlread('link4.stl'); link4.facecolor = [.4 .4 .4]; link4.edgecolor = 'none'; link4.vertices = link4.vertices / aux;
link5 = stlread('link5.stl'); link5.facecolor = [.5 .5 .5]; link5.edgecolor = 'none'; link5.vertices = link5.vertices / aux;
end_effector = stlread('end_effector.stl'); end_effector.facecolor = [.6 .6 .6]; end_effector.edgecolor = 'none'; end_effector.vertices = end_effector.vertices / aux;



global l1 l2 d2 l3 d3 l4 l5 l6;

l1 = 600 / aux;d3 = 600 / aux;l6 = 600 / aux;
l2 = 600 / aux;l3 = 600 / aux;d2 = 600 / aux;  
l4 = 600 / aux;l5 = 600 / aux;





%% Moving parts to their origin and orientation

movePartsToOrigin();

th = 0;
[T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics(th * ones(6, 1));
link1_cur = transformation(link1_new, T1_0);
link2_cur = transformation(link2_new, T2_0);
link3_cur = transformation(link3_new, T3_0);  
link4_cur = transformation(link4_new, T4_0);
link5_cur = transformation(link5_new, T5_0);
end_effector_cur = transformation(end_effector_new, T6_0);

%% Using Inverse Kinematics to plot paths

% % global theta_2_priori theta_3_priori theta_4_priori theta_5_priori;
% % theta_2_priori = theta * pi / 180;
% % theta_3_priori = theta * pi / 180;
% % theta_4_priori = theta * pi / 180;
% % theta_5_priori = theta * pi / 180;


x_start = 100/aux;
y_start = 100/aux;
z_start = 100/aux;
x_end = 2000/aux;
y_end = 2000/aux;
z_end = 2000/aux;

n = 1000; 
xc = 2500 / aux;
yc = 2500 / aux; 
zc = 4000 / aux;
rho = 500 / aux;

% i = 1;
% phi = 0;
% for j = 1 : n / 2
%     for th = linspace(0,  y_end, 2 * j - 1)
%         T(:, :, i) = [0     0       0     (xc +th*0.1)
%             0               0     0        th 
%             0                            0                  0               zc + th*0.1
%             0                                   0                           0               1];
%         T(:, :, i) = T(:, :, i) * [0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];
%         i = i + 1;
%     end;
%     phi = phi +  pi ;
% end;

% for j = 1 : n 
%     for th = linspace(0,  y_end, 2 * j - 1)
%         T(:, :, i) = [0     0       0     -(xc +th*0.1)
%             0               0     0        -th 
%             0                            0                  0               -zc - th*0.1
%             0                                   0                           0               1];
%         T(:, :, i) = T(:, :, i) * [0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];
%         i = i + 1;
%     end;
%     phi = phi +  pi ;
% end;


          i = 1;

T(:, :, i) = [0     0       0     xc+60/aux*10
            0               0     0        yc/10-410/aux*10
            0                            0                  0              zc+50/aux*10
            0                                   0                           0               1];



J = [];
tam = size(T, 3);
% 
figure;
for i = 1 : tam
    % I-Kinematics
    [theta_1 theta_2 theta_3 theta_4 theta_5 theta_6] = inverseKinematics(T(:, :, i));
    J = cat(3, J, jacobianMatrix([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]));
    % F-Kinematics
    [T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]);
    link1_cur = transformation(link1_new, T1_0);
    link2_cur = transformation(link2_new, T2_0);
    link3_cur = transformation(link3_new, T3_0);
    link4_cur = transformation(link4_new, T4_0);
    link5_cur = transformation(link5_new, T5_0);
    end_effector_cur = transformation(end_effector_new, T6_0);

    % Animate
    cla, hold on;
    patch(base_new); patch(link1_cur); patch(link2_cur); patch(link3_cur); 
    patch(link4_cur); patch(link5_cur); patch(end_effector_cur);
    patch(end_effector_cur);
    P1(i, 1) = T(1, 4, i); P1(i, 2) = T(2, 4, i); P1(i, 3) = T(3, 4, i);
    plot3(P1(:, 1), P1(:, 2), P1(:, 3), 'b');
    P2(i, 1) = T6_0(1, 4); P2(i, 2) = T6_0(2, 4); P2(i, 3) = T6_0(3, 4);
    plot3(P2(:, 1), P2(:, 2), P2(:, 3), 'r');
    hold off, axis equal;
    max = l1 + l2 + l3 + l4 + l5 + l6;
    min = -max;
    axis([min max min max 0 max]);
    view(3), xlabel('x'), ylabel('y'), zlabel('z'), grid on;
    pause(0.0000000001)
end;





