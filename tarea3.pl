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
    write('RESULTADO:').

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
    write('RESULTADO').
