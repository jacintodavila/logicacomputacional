%  dibuja(arbol(a, arbol(b,[],[]), arbol(c,[],[]))).
%  dibuja(arbol(a, arbol(b,[],[]), arbol(c, arbol(d, [], []),[]))).
%  dibuja(arbol(a, arbol(b,[],[]), arbol(c, arbol(d, [], []), arbol(e, [], [])))).
%  dibuja(arbol(a, arbol(b,[],[]), arbol(c, arbol(d, [], []), arbol(e, [], arbol(f, [],[]))))).

dibuja([]). 
dibuja(arbol(H,[],[])) :- write('\t'), write(H). 
dibuja(arbol(H, Arb1, Arb2)) :- 
	write('\t'), write(H), nl, nl, 
	write('\t'), dibuja(Arb1), write('\t'), dibuja(Arb2). 


