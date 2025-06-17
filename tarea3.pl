main :-
    write('=== SISTEMA NUTRICIONAL ==='),nl,
    menu.

menu :-
    repeat,
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
    
