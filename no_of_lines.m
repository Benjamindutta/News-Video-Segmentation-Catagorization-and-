function [lines]=no_of_lines(img)
    [M,N]=size(img);
    lines=0;
    length=sum(img,2);
    for i=1:M
        if(length(i)>=0.5*N)
            lines=lines+1;
        end
    end  
end
