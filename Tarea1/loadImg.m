%recibe el path del directorio y el tipo de imagen y retorna una
%matriz con todas las imagenes de ese directorio binarizadas
function [images, class] = loadImg(Folder,ImgType)
class = [];
images = [];
for i = [0,1,2,3,4,5,6,7,8,9]
   Folder(numel(Folder)-1) = num2str(i);
   imgDir=dir([Folder '\*.' ImgType]);
   nfile=max(size(imgDir));
   num = i;
   for j=1:nfile
    type(j)=num;
    aux = imread([Folder imgDir(j).name]);
    %aux=imread(imgDir(j).name);
    imag(j).img =im2bw(aux,0.3);
   end
   class = [class type];
   images = [images imag];
end
class = class';
end
