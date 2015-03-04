
%Ejercicio 4

sus(X,Y,[],[]).

sus(X,Y,[X|Sublista],[Y|Sublista2]) :- 
sus(X,Y,Sublista,Sublista2).

sus(X,Y,[P|Sublista],[P|Sublista2]) :- 
dif(X,P),
sus(X,Y,Sublista,Sublista2).

%Ejercicio 5

%append([],X,X).
%append([X|Lista], Y, [X|Z]):- append(X,Y,Z).

aplanar([],[]).
aplanar([[]],[]).

aplanar([[X|Order1]|Order2],[X|Suma]):-
not(is_list(X)),
append(Order1,Order2,Iter),
aplanar(Iter,Suma).

aplanar([X|Order1],Suma):-
is_list(X),
aplanar(X,Aplanado),
append(Aplanado,Order1,Iter),
aplanar(Iter,Suma).

aplanar([X|Order1],[X|Otro]):-
not(is_list(X)),
aplanar(Order1, Otro).



%aplanar([X|Lista], [X|Secuencial]):-
%not(X=[Z|P]),
%aplanar(Lista,Secuencial).
