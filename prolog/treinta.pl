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

