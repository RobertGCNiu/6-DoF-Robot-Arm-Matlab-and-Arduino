syms theta1 theta2 l1 l2
xe_0=l1*cos(theta1)+l2*cos(theta1+theta2)
ye_0=l1*sin(theta1)+l2*sin(theta1+theta2)
J=[diff(xe_0, theta1),diff(xe_0,theta2);diff(ye_0, theta1), diff(ye_0, theta2)]

J_subs=subs(J,{theta1, theta2,l1,l2},{pi/3,0,1,2})
J_eval=eval(J_subs)
det(J_eval)

