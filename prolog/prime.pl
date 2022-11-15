% @jacintodavila

divisible(P,X) :- 0 is P mod X. 

num(B, X, P) :- X is B+1, X<P. 
num(B, X, P) :- BB is B+1, BB<P, num(BB, X, P).

num(1).
num(X) :- num(Y), X is Y+1. 

prime(P) :-
    %divisible(P,1), divisible(P,P),
    \+ (num(1,X,P), divisible(P,X)). 
     
