%recibe una imagen y retorna su histograma de ocurrencias total 
function total=bins13(img, g)
    subMatrix=splitMatrix(img,g,g);
    n=size(subMatrix);
    total=[];
    for  k=1:n(1)
        for j=1:n(2)
           hist=getHist(subMatrix{k,j});
           total=horzcat(total,hist);
        end
    end
end
%retorna el histograma normalizado para una submatriz en particular
function hist=getHist(matrix)
    n=size(matrix);
    %hist=cell(3,13);
    hist=zeros(1,13);
    for i=1:n
        for j=1:n
            countUp=countBP(matrix,i,j,0,n(1));countDown=countBP(matrix,i,j,1,n(1));
            countLeft=countBP(matrix,i,j,2,n(1));countRight=countBP(matrix,i,j,3,n(1));
            countTotal=countUp+countDown+countLeft+countRight;
            if (countTotal==0 || countTotal==1)
                continue %si alcanza 0 o 1 punto negro se lo salta.
            elseif(countTotal==4)
                %codigo de las direcciones auxiliares
                countUpLeft=countBP(matrix,i,j,4,n(1));countUpRigth=countBP(matrix,i,j,5,n(1));
                countDownLeft=countBP(matrix,i,j,6,n(1));countDownRight=countBP(matrix,i,j,7,n(1));
                hist(getPos2(countUpLeft,countUpRigth,countDownLeft,countDownRight))=1+hist(getPos2(countUpLeft,countUpRigth,countDownLeft,countDownRight));
            else
                %agregar al histograma en la posicion correcta
                hist(getPos(countUp,countDown,countLeft,countRight))=hist(getPos(countUp,countDown,countLeft,countRight))+1;
            end
            hist=hist./sum(hist);
        end
    end
end
%cuenta la cantidad de puntos negros alcanzados, en una direccion
%0=up 1=down 2=left 3=rigth 4=arriba-izq 5=arriba-der 6=abajo-izq
%7=abajo-der
function count=countBP(matrix,i,j,dir,n)
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
     elseif dir==4
        for k=1:n
            if ((i+k<=n && j-k>0) && matrix(i+k,j-k)==0)
                count=count+1;
                return
            end
        end
     elseif dir==5
        for k=1:n
            if ((i+k<=n && j+k<=n) && matrix(i+k,j+k)==0)
                count=count+1;
                return
            end
        end
     elseif dir==6
        for k=1:n
            if ((i-k>0 && j-k>0) && matrix(i-k,j-k)==0)
                count=count+1;
                return
            end
        end
     elseif dir==7
        for k=1:n
            if ((i-k>0 && j+k<=n) && matrix(i-k,j+k)==0)
                count=count+1;
                return
            end
        end
    end
end
%retorna la posicion del histograma a la cual se le debe sumar, para las 4
%direcciones principales
function pos=getPos(countUp,countDown,countLeft,countRigth)
    if(countUp==0 && countRigth==0)
        pos=1;
    elseif(countUp==0 && countDown==0)
        pos=2;
    elseif(countLeft==0 && countDown==0)
        pos=3;
    elseif(countLeft==0 && countUp==0)
        pos=4;
    elseif(countUp==0)
        pos=5;
    elseif(countRigth==0)
        pos=6;
    elseif(countDown==0)
        pos=7;
    elseif(countLeft==0)
        pos=8;
    end
end
function pos=getPos2(countUpLeft,countUpRigth,countDownLeft,countDownRight)
    if countUpLeft==0
        pos=10;
    elseif countUpRigth==0;
        pos=11;
    elseif countDownLeft==0
        pos=12;
    elseif countDownRight==0
        pos=13;
    else
        pos=8;
    end
end