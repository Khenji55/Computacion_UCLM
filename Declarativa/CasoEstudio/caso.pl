%caso de estudio

:- dynamic clausula/1, clausula/2.
%clausula(X).
%% clausula(p; q).
%clausula(not(p); q).
%clausula(p; not(q)).
%clausula(not(p); not(q)).

%%
%clausula(p;q;r).
%clausula(p;not(q)).
%clausula(not(r);not(q)).
%clausula(not(p);r).

%
clausula(not(p)).
clausula(p;q).

resolutor:- clausula(X), resolutor(X, []), !.
resolutor(X, L):- clausula(Y), (resolutor(X,Y,L); resolutor(Y,X,L)).
resulutor(X, L):- recorrer(X, L, L).

resolutor(X, not(X), _):- write(encontrado).
resolutor(not(X), X, _):- write(encontrado).

resolutor((X;Y), not(X), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).
resolutor((Y;X), not(X), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).

resolutor(X, (not(X);Y), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).
resolutor(X, (Y;not(X)), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).

resolutor((X;Y), (not(X);Z), L):- repeticion(Y, Z, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((X;Y), (Z;not(X)), L):- repeticion(Y, Z, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).


recorrer(_, [], _):- false.
recorrer(X, [Y|R], L):- resolutor(X,Y,L); resolutor(Y,X,L); recorrer(X,R,L).

repeticion(X,X,X).
repeticion(X,Y,(X;Y)).

repeticion((X;Y), X, Y). 
repeticion((Y;X), X, Y).

repeticion((X;Y), (X;Z), S):- ((repeticion(Y,Z,S1); repeticion(Z,Y,S1)), S=(X;S1)) ; S=(X;Y;Z).
repeticion((X;Y), (Z;X), S):- ((repeticion(Y,Z,S1); repeticion(Z,Y,S1)), S=(X;S1)) ; S=(X;Y;Z).
repeticion((Y;X), (Z;X), S):- ((repeticion(Y,Z,S1); repeticion(Z,Y,S1)), S=(X;S1)) ; S=(X;Y;Z).

esta(_, []):- false.
esta(X, [X|_]):-!.
esta(X, [_|R]):- esta(X,R).

%repeticion((Y;X), (X;Z)):-


%resolutor((X;Y), (not(X);Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
%resolutor((X;Y), (Y;not(X))):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).

%resolutor(not(X), (X;Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
%resolutor(not(Y), (X;Y)):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

%resolutor((not(X);Y), X):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
%resolutor((X;not(Y)), Y):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

%resolutor((not(X);Y), (X;Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
%resolutor((X;not(Y)), (X;Y)):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

%resolutor((not(X);Y), (X;Z)):- clausula(Y), !, fail; (assertz(clausula(Y;Z)), resolutor(Y;Z)).
%resolutor((X;not(Y)), (Z;Y)):- clausula(X), !, fail; (assertz(clausula(X;Z)), resolutor(X;Z)).


dame(X,L):- 
