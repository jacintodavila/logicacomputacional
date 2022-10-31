parai(I,_,N) :- N<I. 
parai(I,_,N) :- II is I+1,
  paraj(I,II,N).

paraj(I,J,N) :- N<J, 
  II is I+1, 
  parai(II,J,N). 
paraj(I,J,N) :-
   writef("{ %d,%d }\n", [I,J]), 
   JJ is J+1, 
   paraj(I,JJ,N).   
