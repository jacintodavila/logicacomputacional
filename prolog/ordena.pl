% ? ordena_tonto([2,3,1], L).

perm(Lista,[H|Perm]) :-
	borrar(H,Lista,Rest),perm(Rest,Perm).
perm([],[]).
 
borrar(X,[X|T],T).
borrar(X,[H|T],[H|NT]) :- borrar(X,T,NT).

ordena_tonto(Lista,Ordenado) :-
	perm(Lista,Ordenado), esta_ordenado(Ordenado).

esta_ordenado([]).
esta_ordenado([_]).
esta_ordenado([X,Y|T]) :- X =< Y,esta_ordenado([Y|T]).
