%recibe una matriz y retorna el histograma de ocurrencias x el metodo 13-bins 
function hist=bins13(matrix)
    n=size(matrix);
    %hist=cell(3,13);
    hist=zeros(1,13);
    for i=1:n
        for j=1:n
            countUp=countBP(matrix,i,j,0);countDown=countBP(matrix,i,j,1);
            countLeft=countBP(matrix,i,j,2);countRight=countBP(matrix,i,j,3);
            countTotal=countUp+countDown+countLeft+countRight;
            if (countTotal==0 || countTotal==1)
                continue %si alcanza 0 o 1 punto negro se lo salta.
            elseif(countTotal==4)
                %codigo de las direcciones auxiliares
            else
                %agregar al histograma en la posicion correcta
            end
        end
    end
end
%cuenta la cantidad de puntos negros alcanzados, en una direccion
%0=up 1=down 2=left 3=rigth
function count=countBP(matrix,i,j,dir)
    count=0;
    if dir==0
        for k=1:n
            if (i+k<=n && matrix(i+k,j)==0)
                count=count+1;
                return
            end
        end
    elseif dir==1
        for k=1:n
            if (i-k>0 && matrix(i-k,j)==0)
                count=count+1;
                return
            end
        end
    elseif dir==2
        for k=1:n
            if (j+k<=n && matrix(i,j+k)==0)
                count=count+1;
                return
            end
        end
    elseif dir==3
        for k=1:n
            if (j-k>0 && matrix(i,j-k)==0)
                count=count+1;
                return
            end
        end
    end
end