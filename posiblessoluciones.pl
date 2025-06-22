% Mantener
rangoIdeal(Edad, RangoIdealTexto).
rangoIdealMujer(Edad, 'mujer', RangoIdealTexto).
rangoIdealHombre(Edad, 'hombre', RangoIdealTexto).

% nuevo predicado para obtener los limites numericos, solo para uso interno y comparacion
limitesIMC(Edad, Sexo, Min, Max) :-
    % Edades 2-20: sin distinción de sexo
    (Edad == 2 -> Min = 14.4, Max = 18.0;
     Edad == 3 -> Min = 14.0, Max = 17.6;
     Edad == 4 -> Min = 13.8, Max = 17.4;
     Edad == 5 -> Min = 13.6, Max = 17.2;
     Edad == 6 -> Min = 13.5, Max = 17.2;
     Edad == 7 -> Min = 13.4, Max = 17.4;
     Edad == 8 -> Min = 13.5, Max = 17.8;
     Edad == 9 -> Min = 13.8, Max = 18.4;
     Edad == 10 -> Min = 14.2, Max = 19.0;
     Edad == 11 -> Min = 14.6, Max = 19.6;
     Edad == 12 -> Min = 15.2, Max = 20.3;
     Edad == 13 -> Min = 15.8, Max = 21.0;
     Edad == 14 -> Min = 16.4, Max = 21.8;
     Edad == 15 -> Min = 17.0, Max = 22.5;
     Edad == 16 -> Min = 17.6, Max = 23.2;
     Edad == 17 -> Min = 18.1, Max = 23.8;
     Edad == 18 -> Min = 18.5, Max = 24.3;
     Edad == 19 -> Min = 18.8, Max = 24.7;
     Edad == 20 -> Min = 19.0, Max = 25.0;

     % Mujeres 21+
     Sexo == mujer, Edad >= 21, Edad =< 39 -> Min = 18.5, Max = 24.9;
     Sexo == mujer, Edad >= 40, Edad =< 64 -> Min = 19.0, Max = 26.0;
     Sexo == mujer, Edad >= 65, Edad =< 100 -> Min = 20.0, Max = 27.0;

     % Hombres 21+
     Sexo == hombre, Edad >= 21, Edad =< 39 -> Min = 20.0, Max = 25.0;
     Sexo == hombre, Edad >= 40, Edad =< 64 -> Min = 21.0, Max = 27.0;
     Sexo == hombre, Edad >= 65, Edad =< 100 -> Min = 22.0, Max = 28.0;

     % Rango no definido
     Min = 0, Max = 0).

% Evaluacion, preguntar cómo funciona
imcESResultado(IMC, Edad, Sexo, ResultadoIMC) :-
    limitesIMC(Edad, Sexo, Min, Max),
    (Min =:= 0, Max =:= 0 ->
        ResultadoIMC = 'Rango de edad no definido.';
     IMC < Min ->
        ResultadoIMC = 'Bajo peso para su edad y sexo.';
     IMC =< Max ->
        ResultadoIMC = 'Peso normal para su edad y sexo.';
     IMC > Max ->
        ResultadoIMC = 'Sobrepeso para su edad y sexo.').

% nuevo imcEdadSexo para que tenga coherencia con los nuevos arreglos
imcEdadSexo :-
    nl, write('--- IMC POR EDAD Y SEXO ---'), nl,
    write('Ingrese peso en kg: '), read(PesoKG),
    write('Ingrese altura en cm: '), read(Altura),
    write('Ingrese edad (2-100): '), read(Edad),
    write('Ingrese sexo (hombre/mujer): '), read(Sexo),
    calculoImc(Altura, PesoKG, IMC),
    write('IMC: '), write(IMC), write('. '),
    (Edad =< 20 -> rangoIdeal(Edad, RangoTexto);
     Sexo == mujer -> rangoIdealMujer(Edad, Sexo, RangoTexto);
     Sexo == hombre -> rangoIdealHombre(Edad, Sexo, RangoTexto)),
    write('Rango ideal para su edad y sexo: '), write(RangoTexto), nl,
    imcESResultado(IMC, Edad, Sexo, Resultado),
    write('Evaluación: '), write(Resultado), nl.
