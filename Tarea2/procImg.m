function [vector] = procImg(img, type)
    vector = zeros(2, size(img,1)*size(img,2));
    cont = 1;
    for i=1:size(img,1)
       for j=1: size(img,2)
           if (type==1)
               if(img(i,j)==1)
                   vector(1, cont)=1;
               else
                   vector(2, cont)=1;
               end
           elseif (type==2)
               vector(:,cont) = img(i,j);
           end
           cont = cont+1;
       end
    end
end