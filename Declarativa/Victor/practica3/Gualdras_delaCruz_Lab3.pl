%Ejercicio 9

partir(L, L1, L2) :- member(X,L), misus(X,L,Lm), partir3(X, Lm, L1, L2).

partir2([],L,L1,L2).
partir2(L, L1, L2) :- misus(X,L,Lm), partir3(X, Lm, L1, L2), partir2(Rx, L, L1, L2).


partir3(X,[],[],[]).
partir3(X, [P|Rp], [P|Rq], L2) :- P=<X, partir3(X,Rp,Rq, L2).
partir3(X, [P|Rp], L1, [P|Rq]) :- P>X, partir3(X,Rp,L1, Rq).


misus(X, [X|Rx], Rx) :- !.
misus(X, [Z|Rx], [Z|Ry]) :- misus(X, Rx, Ry).

%Ejercicio 11



merge_sort(L, L) :- length(L,1), !.
merge_sort(L, O) :- mitad(L, L1, L2), merge_sort(L1, P), merge_sort(L2,Q), ordena(P, Q, O).

ordena([], X, X) :- !.
ordena(X, [], X) :- !.
ordena([X|Rx], [Y|Ry], [X|R]) :- X=<Y, ordena(Rx, [Y|Ry], R), !.
ordena([X|Rx], [Y|Ry], [Y|R]) :- X>Y, ordena([X|Rx], Ry, R), !.

mitad(L, L1, L2) :- length(L, To), T1 is To//2, length(L1,T1), append(L1,L2,L).

%Ejercicio 13

monomio(C):- integer(C).
monomio(x).
monomio(C*x):- integer(C).
monomio(C*x**E) :- integer(C), integer(E).
polinomio(M+P) :- monomio(M), monomio(P).
polinomio(M-P) :- monomio(M), monomio(P).
polinomio(M+P) :- monomio(M), polinomio(P).
polinomio(M+P) :- polinomio(M), monomio(P).


d(C, 0) :- integer(C).
d(C*x, D) :- D is C.

d(C*x**E, D) :- D = C1*x, C1 is C*E, E1 is E-1, E1 =:= 1.
d(C*x**E, D) :- D = C1*x**E1, C1 is C*E, E1 is E-1.

d(P, D) :- polinomio(P) = polinomio(X+Y), d(X,D1), d(Y,D2), D = D1, D2 =:= 0, !.
d(P, D) :- polinomio(P) = polinomio(X+Y), d(X,D1), d(Y,D2), D = D1+D2.

d(P, D) :- polinomio(P) = polinomio(X-Y), d(X,D1), d(Y,D2), D = D1, D2 =:= 0, !.
d(P, D) :- polinomio(P) = polinomio(X-Y), d(X,D1), d(Y,D2), D = D1-D2.


















