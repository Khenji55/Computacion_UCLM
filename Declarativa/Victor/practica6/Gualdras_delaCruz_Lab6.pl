%Ejercicio 23

add(X, L, L):- member(X,L), !.
add(X, L, [X|L]).

add2(X, L, L):- member(X,L).
add2(X, L, [X|L]).

%Ejercicio 25


cubo:- write('El siguiente numero '), read(X), integer(X), !, cubo1(X,Y), nl, write('El cubo de '), write(X), write(' es '), write(Y), nl, cubo.
cubo.

cubo1(X, Y) :- Y is X*X*X.

cubo_2:- repeat, write('El siguiente numero '), read(X), (not(integer(X)), !); (cubo1(X,Y), nl, write('El cubo de '), write(X), write(' es '), write(Y), nl), false.
cubo_2.
