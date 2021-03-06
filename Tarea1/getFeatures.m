function [trece, cuatro, ocho, number] = getFeatures(g)
    number = [zeros(711,1); zeros(711,1)+1; zeros(711,1)+2; zeros(711,1)+3; zeros(711,1)+4; zeros(711,1)+5; zeros(711,1)+6; zeros(711,1)+7; zeros(711,1)+8; zeros(711,1)+0];
    %si alguno de los archivos no existe, carga las imagenes porque tendr�
    %que calcular alguna matriz de caracter�sticas.
    if(exist(sprintf('features13_%dx%d.mat', g, g), 'file')~=2 || exist(sprintf('features4_%dx%d.mat', g, g), 'file')~=2 || exist(sprintf('features8_%dx%d.mat', g, g), 'file')~=2)
        [images, number] = loadImg('digitos\train\digit_0\', 'png');
    end
    %Si existe un archivo con la matriz de caracter�sticas la carga, sino,
    %la crea y la guarda.
    if(exist(sprintf('features13_%dx%d.mat', g, g), 'file')==2)
        trece = load(sprintf('features13_%dx%d.mat', g, g));
        trece = trece.trece;
        %number = trece.number;
    else
        trece = zeros(numel(images), 13*g*g);
        for i = 1:numel(images)
            trece(i,:) = bins13(images(i).img, g);%deberia solo pasarse un g, xq son el mismo valor para filas y cols
        end
        save(sprintf('features13_%dx%d.mat', g, g), 'trece', 'number');
    end
    disp('Termino 13-bins');
    
    if(exist(sprintf('features4_%dx%d.mat', g, g), 'file')==2)
        cuatro = load(sprintf('features4_%dx%d.mat', g, g));
        cuatro = cuatro.cuatro;
        %number = cuatro.number;
    else
        cuatro = zeros(numel(images), 16*g*g);
        for i = 1:numel(images)
            cuatro(i,:) = cc4(images(i).img, g, g);
        end
        save(sprintf('features4_%dx%d.mat', g, g), 'cuatro', 'number');
    end
    disp('Termino 4-CC');
    
    if(exist(sprintf('features8_%dx%d.mat', g, g), 'file')==2)
        ocho = load(sprintf('features8_%dx%d.mat', g, g));
        ocho = ocho.ocho;
        %number = ocho.number;
    else
        ocho = zeros(numel(images), 16*g*g);
        for i = 1:numel(images)
            ocho(i,:) = cc8(images(i).img, g, g);
        end
        save(sprintf('features8_%dx%d.mat', g, g), 'ocho', 'number');
    end
    disp('Termino 8-CC');
end

