movePartsToOrigin();
theta = 0;
[T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics(theta * ones(6, 1));
link1_cur = transformation(link1_new, T1_0);
link2_cur = transformation(link2_new, T2_0);
link3_cur = transformation(link3_new, T3_0);  
link4_cur = transformation(link4_new, T4_0);
link5_cur = transformation(link5_new, T5_0);
end_effector_cur = transformation(end_effector_new, T6_0);