%Se debe usar "ClassificationKNN.fit" para la versi�n 2013 y "fitcknn" para
%la versi�n 2014.
v=version;
fid=fopen('resultados.txt','w');
results_k1=zeros(1,3);
results_k5=zeros(1,3);
results_k10=zeros(1,3);
results_k20=zeros(1,3);
results_g2=zeros(1,3);
results_g4=zeros(1,3);
%results8cc_g=zeros(1,2);
for g = [2 4]
    [trece, cuatro, ocho, number] = getFeatures(g);
    for k = [1 5 10 20]
        distances = ['cityblock'; 'euclidean'];
        for t = [1 2]
            d = distances(t,:);
            if strcmp(v,'8.3.0.532 (R2014a)')==1%varia segun la version
                knntrece=fitcknn(trece, number, 'NumNeighbors', k, 'Distance', d);
                knncuatro=fitcknn(cuatro, number, 'NumNeighbors', k, 'Distance', d);
                knnocho=fitcknn(ocho, number, 'NumNeighbors', k, 'Distance', d);
            else
                knntrece = ClassificationKNN.fit(trece, number, 'NumNeighbors', k, 'Distance', d); %Cambiar a fitcknn si es necesario
                knncuatro = ClassificationKNN.fit(cuatro, number, 'NumNeighbors', k, 'Distance', d); %Cambiar a fitcknn si es necesario
                knnocho = ClassificationKNN.fit(ocho, number, 'NumNeighbors', k, 'Distance', d); %Cambiar a fitcknn si es necesario
            end
            [test, class] = loadImg('digitos\test\digit_0\', 'png');
            res13Bins = zeros(numel(class),1);
            res4cc = zeros(numel(class),1);
            res8cc = zeros(numel(class),1);
            for i = 1:numel(test)
                if(predict(knntrece, bins13(test(i).img, g))==class(i)) 
                    res13Bins(i) = 1;
                else
                    res13Bins(i) = 0;
                end
                if(predict(knncuatro, cc4(test(i).img, g, g))==class(i)) 
                    res4cc(i) = 1;
                else
                    res4cc(i) = 0;
                end
                if(predict(knnocho, cc8(test(i).img, g, g))==class(i)) 
                    res8cc(i) = 1;
                else
                    res8cc(i) = 0;
                end
            end
            for i = 0:1:9
                num = i*numel(test)/10;
                fprintf(fid,'\n El porcentaje de acierto del método 13bin para el digito %d, utilizando una grilla de %dx%d y un valor %d para el knn y una medida de distancia %s es:  %d% \n',i, g, g, k, d, sum(res13Bins(num+1:(i+1)*numel(test)/10))/(numel(test)/10));
                fprintf(fid,'\n El porcentaje de acierto del método 4CC  para el digito %d, utilizando una grilla de %dx%d y un valor %d para el knn y una medida de distancia %s es:  %d% \n',i, g, g, k, d, sum(res4cc(num+1:(i+1)*numel(test)/10))/(numel(test)/10));
                fprintf(fid,'\n El porcentaje de acierto del método 8CC  para el digito %d, utilizando una grilla de %dx%d y un valor %d para el knn y una medida de distancia %s es:  %d% \n',i, g, g, k, d, sum(res8cc(num+1:(i+1)*numel(test)/10))/(numel(test)/10));
                fprintf(fid,'\n --------------------------------------------- \n');
            end
            fprintf(fid,'\n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n');
            fprintf(fid,' \n El porcentaje de acierto total del método 13bin, utilizando una grilla de %dx%d y un valor %d para el knn y una medida de distancia %s es: %d% \n',g, g, k, d, sum(res13Bins)/(numel(res13Bins)));
            fprintf(fid,'\n El porcentaje de acierto total del método 4CC, utilizando una grilla de %dx%d y un valor %d para el knn y una medida de distancia %s es: %d% \n',g, g, k, d, sum(res4cc)/(numel(res4cc)));
            fprintf(fid,'\n El porcentaje de acierto total del método 8CC, utilizando una grilla de %dx%d y un valor %d para el knn y una medida de distancia %s es: %d% \n',g, g, k, d, sum(res8cc)/(numel(res8cc)));
        end
        if(g==2 && strcmp(d,'euclidean'))
            if(k==1)
                results_k1(1)=sum(res13Bins)/(numel(res13Bins));
                results_k1(2)=sum(res4cc)/(numel(res4cc));
                results_k1(3)=sum(res8cc)/(numel(res8cc));
            elseif(k==5)
                results_k5(1)=sum(res13Bins)/(numel(res13Bins));
                results_k5(2)=sum(res4cc)/(numel(res4cc));
                results_k5(3)=sum(res8cc)/(numel(res8cc));
            elseif(k==10)
                results_k10(1)=sum(res13Bins)/(numel(res13Bins));
                results_k10(2)=sum(res4cc)/(numel(res4cc));
                results_k10(3)=sum(res8cc)/(numel(res8cc));
            elseif(k==20)
                results_k20(1)=sum(res13Bins)/(numel(res13Bins));
                results_k20(2)=sum(res4cc)/(numel(res4cc));
                results_k20(3)=sum(res8cc)/(numel(res8cc));
            end
        end
    end
    if(strcmp(d,'euclidean')==1 && k==5)
        if(g==2)
            results_g2(1)=sum(res13Bins)/(numel(res13Bins));
            results_g2(2)=sum(res4cc)/(numel(res4cc));
            results_g2(3)=sum(res8cc)/(numel(res8cc));
        elseif (g==4)
            results_g4(1)=sum(res13Bins)/(numel(res13Bins));
            results_g4(2)=sum(res4cc)/(numel(res4cc));
            results_g4(3)=sum(res8cc)/(numel(res8cc));
        end
    end
end
%creacion de los graficos
%grafico de variacion de K
x1=[1 5 10 20];
y1=[results_k1;results_k5;results_k10;results_k20];
figure
grafico1=bar(x1,y1,'grouped');
title('Porcentaje de acierto v/s K para distancia euclidiana');
xlabel('K'); % x-axis label
ylabel('Porcentaje de acierto'); % y-axis label
legend('y = 13-bins','y = 4-cc','y= 8-cc');
%grafico de variacion de g
x2=[2 4];
y2=[results_g2;results_g4];
figure
grafico2=bar(x2,y2,'grouped');
title('Porcentaje de acierto Para distintas grillas para distancia euclidiana y k=5');
xlabel('grillas'); % x-axis label
ylabel('Porcentaje de acierto'); % y-axis label
legend('y = 13-bins','y = 4-cc','y= 8-cc');
%cerrar y guardar archivos 
fclose(fid);
saveas(grafico1,'acierto_v/s_k','jpg'); 
saveas(grafico2,'acierto_v/s_g','jpg'); 