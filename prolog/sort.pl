quick_sort([],[]).
quick_sort([H|T],Ordenado) :-  
	pivote(H,T,L1,L2),
	quick_sort(L1,Ordenado1),
	quick_sort(L1,Ordenado2), 
	append(Ordenado1,[H|Ordenado2], Ordenado).

pivote(H,[],[],[]).
pivote(H,[X|T],[X|L],G) :- X =< H,pivote(H,T,L,G).
pivote(H,[X|T],L,[X|G]) :- X > H,pivote(H,T,L,G).
