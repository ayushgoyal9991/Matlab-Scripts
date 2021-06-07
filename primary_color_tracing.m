v=VideoReader('test_video.mp4');

outputVideo = VideoWriter('new_video');
outputVideo.FrameRate = 30;
open(outputVideo);

inp=menu('Choose which color to track',' [1] Red ',' [2] Green ',' [3] Blue ');

for i=1:v.NumberOfFrames
    % Read Video
    im=read(v,i);
    img=imsubtract(im(:,:,inp),rgb2gray(im));
    img=medfilt2(img,[3,3]);
    img=im2bw(img,0.27);
    
    % Create Box
    [x,y] = find(img);
    max_x=max(x);
    min_x=min(x);
    max_y=max(y);
    min_y=min(y);
    %line 1
    im(min_x:max_x,min_y:min_y+5,1) = 255;
    im(min_x:max_x,min_y:min_y+5,2) = 153;
    im(min_x:max_x,min_y:min_y+5,3) = 51;
    %line 2
    im(max_x:max_x+5,min_y:max_y,1) = 255;
    im(max_x:max_x+5,min_y:max_y,2) = 153;
    im(max_x:max_x+5,min_y:max_y,3) = 51;
    %line 3
    im(min_x:max_x,max_y:max_y+5,1) = 255;
    im(min_x:max_x,max_y:max_y+5,2) = 153;
    im(min_x:max_x,max_y:max_y+5,3) = 51;
    %line 4
    im(min_x:min_x+5,min_y:max_y,1) = 255;
    im(min_x:min_x+5,min_y:max_y,2) = 153;
    im(min_x:min_x+5,min_y:max_y,3) = 51;
    
    %new video
    im=imresize(im,[720 1280]);
    writeVideo(outputVideo,im);
end
close(outputVideo);