clear
delete (instrfind('PORT','COM1'))
cam=webcam;
s=serial('COM1','BAUD', 9600);
fopen(s)
i=1;
ax=0; ay=0; bx=0; by=0; cx=0; cy=0;
%Loading reference image
% img1=openfig('1.fig','invisible');
% print('img1','-dpng');
pause(1);
% img_gr_a=imread('img1.png');
% img1_gr=rgb2gray(img_gr_a);
while(i<1000) %This could also be an infinite while, simply exit it with ctrl+c
if i == 1
display('Place the tape on position 1 and press any key');
pause;
elseif i==2
display('Place the tape on position 2 and press any key');
pause;

elseif i==3
display('Place the tape on position 3 and press any key');
pause;
    
end
%% Loading current image
img2=snapshot(cam);
imshow(img2)
print('img2','-dpng')
%% Converting current image to greyscale
img_gr_b=imread('img2.png');
img2_gr=rgb2gray(img_gr_b);
%% Finding differences
img_dif=abs(img1_gr-img2_gr);
%% Threshold
thr=img_dif>70;
%% Noise filtering
imgclean=bwareaopen(thr,600);
%% Finding centerpoint
if any(any(imgclean))>0
    
data = regionprops(imgclean,'Centroid','MajorAxisLength');
center = dane.Centroid
radius = dane.MajorAxisLength

if i == 1
ax=center(1)
ay=center(2)
elseif i==2
bx=center(1)
by=center(2)

elseif i==3
cx=center(1)
cy=center(2)
    
end


if (srodek(1)>ax-30)&&(srodek(1)<ax+30)&&(srodek(2)>ay-30)&&(srodek(2)<ay+30)
fprintf(s,1);
elseif (srodek(1)>bx-30)&&(srodek(1)<bx+30)&&(srodek(2)>by-30)&&(srodek(2)<by+30)
fprintf(s,2);
elseif (srodek(1)>cx-30)&&(srodek(1)<cx+30)&&(srodek(2)>cy-30)&&(srodek(2)<cy+30)
fprintf(s,3);
end 
end
i=i+1;
end
