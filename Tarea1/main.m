%Se debe usar "ClassificationKNN.fit" para la versi�n 2013 y "fitcknn" para
%la versi�n 2014.
for g = [2 4]
    [trece, cuatro, ocho, number] = getFeatures(g);
    for k = [1 5 10 20]
        for d = ['cityblock' 'euclidian']
            knntrece = ClassificationKNN.fit(trece, number, 'NumNeighbors', k, 'Distance', d); %Cambiar a fitcknn si es necesario
            knncuatro = ClassificationKNN.fit(cuatro, number, 'NumNeighbors', k, 'Distance', d); %Cambiar a fitcknn si es necesario
            knnocho = ClassificationKNN.fit(ocho, number, 'NumNeighbors', k, 'Distance', d); %Cambiar a fitcknn si es necesario
            [test, class] = loadImg('digitos\test\digit_0\', 'png');
            res13Bins = zeros(numel(class));
            res4cc = zeros(numel(class));
            res8cc = zeros(numel(class));
            for i = 1:numel(test)
                if(predict(knntrece, bins13(test(i).img, g, g))==class(i)) 
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
                fprintf('El porcentaje de acierto del m�todo 13bin para el digito %d, utilizando una grilla de %dx$d y un valor %d para el knn y una medida de distancia %s es: %d% \n',i, g, g, k, d, sum(res13Bins(num+1:(i+1)*numel(test)/10))/(numel(test)/10))
                fprintf('El porcentaje de acierto del m�todo 4CC  para el digito %d, utilizando una grilla de %dx$d y un valor %d para el knn y una medida de distancia %s es: %d% \n',i, g, g, k, d, sum(res4cc(num+1:(i+1)*numel(test)/10))/(numel(test)/10))
                fprintf('El porcentaje de acierto del m�todo 8CC  para el digito %d, utilizando una grilla de %dx$d y un valor %d para el knn y una medida de distancia %s es: %d% \n',i, g, g, k, d, sum(res8cc(num+1:(i+1)*numel(test)/10))/(numel(test)/10))
            end
            fprintf('El porcentaje de acierto total del m�todo 13bin, utilizando una grilla de %dx$d y un valor %d para el knn y una medida de distancia %s es: %d% \n',g, g, k, d, sum(res13Bins)/(numel(res13Bins)))
            fprintf('El porcentaje de acierto total del m�todo 4CC, utilizando una grilla de %dx$d y un valor %d para el knn y una medida de distancia %s es: %d% \n',g, g, k, d, sum(res4cc)/(numel(res4cc)))
            fprintf('El porcentaje de acierto total del m�todo 8CC, utilizando una grilla de %dx$d y un valor %d para el knn y una medida de distancia %s es: %d% \n',g, g, k, d, sum(res8cc)/(numel(res8cc)))
        end
    end
end
