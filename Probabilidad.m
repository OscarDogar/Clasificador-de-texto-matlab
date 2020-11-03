function [todo] = Probabilidad(todo,m)
    suma = 0;
    %Calcula la probabilidad 
    for i=1:1:m
        todo{i,3}=length(todo{i,1});
        suma = suma + todo{i,3};
    end
    %Calcula la probabilidad 
    for i=1:1:m
        todo{i,3}=todo{i,3}/suma;
    end
end

