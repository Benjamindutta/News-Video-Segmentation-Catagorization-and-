close all;clc;
videos=dir('*avi');
newsfileId=fopen('news.txt','w');
commercialfileId=fopen('commercials.txt','w');

for i=1:numel(videos)
    shot=VideoReader(videos(i).name);
    nofframes=shot.NumberOfFrames;
    No_of_lines=zeros(1,nofframes);
    for j=1:nofframes
        iframe=read(shot,j);
        grayframe=rgb2gray(iframe);
        smoothimg = imgaussfilt(grayframe);
        [Gx, Gy] = imgradientxy(smoothimg);
        mag=hypot(Gx,Gy);
        mag=mag./max(mag);
        grad=atan2(Gy,Gx);
        NMSout=NMS(mag,grad);
        nms=NMSout./max(NMSout);
        img4=threshys(nms,0.09,0.05);
        lines=no_of_lines(img4);
        No_of_lines(j)=lines;
    end
    modeline=mode(No_of_lines);
    if(modeline>2)
        fprintf(newsfileId,'%s\n',videos(i).name);
    else
        fprintf(commercialfileId,'%s\n',videos(i).name);
    end
end