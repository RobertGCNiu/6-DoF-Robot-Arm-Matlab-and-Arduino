%% Bassam Jalgha Nov 2010
% RobotPlot
% This function plots the robotic arm manipulator 
%
% Example Tr=RobotPlot(DH)
% where DH is the numerical (not symbolic) Denavit-Hatenberg matrix defined according to p71 of
% Craig book "Introduction to robotics"
% Tr is the resulting transformation matrix of the last frame with respect to the first frame.
%
%
%
% Example: Tr=RobotPlot(DH,joints,base,Twb) 
% joints is the active joints represented in the DH matrix. base is the
% base frame of the manipulator. Twb is the transformation matrix of the
% base frame with respect to the world coordinates.


function Tr=RobotPlot(DH,varargin)

active_joint=zeros(1,size(DH,1));

Twb=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
base=1;

if(isempty(varargin))
    active_joint=ones(1,size(DH,1));
else
    active_joint=varargin{1};
    active_joint=[active_joint zeros(1,size(DH,1)-length(active_joint))]; %zero padding if there is missing joints


    if(size(varargin,2)==2)
        base=varargin{2};
    end
    if(size(varargin,2)==3)
        base=varargin{2};
        Twb=varargin{3};
    end
end

hold on
magnitude=max(max(DH(:,2:3))); %this will set the scale for the initial frame and the joints axis display


%% plotting the initial frame

init_frame=[magnitude/10 magnitude/10 magnitude/10 1 ; 0 0 0 1];
plot3(init_frame(:,1),[0;0],[0;0],'r','LineWidth',3)
plot3([0;0],init_frame(:,2),[0;0],'g','LineWidth',3)
plot3([0;0],[0;0],init_frame(:,3),'b','LineWidth',3)

%% plotting the first joint in the z direction (DH rule)


init_joint=[0 0 0 1 ;0 0 magnitude/5 1];

%Ts1=FKinematics(DH,base,1);
%Ts1=eye(4);
for i=1:size(DH,1)
    Tr=Twb*FKinematics(DH,1,i);
    position=Tr*[0 0 0 1]';
     x(1,i)=position(1);
     y(1,i)=position(2);
     z(1,i)=position(3);
    if(active_joint(i))
        result=Tr*init_joint';
        joint=result';
        plot3(joint(:,1),joint(:,2),joint(:,3),'m:','LineWidth',3)
        plot3(x(1,i),y(1,i),z(1,i),'ok','MarkerFaceColor','k')
    end

end


plot3(x,y,z,'LineWidth',2)
%plot3(x(base),y(base),z(base),'go','LineWidth',2);

%plot3(x(1,size(DH,1)),y(1,size(DH,1)),z(1,size(DH,1)),'ok','MarkerFaceColor','k')

hold off


end