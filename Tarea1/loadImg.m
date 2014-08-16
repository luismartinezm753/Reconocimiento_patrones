%recibe el path del directoria y el tipo de imagen y retorna una
%matriz con todas las imagenes de ese directorio binarizadas
function images = loadImg(Folder,ImgType)
   imgDir=dir([Folder '/' ImgType]);
   nfile=max(size(imgDir));
   for i=1:nfile
    aux = imread([Folder imgDir(i).name]);
    images(i).img =im2bw(aux,0.3);
   end
end
