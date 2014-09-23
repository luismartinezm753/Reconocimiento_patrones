function [ FP ] = falsePositive( gt, results )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    FP = zeros(1,30);
    for k = 1:30
        img1 = gt{k};
        img2 = results{k};
        n=size(img1);
        total = 0;
        fp=0;
        for i=1:n(1)
            for j=1:n(2)
                if(img1(i,j)==0)
                    total = total+1;
                    if(img2(i,j)==1)
                        fp=fp+1;
                    end
                end
            end
        end
        fp=fp*100/total;        
        FP(k) = fp;
    end
end

