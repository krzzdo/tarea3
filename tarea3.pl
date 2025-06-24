% prints del menu
menu :-
    repeat, % inicia un bucle infinito
    nl, write('--- SISTEMA NUTRICIONAL ---'), nl,
    write('1. Calcular peso ideal por altura'), nl,
    write('2. Calcular IMC tradicional'), nl,
    write('3. Calcular IMC por edad y sexo'), nl,
    write('4. Salir'), nl,
    read(Opcion), % Aquí está el input del usuario, 
    (Opcion == 1 -> pesoIdealAltura, fail;  % el -> es como un if, si se cumple lo de la izquierda, pasa lo de la derecha
     Opcion == 2 -> imcTradicional, fail;   % el ; es el símil a un or, va de opción en opción
     Opcion == 3 -> imcEdadSexo, fail;  % el fail hace que el bucle se repita después de ejecutar la opcion
     Opcion == 4 -> write('Saliendo del programa... ¡Hasta pronto!'), !; % el ! es para cortar el programa. símil al break.
     write('Opcion invalida. Intente de nuevo'), nl, fail). % si no toma ninguna de las opciones disponibles, se imprime este write


% -------------------------------------------------------------------- 

% prints y tomas de valores de peso ideal por altura.
pesoIdealAltura :-
    nl, write('--- PESO IDEAL POR ALTURA ---'), nl, % se pide el ingreso de la altura en cm y el sexo (hombre/mujer)
    write('Ingrese altura en cm (144-191): '), read(Altura),
    write('Ingrese sexo (hombre/mujer): '), read(Sexo),
    calculoPesoIdeal(Altura, Sexo, PesoIdeal), % llama a calculoPesoIdeal pasando los valores ingresados. y con la salida.
    write('Su peso ideal esta entre '), write(PesoIdeal), nl.

% calculos para peso ideal: 
    % MUJER
calculoPesoIdeal(Altura, 'mujer', PesoIdeal) :- % se calcula peso ideal solamente para mujer
    (Altura >= 144, Altura =< 147-> PesoIdeal = '49-55 kg.';  % se calcula con condicionales encadenadas con -> y ;
    Altura >= 148, Altura =< 150-> PesoIdeal = '50-56 kg.';
    Altura >= 150, Altura =< 152-> PesoIdeal = '51-57 kg.';
    Altura >= 153, Altura =< 155-> PesoIdeal = '52-59 kg.';
    Altura >= 156, Altura =< 157-> PesoIdeal = '54-60 kg.';
    Altura >= 159, Altura =< 160-> PesoIdeal = '55-61 kg.';
    Altura >= 161, Altura =< 163-> PesoIdeal = '56-63 kg.';
    Altura >= 164, Altura =< 165-> PesoIdeal = '58-64 kg.';
    Altura >= 166, Altura =< 168-> PesoIdeal = '59-65 kg.';
    Altura >= 169, Altura =< 170-> PesoIdeal = '60-67 kg.';
    Altura >= 171, Altura =< 173-> PesoIdeal = '62-68 kg.';
    Altura >= 174, Altura =< 175-> PesoIdeal = '63-70 kg.';
    Altura >= 176, Altura =< 178-> PesoIdeal = '64-71 kg.';
    Altura >= 179, Altura =< 180-> PesoIdeal = '66-72 kg.';
    Altura >= 181, Altura =< 183-> PesoIdeal = '68-74 kg.';
    PesoIdeal = 'Rango indefinido').

    % HOMBRE
calculoPesoIdeal(Altura, 'hombre', PesoIdeal) :- % se calcula peso ideal solamente para hombre
    (Altura >= 156, Altura =< 157-> PesoIdeal = '59-64 kg.';
    Altura >= 158, Altura =< 160-> PesoIdeal = '60-65 kg.';
    Altura >= 161, Altura =< 163-> PesoIdeal = '61-66 kg.';
    Altura >= 164, Altura =< 165-> PesoIdeal = '62-67 kg.';
    Altura >= 166, Altura =< 168-> PesoIdeal = '63-68 kg.';
    Altura >= 169, Altura =< 170-> PesoIdeal = '64-71 kg.';
    Altura >= 171, Altura =< 173-> PesoIdeal = '66-71 kg.';
    Altura >= 174, Altura =< 175-> PesoIdeal = '66-73 kg.';
    Altura >= 176, Altura =< 178-> PesoIdeal = '68-74 kg.';
    Altura >= 179, Altura =< 180-> PesoIdeal = '69-75 kg.';
    Altura >= 181, Altura =< 183-> PesoIdeal = '70-77 kg.';
    Altura >= 184, Altura =< 185-> PesoIdeal = '72-79 kg.';
    Altura >= 185, Altura =< 187-> PesoIdeal = '74-81 kg.';
    Altura >= 187, Altura =< 189-> PesoIdeal = '75-83 kg.';
    Altura >= 190, Altura =< 191-> PesoIdeal = '77-85 kg.';
    PesoIdeal = 'Rango indefinido').

