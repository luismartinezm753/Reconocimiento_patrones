function [prob] = gaussian(pixel, mean, cov, weigth)
    prob = 0;
    for i = 1:numel(weigth)
        prob = prob + weigth(i)*(1/sqrt((2*pi)^3*det(diag(cov(i,:)))))*exp(-0.5*(pixel-mean(i,:))/(diag(cov(i,:)))*(pixel-mean(i,:))');
    end
end