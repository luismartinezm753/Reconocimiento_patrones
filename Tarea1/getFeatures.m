function [trece, cuatro, ocho, number] = getFeatures(g)
    %si alguno de los archivos no existe, carga las imagenes porque tendr�
    %que calcular alguna matriz de caracter�sticas.
    if(exist('features13.mat', 'file')~=2 || exist('features4.mat', 'file')~=2 || exist('features13.mat', 'file')==2)
        [train, number] = loadImg('digitos\train\digit_0\', 'png');
    end
    %Si existe un archivo con la matriz de caracter�sticas la carga, sino,
    %la crea y la guarda.
    if(exist('features13.mat', 'file')==2)
        trece = load('features13.mat').trece;
    else
        trece = zeros(numel(train), 13);
        for i = 1:numel(train)
            trece(i,:) = bins13(train(i).img, g);%deberia solo pasarse un g, xq son el mismo valor para filas y cols
        end
        save('features13.mat', 'trece');
    end

    if(exist('features4.mat', 'file')==2)
        cuatro = load('features4.mat').cuatro;
    else
        cuatro = zeros(numel(train), 16);
        for i = 1:numel(train)
            cuatro(i,:) = cc4(train(i).img, g, g);
        end
        save('features4.mat', 'cuatro');
    end

    if(exist('features8.mat', 'file')==2)
        ocho = load('features8.mat').ocho;
    else
        ocho = zeros(numel(train), 16);
        for i = 1:numel(train)
            ocho(i,:) = cc8(train(i).img, g, g);
        end
        save('features8.mat', 'ocho');
    end
end

