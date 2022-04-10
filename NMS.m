function [img]=NMS(Gmag,dir)
      [M,N]=size(Gmag);
      
      angle=dir*180./pi;
      angle(angle<0)=angle(angle<0)+180;
      img=zeros(M,N);
      Gmag=Gmag*255;
      for i=1:M
          for j=1:N
              try
                  p=255;
                  q=255;
                  if((-22.5<=angle(i,j))&(angle(i,j)<22.5)|(157.5<=angle(i,j))&(angle(i,j)<=180))
                      p=Gmag(i,j+1);
                      q=Gmag(i,j-1);
                  elseif((22.5<=angle(i,j))&(angle(i,j)<67.5))
                      p=Gmag(i+1,j-1);
                      q=Gmag(i-1,j+1);
                  elseif((67.5<=angle(i,j))&(angle(i,j)<112.5))
                      p=Gmag(i+1,j);
                      q=Gmag(i-1,j);
                  elseif((112.5<=angle(i,j))&(angle(i,j)<157.5))
                      p=Gmag(i-1,j-1);
                      q=Gmag(i+1,j+1);
                  end
                  if((Gmag(i,j)>=p)&(Gmag(i,j)>=q))
                      img(i,j)=Gmag(i,j);
                  else
                      img(i,j)=0;
                  end
              catch
                    break;
              end
              
          end
      end
end
