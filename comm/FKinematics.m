%% Bassam Jalgha Nov 2010
% Forward kinematics function
% This function computes the forward kinematics transformation map matrix
% for a robotic manipulator. 
%
%Example Tr=Fkinematics(DH)
%where DH is the Denavit-Hatenberg matrix defined according to p71 of
% Craig book "Introduction to robotics", DH can take symbolic or numerical
% elements. If we want the transformation matrix for the entire arm, then EF should be size(DH,1).
% Tr is the resulting transformation matrix.
%
%
%
% Example: Tr=FKinematics(DH,a,b) 
% Tr is the resulting transformation mapping matrix from the frame a to the
% frame b. a and b are integers indicating rows in the DH matrix.


function Tr=FKinematics(DH,varargin)


if(isempty(varargin))
    first=1;
    last=size(DH,1);
    invert=0;
else
    first=varargin{1};
    last=varargin{2};
    if(varargin{2}>=varargin{1})
        first=varargin{1};
        last=varargin{2};
        invert=0;
    else
        first=varargin{2};
        last=varargin{1};
        invert=1;
    end
end



for i=first:last
    al=DH(i,1);
    a=DH(i,2);
    d=DH(i,3);
    t=DH(i,4);

    T(:,:,i)=[cos(t)               -sin(t)                   0              a;
        sin(t)*cos(al)        cos(t)*cos(al)          -sin(al)        -sin(al)*d;
        sin(t)*sin(al)        cos(t)*sin(al)          cos(al)         cos(al)*d;
        0                     0                       0               1];

end

Tr=eye(4);
for i=first:last
    Tr=Tr*T(:,:,i);
end

if(invert)
    Tr=invT(Tr);
end

end