% prints del menu
menu :-
    repeat,
    nl, write('--- SISTEMA NUTRICIONAL ---'), nl,
    write('1. Calcular peso ideal por altura'), nl,
    write('2. Calcular IMC tradicional'), nl,
    write('3. Calcular IMC por edad y sexo'), nl,
    write('4. Salir'), nl,
    read(Opcion),
    (Opcion == 1 -> pesoIdealAltura, fail;
     Opcion == 2 -> imcTradicional, fail; 
     Opcion == 3 -> imcEdadSexo, fail;  
     Opcion == 4 -> write('Saliendo del programa... ¡Hasta pronto!'), !;
     write('Opcion invalida. Intente de nuevo'), nl, fail). 


% -------------------------------------------------------------------- 

% prints y tomas de valores de peso ideal por altura.
pesoIdealAltura :-
    nl, write('--- PESO IDEAL POR ALTURA ---'), nl, 
    write('Ingrese altura en cm (144-191): '), read(Altura),
    write('Ingrese sexo (hombre/mujer): '), read(Sexo),
    calculoPesoIdeal(Altura, Sexo, PesoIdeal), 
    write('Su peso ideal esta entre '), write(PesoIdeal), nl.

% calculos para peso ideal: 
    % MUJER
calculoPesoIdeal(Altura, 'mujer', PesoIdeal) :- 
    (Altura >= 144, Altura =< 147-> PesoIdeal = '49-55 kg.'; 
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
calculoPesoIdeal(Altura, 'hombre', PesoIdeal) :-
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
    nl, write('--- IMC TRADICIONAL ---'), nl,
    write('Ingrese peso en kg: '), read(PesoKG),
    write('Ingrese altura en cm: '), read(Altura),
    calculoImc(Altura, PesoKG, IMCT), 
    imcTResultado(IMCT, ResultadoIMCT),
    write('IMC: '), write(IMCT), write(ResultadoIMCT), nl.


    % Resultados según IMC Tradicional
imcTResultado(IMCT, ResultadoIMCT) :- 
    (IMCT =< 18.4 -> ResultadoIMCT = ' - Bajo peso,';
    IMCT >= 18.5, IMCT =< 24.9 -> ResultadoIMCT = ' - Peso normal';
    IMCT >= 25, IMCT =< 29.9 -> ResultadoIMCT = ' - Sobrepeso';
    IMCT >= 30 -> ResultadoIMCT = ' - Obesidad').
    
% --------------------------------------------------------------------
calculoImc(Altura, PesoKG, IMCT) :-
    IMC is PesoKG/((Altura/100)**2),
    IMCT is round(IMC*100)/100. 
% --------------------------------------------------------------------
% prints de imc por edad y sexo, y toma de valores
imcEdadSexo :-
    nl, write('--- IMC POR EDAD Y SEXO ---'), nl, 
    write('Ingrese peso en kg: '), read(PesoKG),
    write('Ingrese altura en cm: '), read(Altura),
    write('Ingrese edad (2-100): '), read(Edad),
    write('Ingrese sexo (hombre/mujer): '), read(Sexo),
    calculoImc(Altura, PesoKG, IMCT), 
    write('IMC: '), write(IMCT),
    (Edad =< 20 -> rangoIdeal(Edad, RangoIdeal); 
     Sexo == mujer -> rangoIdealMujer(Edad, Sexo, RangoIdeal); 
     Sexo == hombre -> rangoIdealHombre(Edad, Sexo, RangoIdeal)), 
    write(' (Rango ideal para su edad y sexo: '), write(RangoIdeal), write(')'), nl,
    imcESResultado(IMCT, Edad, Sexo, Resultado), write('Evaluacion: '), write(Resultado), nl. 

% prints de los rangos ideales de cada edad, valores unisex, valores hombre y mujer

rangoIdeal(Edad, RangoIdeal) :-
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

rangoIdealMujer(Edad,'mujer', RangoIdeal) :-
    (Edad >= 21, Edad =< 39 -> RangoIdeal = '18.5-24.9';
    Edad >= 40, Edad =< 64 -> RangoIdeal = '19.0-26.0';
    Edad >= 65, Edad =< 100 -> RangoIdeal = '20.0-27.0';
    RangoIdeal = 'Rango de edad no definido.').

rangoIdealHombre(Edad, 'hombre', RangoIdeal):-
    (Edad >= 21, Edad =< 39 -> RangoIdeal = '20.0-25.0';
    Edad >= 40, Edad =< 64 -> RangoIdeal = '21.0-27.0';
    Edad >= 65, Edad =< 100 -> RangoIdeal = '22.0-28.0';
    RangoIdeal = 'Rango de edad no definido.').


% Calculo de la evaluación 
    % Rangos para evaluar 
limitesIMC(Edad, Sexo, Min, Max) :- 
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
     Min = 0, Max = 0).



imcESResultado(IMC, Edad, Sexo, ResultadoIMC) :- 
    limitesIMC(Edad, Sexo, Min, Max),
    (Min =:= 0, Max =:= 0-> ResultadoIMC = 'Rango de edad no definido.'; 
     IMC < Min-> ResultadoIMC = 'Bajo peso para su edad y sexo.';
     IMC =< Max-> ResultadoIMC = 'Peso normal para su edad y sexo.';
     IMC > Max-> ResultadoIMC = 'Sobrepeso para su edad y sexo.').

% --------------------------------------------------------------------