% --------------------------------------------------------------------

% prints imc tradicional y toma de valores.
imcTradicional :-
    nl, write('--- IMC TRADICIONAL ---'), nl, % le pide al usuario el peso en kg y la altura en cm para calcular el imc de manera tradicional
    write('Ingrese peso en kg: '), read(PesoKG),
    write('Ingrese altura en cm: '), read(Altura),
    calculoImc(Altura, PesoKG, IMCT), % llama a calculoImc con la altura y peso, devolviendo IMCT que es el calculo de el IMC
    imcTResultado(IMCT, ResultadoIMCT), % llama a imcTResultado con el IMC calculado y devolviendo el resultado
    write('IMC: '), write(IMCT), write(ResultadoIMCT), nl.


    % Resultados según IMC Tradicional
imcTResultado(IMCT, ResultadoIMCT) :-  % toma el IMC calculado y devuelve lo que significa el imc según el peso y la altura
    (IMCT =< 18.4 -> ResultadoIMCT = ' - Bajo peso,';
    IMCT >= 18.5, IMCT =< 24.9 -> ResultadoIMCT = ' - Peso normal';
    IMCT >= 25, IMCT =< 29.9 -> ResultadoIMCT = ' - Sobrepeso';
    IMCT >= 30 -> ResultadoIMCT = ' - Obesidad').
    
% --------------------------------------------------------------------
calculoImc(Altura, PesoKG, IMCT) :- % calcula el IMC con solo 2 dígitos después de la coma.
    IMC is PesoKG/((Altura/100)**2),
    IMCT is round(IMC*100)/100. % multiplica el resultado por 100, quita los decimales y lo divide por 100 de nuevo.
% --------------------------------------------------------------------
% prints de imc por edad y sexo, y toma de valores
imcEdadSexo :-
    nl, write('--- IMC POR EDAD Y SEXO ---'), nl, % le pide al usuario el peso, la altura, la edad y el sexo.
    write('Ingrese peso en kg: '), read(PesoKG),
    write('Ingrese altura en cm: '), read(Altura),
    write('Ingrese edad (2-100): '), read(Edad),
    write('Ingrese sexo (hombre/mujer): '), read(Sexo),
    calculoImc(Altura, PesoKG, IMCT), % Obtiene el IMC redondeado. 
    write('IMC: '), write(IMCT), %muestra el valor del imc
    (Edad =< 20 -> rangoIdeal(Edad, RangoIdeal); % toma el rango ideal neutro para menores de 21
     Sexo == mujer -> rangoIdealMujer(Edad, Sexo, RangoIdeal); % si es mujer toma el rango ideal dependiendo de la edad
     Sexo == hombre -> rangoIdealHombre(Edad, Sexo, RangoIdeal)), % si es hombre toma el rango ideal dependiendo de la edad
    write(' (Rango ideal para su edad y sexo: '), write(RangoIdeal), write(')'), nl, %  imprime el rango ideal obtenido
    imcESResultado(IMCT, Edad, Sexo, Resultado), write('Evaluacion: '), write(Resultado), nl. 

% prints de los rangos ideales de cada edad, valores unisex, valores hombre y mujer

rangoIdeal(Edad, RangoIdeal) :- % definicion de rango ideal para menores de 21 años
    (Edad == 2-> RangoIdeal = '14.4-18.0';
    Edad == 3-> RangoIdeal = '14.0-17.6';
    Edad == 4-> RangoIdeal = '13.8-17.4';
    Edad == 5-> RangoIdeal = '13.6-17.2';
    Edad == 6-> RangoIdeal = '13.5-17.2';
    Edad == 7-> RangoIdeal = '13.4-17.4';
    Edad == 8-> RangoIdeal = '13.5-17.8';
    Edad == 9-> RangoIdeal = '13.8-18.4';
    Edad == 10-> RangoIdeal = '14.2-19.0';
    Edad == 11-> RangoIdeal = '14.6-19.6';
    Edad == 12-> RangoIdeal = '15.2-20.3';
    Edad == 13-> RangoIdeal = '15.8-21.0';
    Edad == 14-> RangoIdeal = '16.4-21.8';
    Edad == 15-> RangoIdeal = '17.0-22.5';
    Edad == 16-> RangoIdeal = '17.6-23.2';
    Edad == 17-> RangoIdeal = '18.1-23.8';
    Edad == 18-> RangoIdeal = '18.5-24.3';
    Edad == 19-> RangoIdeal = '18.8-24.7';
    Edad == 20-> RangoIdeal = '19.0-25.0').

