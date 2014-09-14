%Recibe el path y formato de las imagenes (ej : '*.png'), retorna un cell de tamañana (1, n de fotos) con las imagenes
% ejemplo LoadImg('/home/luism/Universidad/Patrones/Face_Dataset/Pratheepan_Dataset/FacePhoto/','*.jpg')
function img=LoadImg(path,format)
imgDir=dir([path format]);
nfiles=length(imgDir);
img=cell(1,nfiles);
for i=1:nfiles
    img{i}=imread([path imgDir(i).name]);
    img{i}=imresize(img{i},0.75);%escalar
    if(strcmp(format,'*.png')==1)
        img{i}=im2bw(img{i},0.5);%binarizar 
    end
end
end