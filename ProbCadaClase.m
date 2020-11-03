function [clase] = ProbCadaClase(result,todo)
    [filas,columnas]=size(result);
    for i=1:1:columnas%Columnas
        multi=1;
        for j=1:1:filas%Filas
            multi = multi*result(j,i);
        end
        clase(i)=todo{i,3}*multi;
    end
    clase = clase';
end

