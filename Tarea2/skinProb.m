function [ probs, probn ] = skinProb(pixel, means, covs, weigths, meann, covn, weigthn)
    probs = gaussian(pixel, means, covs, weigths);
    probn = gaussian(pixel, meann, covn, weigthn);
end

