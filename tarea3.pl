% comienzo del programa
main :-
    write('=== SISTEMA NUTRICIONAL ==='),nl,
    menu.

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
     Opcion == 4 -> write('Saliendo del programa... ¡Hasta pronto!'), !, fail;
     write('Opcion invalida. Intente de nuevo'), nl, fail).

% prints y tomas de valores de peso ideal por altura.
pesoIdealAltura :-
    nl, write('--- PESO IDEAL POR ALTURA ---'), nl,
    write('Ingrese altura en cm (144-191): '),
    read(Altura),
    write('Ingrese sexo (hombre/mujer): '),
    read(Sexo),
    calculoPesoIdeal(Altura, Sexo, PesoIdeal),
    write('Su peso ideal esta entre '), write(PesoIdeal), nl.

% prints imc tradicional y toma de valores.
imcTradicional :-
    nl, write('--- IMC TRADICIONAL ---'), nl,
    write('Ingrese peso en kg: '),
    read(PesoKG),
    write('Ingrese altura en cm: '),
    read(Altura),
    write('RESULTADO').

% prints de imc por edad y sexo, y toma de valores
imcEdadSexo :-
    nl, write('--- IMC POR EDAD Y SEXO ---'), nl,
    write('Ingrese peso en kg: '),
    read(PesoKG),
    write('Ingrese altura en cm: '),
    read(Altura),
    write('Ingrese edad (2-100): '),
    read(Edad),
    write('Ingrese sexo (hombre/mujer): '),
    read(Sexo),
    write(Resultado).


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



% Calculos por IMC Tradicional
calculoImcTradicional :-
    calculoImcTradicional. 


calculoImcEdadSexo :-
    calculoImcEdadSexo.

