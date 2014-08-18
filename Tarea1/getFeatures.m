function [trece, cuatro, ocho, number] = getFeatures(g)
    %si alguno de los archivos no existe, carga las imagenes porque tendr�
    %que calcular alguna matriz de caracter�sticas.
    if(exist(sprintf('features13_%dx%d.mat', g, g), 'file')~=2 || exist(sprintf('features4_%dx%d.mat', g, g), 'file')~=2 || exist(sprintf('features8_%dx%d.mat', g, g), 'file')==2)
        [train, number] = loadImg('digitos\train\digit_0\', 'png');
    end
    %Si existe un archivo con la matriz de caracter�sticas la carga, sino,
    %la crea y la guarda.
    if(exist(sprintf('features13_%dx%d.mat', g, g), 'file')==2)
        trece = load(sprintf('features13_%dx%d.mat', g, g));
        trece = trece.trece;
    else
        trece = zeros(numel(train), 13*g*g);
        for i = 1:numel(train)
            trece(i,:) = bins13(train(i).img, g);%deberia solo pasarse un g, xq son el mismo valor para filas y cols
        end
        save(sprintf('features13_%dx%d.mat', g, g), 'trece');
    end
<<<<<<< HEAD
    disp('Termino 13-bins');
    if(exist('features4.mat', 'file')==2)
        cuatro = load('features4.mat');
=======
    
    if(exist(sprintf('features4_%dx%d.mat', g, g), 'file')==2)
        cuatro = load(sprintf('features4_%dx%d.mat', g, g));
>>>>>>> 3570e187c0c4afcd244f43bfde957475a8cf7ad0
        cuatro = cuatro.cuatro;
    else
        cuatro = zeros(numel(train), 16*g*g);
        for i = 1:numel(train)
            cuatro(i,:) = cc4(train(i).img, g, g);
        end
        save(sprintf('features4_%dx%d.mat', g, g), 'cuatro');
    end
<<<<<<< HEAD
    disp('Termino 4-CC');
    if(exist('features8.mat', 'file')==2)
        ocho = load('features8.mat');
=======

    if(exist(sprintf('features8_%dx%d.mat', g, g), 'file')==2)
        ocho = load(sprintf('features8_%dx%d.mat', g, g));
>>>>>>> 3570e187c0c4afcd244f43bfde957475a8cf7ad0
        ocho = ocho.ocho;
    else
        ocho = zeros(numel(train), 16*g*g);
        for i = 1:numel(train)
            ocho(i,:) = cc8(train(i).img, g, g);
        end
        save(sprintf('features8_%dx%d.mat', g, g), 'ocho');
    end
    disp('Termino 8-CC');
end

