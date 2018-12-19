function new_angles = angle2str(angles)
angles = floor(angles);
new_angles = [];
for i=1:length(angles)
     if i==1
new_angles = [new_angles, num2str(angles(i))  ];
    else
        new_angles = [ new_angles ',' num2str(angles(i)) ];
    end
end