function [result,noResult] = ProbCadaPalabra(todo,texto,m,contPalabras,contVoca)
    for i=1:1:length(texto)
        for j=1:1:m
            cont = 0;
            for k=1:1:length(todo{j,1})
                s = find(strcmpi(todo{j,1}{k}, texto(i)));
                cont = length(s)+cont;
            end
            %Halla la probabilidad como si no encontrara ninguna palabra, esto es para luego compararla con result
            noResult(i,j) = (1)/(contPalabras(j) + contVoca);
            result(i,j) = (cont + 1)/(contPalabras(j) + contVoca);%Las columnas son las clases(futbol,basket,beisbol,tenis)
        end
    end
end

