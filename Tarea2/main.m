%main
%revisar que en linux los 
img=LoadImg('DataSet/Images/','*.jpg');%data
gt=LoadImg('DataSet/Ground_Truth/','*.png');%ground truth
path='DataSet/Results/R08';
results=cell(1,numel(img));%imagenes resultado
porcentaje=zeros(1,numel(img));%pocentaje de igualdad entre el resultado y el ground_truth
gtPixels = [];
probPixels = [];
for i=1:length(img)
    name=strcat(path,strcat('resultado',num2str(i)));
    name=strcat(name,'.jpg');
    if(exist(name,'file')~=0)
        continue
    end
    [results{i}, probMat]=skinImg(img{i});
    gtPixels = [gtPixels procImg(gt{i},1)];
    probPixels = [probPixels procImg(probMat,2)];
    imwrite(results{i},name,'jpg');
    porcentaje(i)=cmpImg(gt{i},results{i});
end
plotroc(gtPixels, probPixels);
save('porcentaje08.mat','porcentaje');