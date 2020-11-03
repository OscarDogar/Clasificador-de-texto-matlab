function [contVoca,contPalabras] = Vocabulario(todo,contPalabras,m)
    solas = [];
    for i=1:1:m
    cont=0;
        for j=1:1:length(todo{i,1})
            cont = cont+length(todo{i,1}{j});
            solas = [solas;unique(lower(todo{i,1}{j}))];
        end
    contPalabras(i) = cont;
    end
    solas=unique(solas);
    vacias = find(strcmpi(solas,""));
    solas(vacias)=[];
    contVoca = length(solas);
end

