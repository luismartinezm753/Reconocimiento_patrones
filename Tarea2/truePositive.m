function [ TP ] = truePositive( gt, results )
%Summary of this function goes here
%   Detailed explanation goes here
    TP = zeros(1,30);
    for k = 1:30
        img1 = gt{k};
        img2 = results{k};
        n=size(img1);
        total = 0;
        tp=0;
        for i=1:n(1)
            for j=1:n(2)
                if(img1(i,j)==1)
                    total = total+1;
                    if(img2(i,j)==1)
                        tp=tp+1;
                    end
                end
            end
        end
        tp=tp*100/total;
        TP(k) = tp;
    end
end


