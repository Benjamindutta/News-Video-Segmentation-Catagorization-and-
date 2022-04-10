function image=threshys(img,highratio,lowratio)
    highthreshold=max(img)*highratio;
    lowthreshold=highthreshold*lowratio;
    [M,N]=size(img);
    image=img;
    for i=2:M-1
        for j=2:N-1
            if(image(i,j)>highthreshold)
                image(i,j)=1;
            elseif(image(i,j)<lowthreshold)
                image(i,j)=0;
            else
                   if((image(i-1,j-1)>highthreshold)|(image(i-1,j)>highthreshold)|(image(i-1,j+1)>highthreshold)|(image(i,j-1)>highthreshold)|(image(i,j+1)>highthreshold)|(image(i+1,j-1)>highthreshold)|(image(i+1,j)>highthreshold)|(image(i+1,j+1)>highthreshold))
                     image(i,j)=1;
                   else
                     image(i,j)=0;
                   end
            end
        end
    end
end