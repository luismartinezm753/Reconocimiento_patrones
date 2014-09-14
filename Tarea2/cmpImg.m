%Recibe 2 imagenes y compara que tan parecidas son pixel a pixel
%retorna un % de acierto 100% imagenes iguales. funciona si tienen el mismo
%tamaño
function porcentaje=cmpImg(img1,img2)
    n=size(img1);
    porcentaje=0;
    for i=1:n(1)
        for j=1:n(2)
            if(img1(i,j)==img2(i,j))
                porcentaje=porcentaje+1;
            end
        end
    end
    porcentaje=porcentaje*100/(n(1)*n(2));
end