% subconj.pl version.. 
% fulano de tal 
% esto es software libre
% basado en .. 

% ? combinaciones([1,2,3],X).

subconjunto([],[]).
subconjunto([X|L1],[X|L2]) :- subconjunto(L1,L2).
subconjunto(L1,[_|L2]) :- subconjunto(L1,L2).

combinaciones(L1,L2) :- findall(Y,subconjunto(Y,L1),L2).
