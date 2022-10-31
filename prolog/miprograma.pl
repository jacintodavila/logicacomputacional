
:- use_module(library(lists)).     


hola :- write('Hola Mundo'). 


encontrar(N, [N|_]).
encontrar(N, [_|R]) :- encontrar(N, R).  

natural(0).
natural(X) :- Y is X - 1, natural(Y). 