rangoIdealMujer(Edad,'mujer', RangoIdeal) :- % definicion de rango ideal para mujeres mayores de 20
    (Edad >= 21, Edad =< 39 -> RangoIdeal = '18.5-24.9';
    Edad >= 40, Edad =< 64 -> RangoIdeal = '19.0-26.0';
    Edad >= 65, Edad =< 100 -> RangoIdeal = '20.0-27.0';
    RangoIdeal = 'Rango de edad no definido.').

rangoIdealHombre(Edad, 'hombre', RangoIdeal):- % definicion de rango ideal para hombres mayores de 20
    (Edad >= 21, Edad =< 39 -> RangoIdeal = '20.0-25.0';
    Edad >= 40, Edad =< 64 -> RangoIdeal = '21.0-27.0';
    Edad >= 65, Edad =< 100 -> RangoIdeal = '22.0-28.0';
    RangoIdeal = 'Rango de edad no definido.').


% Calculo de la evaluación 
    % Rangos para evaluar 
limitesIMC(Edad, Sexo, Min, Max) :- % define los limites de los rangos ideales para calcularlos en imcESResultado
    % Unisex
    (Edad == 2-> Min = 14.4, Max = 18.0;
     Edad == 3-> Min = 14.0, Max = 17.6;
     Edad == 4-> Min = 13.8, Max = 17.4;
     Edad == 5-> Min = 13.6, Max = 17.2;
     Edad == 6-> Min = 13.5, Max = 17.2;
     Edad == 7-> Min = 13.4, Max = 17.4;
     Edad == 8-> Min = 13.5, Max = 17.8;
     Edad == 9-> Min = 13.8, Max = 18.4;
     Edad == 10-> Min = 14.2, Max = 19.0;
     Edad == 11-> Min = 14.6, Max = 19.6;
     Edad == 12-> Min = 15.2, Max = 20.3;
     Edad == 13-> Min = 15.8, Max = 21.0;
     Edad == 14-> Min = 16.4, Max = 21.8;
     Edad == 15-> Min = 17.0, Max = 22.5;
     Edad == 16-> Min = 17.6, Max = 23.2;
     Edad == 17-> Min = 18.1, Max = 23.8;
     Edad == 18-> Min = 18.5, Max = 24.3;
     Edad == 19-> Min = 18.8, Max = 24.7;
     Edad == 20-> Min = 19.0, Max = 25.0;
     % Mujeres
     Sexo == mujer, Edad >= 21, Edad =< 39 -> Min = 18.5, Max = 24.9;
     Sexo == mujer, Edad >= 40, Edad =< 64 -> Min = 19.0, Max = 26.0;
     Sexo == mujer, Edad >= 65, Edad =< 100 -> Min = 20.0, Max = 27.0;
     % Hombres
     Sexo == hombre, Edad >= 21, Edad =< 39 -> Min = 20.0, Max = 25.0;
     Sexo == hombre, Edad >= 40, Edad =< 64 -> Min = 21.0, Max = 27.0;
     Sexo == hombre, Edad >= 65, Edad =< 100 -> Min = 22.0, Max = 28.0;
     Min = 0, Max = 0). % define estos valores para rangos indefinidos



imcESResultado(IMC, Edad, Sexo, ResultadoIMC) :- % evalua el imc entregado con limitesIMC
    limitesIMC(Edad, Sexo, Min, Max),
    (Min =:= 0, Max =:= 0-> ResultadoIMC = 'Rango de edad no definido.'; % =:= compara resultados numericos
     IMC < Min-> ResultadoIMC = 'Bajo peso para su edad y sexo.';
     IMC =< Max-> ResultadoIMC = 'Peso normal para su edad y sexo.';
     IMC > Max-> ResultadoIMC = 'Sobrepeso para su edad y sexo.').

% --------------------------------------------------------------------
