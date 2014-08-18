function features = cc8(img, rows, cols)
    cell = splitMatrix(img,rows, cols);
    features = [];
    for i = 1:size(cell,1)
        for j = 1:size(cell,2)
            features = [features cc8Hist(cell{i,j})];
        end
    end
end

function hist = cc8Hist(matrix)
    hist = zeros(1,16);
    for r = 1:size(matrix,1)
        for c = 1:size(matrix,2)
            if (matrix(r,c)==0) 
                continue;
            end
            pos = ray(matrix,r,c,0) + ray(matrix,r,c,1) + ray(matrix,r,c,2) + ray(matrix,r,c,3)+1;
            hist(pos) = hist(pos)+1;
        end
    end
    hist = hist/sum(hist);
end

function str = ray(mat, x, y, dir)
    str = 0;
    if(dir==0) %NorEste        
        for d = 0:min((abs(1-x)+1),(abs(size(mat,2)-y)+1))-1
            if (mat(x-d,y+d)==0)
                str = 2;
                break;
            end
        end
    elseif(dir==1) %SurEste
        for d = 0:min((abs(size(mat,1)-x)+1),(abs(size(mat,2)-y)+1))-1
            if (mat(x+d,y+d)==0)
                str = 4;
                break;
            end
        end
    elseif(dir==2) %SurOeste
        for d = 0:min((abs(size(mat,1)-x)+1),(abs(1-y)+1))-1
            if (mat(x+d,y-d)==0)
                str = 8;
                break;
            end
        end

    else %NorOeste
        for d = 0:min((abs(1-x)+1),(abs(1-y)+1))-1
            if (mat(x-d,y-d)==0)
                str = 1;
                break;
            end
        end
    end        
end