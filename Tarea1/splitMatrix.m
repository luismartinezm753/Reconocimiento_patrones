%recibe una matriz, un vector para las filas y otro para las columnas,
%entrega un cell con las sub matrices dentro.
function vector=splitMatrix(matrix,rows,cols)
    n=size(matrix);
    aux=n(1)/rows;
    aux2=n(2)/cols;
    vector=mat2cell(matrix,aux*ones(1,rows),aux2*ones(1,cols));
end

