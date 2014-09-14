%main
%revisar que en linux los 
img=LoadImg('DataSet/Images/','*.jpg');%data
gt=LoadImg('DataSet/Ground_Truth/','*.png');%ground truth
path='Dataset/Results/';
results=cell(1,numel(img));%imagenes resultado
porcentaje=zeros(1,numel(img));%pocentaje de igualdad entre el resultado y el ground_truth
for i=length(img)
    name=strcat(path,strcat('result',num2str(i)));
    if(exist(name,'file')~=0)
        continue
    end
    results{i}=skinImg(img{i});
    imwrite(results{i},name);
    porcentaje(i)=cmpImg(gt{i},results{i});
end
save('porcentaje.mat',porcentaje);
