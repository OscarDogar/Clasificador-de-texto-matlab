clear 
clc
%% Datos De Entrada
load('datos.mat');
%texto = input("Ingrese un texto: ",'s');

texto = "Me ha gustado el futbol desde muy pequeño, gracias a mis idolos como pele, ronaldinho y messi, soy un delantero y mi equipo favorito es el Bayern";
%texto= "Me gusta mucho el beisbol por que desde pequeño jugaba con un bate e iba a ver las yankees, y verlos hacer sus home run";
%texto = "el baloncesto o basketball me gusta gracias a lebron james, jordan, curry, y mi equipo favorito son los lakers";
%texto = "adsd asdasda asdas";
texto= erase(texto,borrar);
texto =split(texto);

%Borra las palabras del texto que sean iguales a las que estan en palabrasmalas
for i = 1:1:length(palabrasmalas)
    s = find(strcmpi(texto, palabrasmalas(i)));
    texto(s)=[];
end

clear s i
%% Calculo de probabilidades
m = length(todo);%numero de clases

[todo]=Probabilidad(todo,m);

contPalabras = [];%Cuanta todas las palabras por clase
[contVoca,contPalabras] = Vocabulario(todo,contPalabras,m);

%Halla la probabilidad para cada palabra del texto en cada una de las clases
[result,noResult] = ProbCadaPalabra(todo,texto,m,contPalabras,contVoca);

clear m
%Halla la probabilidad del texto para cada clase
[clase] = ProbCadaClase(result,todo);

%% Salida

comparacion = noResult == result;%Se usa para ver que datos no son iguales, es decir, "0"
t = find(comparacion==0);%Encuentra las posiciones donde este el 0

c = find(clase==max(clase));%Halla la posicion en donde se encuentre la mayor probabilidad de la clase

%Si la longitud de t es igual a 0 significa que no hay diferencia entre las
%matrices noResult y result
if length(t)==0
    fprintf("No se ha encontrado relacion al texto de entrada\n");
else
    fprintf("El texto de entrada habla sobre %s\n",todo{c,2});
end
