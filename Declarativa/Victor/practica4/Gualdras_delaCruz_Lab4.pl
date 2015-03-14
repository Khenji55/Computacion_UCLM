%trace, esListaRosadelfas([nodo(_,[hoja(_), hoja(_),hoja(_),hoja(_)]),nodo(_,[nodo(_,[hoja(_),hoja(_),hoja(_)])])]).

%Ejercicio 14
% esRosadelfa(O), el objeto O es una rosadelfa.

esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

%a
esRosadelfa(nil,N):- N is 0.
esRosadelfa(hoja(_), N):- N is 1.
esRosadelfa(nodo(_,Rosadelfas), N) :- esListaRosadelfas(Rosadelfas, N1), length(Rosadelfas, N2), mayor(N1,N2,N). 

esListaRosadelfas([R], N) :- esRosadelfa(R,N).
esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R,N1), esListaRosadelfas(Rosadelfas,N2), mayor(N1,N2,N).

mayor(N1,N2,N) :- N1>=N2, N is N1. 
mayor(N1,N2,N) :- N1<N2, N is N2.

%Ejercicio15

%a
peso(nil, P):- P is 0.
peso(hoja(_), P):- P is 1.
peso(nodo(_,Rosadelfas), P) :- pesoLista(Rosadelfas, X), P is  X+1.

pesoLista([R], P) :- peso(R,P).
pesoLista([R|Rosadelfas], P) :- peso(R,P1), pesoLista(Rosadelfas,P2), P is P1+P2.

%b
grado(A, G) :- esRosadelfa(A,G).

%c
frontera(nil,N):- N=[].
frontera(hoja(X), N):- N=[hoja(X)].
frontera(nodo(_,Rosadelfas), N) :- esListaFrontera(Rosadelfas, N). 

esListaFrontera([R], F):- frontera(R,F).
esListaFrontera([R|Rosadelfas], N) :- frontera(R,N1), esListaFrontera(Rosadelfas,N2), append(N1,N2,N).


%Ejercicio16

preorden(nil, []);
preorden(hoja(X), hoja(X)).
preorden(nodo(X,Rosadelfas), [nodo(X)|R) :- preordenFrontera(nodo(X), R). 

esListaPreorden([R], F):- frontera(R,F).
esListaPreorden([R|Rosadelfas], [X|Rx]) :- preorden(R,X), esListaPreorden(Rosadelfas,Rx).







