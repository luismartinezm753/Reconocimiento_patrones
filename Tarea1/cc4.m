function features = cc4(img, rows, cols)
    cell = splitMatrix(img,rows, cols);
    features = [];
    for i = 1:size(cell,1)
        for j = 1:size(cell,2)
            features = [features cc4Hist(cell{i,j})];
        end
    end
end

function hist = cc4Hist(matrix)
    hist = zeros(1,16);
    values = zeros(size(matrix))-1;
    for r = 1:size(matrix,1)
        for c = 1:size(matrix,2)
            if (matrix(r,c)==0) 
                continue;
            end
            num = ray(matrix,r,c,0) + ray(matrix,r,c,1) + ray(matrix,r,c,2) + ray(matrix,r,c,3);
            values(r,c)=num;
            pos = num+1;
            hist(pos) = hist(pos)+1;
        end
    end
    hist = hist/sum(hist);
    
    function str = ray(mat, x, y, dir)
        str = 0;
        if(dir==0) %norte
            if (x~=1)
                val = values(x-1,y);
                if (mat(x-1,y)~=0 && val>=8 && val<=15)
                    str = 8;
                end
            elseif(sum(mat(1:x,y))/(abs(1-x)+1)~=1)
                str = 8;    
            end
        elseif(dir==1) %este
            if (y~=1)
                val = values(x,y-1);
                if mat(x,y-1)~=0 && ((val>=4 && val<=7) || (val>=12 && val<=15))
                    str = 4;
                elseif mat(x,y-1)==0 && (sum(mat(x,y:size(mat,2)))/(abs(size(mat,2)-y)+1)~=1)
                    str = 4;
                end
            elseif(sum(mat(x,y:size(mat,2)))/(abs(size(mat,2)-y)+1)~=1)
                str = 4;
            end 
        elseif(dir==2) %sur
            if x~=1
                val = values(x-1,y);
                if mat(x-1,y)~=0 && (val==2 || val==3 || val==6 || val==7 || val==10 || val==11 || val==14 || val==15)
                    str = 2;
                elseif mat(x-1,y)==0 && (sum(mat(x:size(mat,1),y))/(abs(size(mat,1)-x)+1)~=1)
                    str = 2;
                end
            elseif(sum(mat(x,y:size(mat,2)))/(abs(size(mat,2)-y)+1)~=1)
                str = 2;    
            end                
        else %oeste
            if (y~=1)
                val = values(x,y-1);
                if (mat(x,y-1)~=0 && (rem(val,2)==1))                    
                    str = 1;
                end
            elseif (sum(mat(x,1:y))/(abs(1-y)+1)~=1)
                str = 1;
            end
        end        
    end
end