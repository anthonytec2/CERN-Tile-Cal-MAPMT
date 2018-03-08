%Plot to make a movie of the data
%A is the data matrix (X,Y,Triggers)
%name is the full name to save as
%amount is number of frames to save
%tr is saving on or off
%threeD is a 3D bar graph or 2D projection|
%f is the frames of each plot
function[f]= makeMovie(A, name,amount,tr,threeD)
if(nargin==1)%Sets of given parameters if missing args
   name='test';
   amount=length(squeeze(A(1,1,:)));
   tr=0;
   threeD=1;
elseif(nargin==2)
   amount=length(squeeze(A(1,1,:)));
   tr=1;     
   threeD=0;
end

    
v = VideoWriter(['Plots/' name '.mp4'],'MPEG-4');%Sets up file saving path
v.FrameRate = 60;  % Frame Rate for wriitng file

for i=1:amount%loops of amount of frames to save draws graph and saves to frame buffer
    if(threeD==0)
   imagesc(A(:,:,i));
   colorbar;
   drawnow;
   f(i)=getframe;
    else
     bar3(A(:,:,i));
     zlim([0 max(max(max(A)))]);
     xlabel('PMT X Coordinate');
     ylabel('PMT Y Coordinate');
     zlabel('ADC Counts');
     title(name);

     colorbar;
   drawnow;
   f(i)=getframe;   
    end
    
end
if(tr==1)%Saves frame buffer AS MP4
open(v);
writeVideo(v,f);
close(v);
end
end