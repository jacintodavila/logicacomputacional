% built a tree

b_tree_and(G, tree(G, [])) :- builtin(G), !. 
b_tree_and(G, tree(G,T)) :- 
   literal(G), 
   findall(G, clause(G, true), T), T\=[], !. 
b_tree_and(G, tree(G,T)) :-
   literal(G), 
   findall(B, (clause(G, B), B\=true), Bo),
   b_tree_or(Bo, T).
b_tree_and((A,B), (At,Rt)) :-
   b_tree_and(A, At),
   b_tree_and(B, Rt). 

b_tree_or([], []). 
b_tree_or([F|R], [Fr, Rr]) :-
   b_tree_and(F, Fr),
   b_tree_or(R, Rr).  

literal(G) :- atomic(G).
literal(G) :- compound(G), not(list(G)). 

list(G) :- G = (_,_); G = [_|_]; G =  []. 

builtin(G) :-
   compound(G), not(list(G)), 
   predicate_property(system:G, built_in).


p_tree_and(G) :- nl, nl, 
  p_tree_and(0, G).

p_tree_and(N, (tree(G, Tree), R)) :-
  tab(N), write(G), NN is + 5, (Tree \= [] -> writeln(' si '); nl), 
  p_tree_or(NN, Tree),
  tab(N), writeln('y '),
  %   
  p_tree_and(N, R), !. 

p_tree_and(N, tree(G, Tree)) :-
  tab(N), write(G), NN is + 5,
  (Tree \= [] -> writeln(' si '); nl), 
  p_tree_or(NN, Tree), 
  !. 

p_tree_and(N, G) :-
  tab(N), NN is + 5, tab(NN), 
  (G \= [] -> writeln(G); writeln('falla')). 


p_tree_or(_, []). 
p_tree_or(N, [F]) :- 
  p_tree_and(N, F).
p_tree_or(N, [F|R]):-
  p_tree_and(N, F),
  tab(N), NN is + 5, tab(NN), writeln('o '), 
  p_tree_or(N, R). 

% para probar
 
a(X,Y) :- b(X), c(Y). b(1). b(2). c(2).


treinta(X,Y,Z) :- 
   num(X), num(Y), num(Z),
   X \= Y, X \= Z, Y \= Z,
   writeln([X,Y,Z]), 
   30 is X + Y + Z. 

num(1).
num(3).
num(5).
num(7).
num(9). 
num(11). 
num(13).
num(15).

