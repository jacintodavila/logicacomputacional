% PREGUNTA 3. Lógica para resolver problemas (adaptado de copi&cohen) 
% El señor Chaparro, su hermana, su hijo y su hija practican tenis y 
% juegan juntos frecuentemente. Los siguientes enunciados acerca de 
% ellos: son verdaderos 
% (1) El gemelo o gemela del mejor jugador y el o la peor jugador 
% son de sexos opuestos.
% (2) El mejor jugador(a) y el peor jugador(a) tienen la misma edad. 
% Explique: ¿Cuál de los cuatro es el mejor jugador(a)?

solucion(Best, Worse) :-
   uno(Best, Worse),
   dos(Best, Worse).

dos(Best, Worse) :-
   % mejor(Best), peor(Worse), 
   Best \= Worse, 
   edad(Best, E), edad(Worse, E). % misma edad

uno(Best, Worse) :- 
   gemeloa(Best, GemelB), gemeloa(Worse, G2),
   sexo(GemelB, S1), sexo(G2, S2), opuestos(S1, S2). 

% mejor(X) :- X = chaparro; X = hermana; X = hijo ; X = hija. 
% peor(X) :- X = chaparro; X = hermana; X = hijo ; X = hija. 

edad(chaparro, e1).
edad(hermana, e4). 
edad(hijo, e4).
edad(hija, e4). 

gemeloa(chaparro, hermana).
gemeloa(hermana, chaparro).
gemeloa(hijo, hija).
gemeloa(hija, hijo). 

sexo(chaparro, m).
sexo(hermana, f).
sexo(hijo, m).
sexo(hija, f). 

opuestos(m,f).
opuestos(f,m). 



   
