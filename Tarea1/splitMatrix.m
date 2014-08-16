%recibe una matriz, un vector para las filas y otro para las columnas,
%entrega un cell con las sub matrices dentro.
function vector=splitMatrix(matrix,rows,cols)
    vector=mat2cell(matrix,rows,cols);
end

