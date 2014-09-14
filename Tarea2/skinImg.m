function [ bin ] = skinImg(img)
tiempo_inicio = cputime;
TH = 0.6; %Threshold
[filas, cols, ~] = size(img);
bin = zeros(filas, cols);
for i = 1:filas
   for j =1:cols
      if (skinProb(impixel(img,j,i))>TH)
         bin(i,j) = 1;
      end
   end
end
total = cputime - tiempo_inicio;
disp(total);
end

