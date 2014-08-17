function features = cc4(img, rows, cols)
    cell = splitMatrix(img,rows, cols);
    features = [];
    for i = 1:size(cell,1)
        for j = 1:size(cell,2)
            features = [features cc4Hist(cell{i,j})];
        end
    end
    function hist = cc4Hist(matrix)
        hist = zeros(1,16);
        for r = 1:size(matrix,1)
            for c = 1:size(matrix,2)
                if (matrix(r,c)==0) 
                    continue;
                end
                pos = bin2dec(strcat(ray(matrix,r,c,0), ray(matrix,r,c,1), ray(matrix,r,c,2), ray(matrix,r,c,3)))+1;
                hist(pos) = hist(pos)+1;
            end
        end
        hist = hist/sum(hist);
    end
    function str = ray(mat, x, y, dir)
        if(dir==0) %norte
            str = num2str(sum(mat(1:x,y))/(abs(1-x)+1)~=1);
        elseif(dir==1) %este
            str = num2str(sum(mat(x,y:size(mat,2)))/(abs(size(mat,2)-y)+1)~=1);            
        elseif(dir==2) %sur
            str = num2str(sum(mat(x:size(mat,1),y))/(abs(size(mat,1)-x)+1)~=1);            
        else %oeste
            str = num2str(sum(mat(x,1:y))/(abs(1-y)+1)~=1);
        end        
    end
end