%%  eliza(+Stimuli, -Response) is nondet.
%   @param  Stimuli is a list of atoms.
%   @author Richard A. O'Keefe (The Craft of Prolog)
%   @translator Jacinto A. Dávila
%   https://swish.swi-prolog.org/example/eliza.pl

eliza(Estimulo, Respuesta) :-
    plantilla(EstimuloInterno,RespuestaInterna),
    iguala(EstimuloInterno, Estimulo),
    iguala(RespuestaInterna, Respuesta).
    %!.

plantilla([o([i,am]),o(X)], [o([why,are,you]),o(X),p('?')]).
plantilla([p(i),o(X),p(you)], [o([why,do,you]),o(X),p(me),p('?')]).
plantilla([p(te), o([X,o])], [o(['¿','Por', 'qué', me]), o([X, as, '?'])]).
plantilla([p(ciao)], [p(ciao)]).
plantilla([p(ciao)], [p(hola)]).
 

iguala([],[]).
iguala([Item|Items],[Palabra|Palabras]) :-
    iguala(Item, Items, Palabra, Palabras).

iguala(p(Palabra), Items, Palabra, Palabras) :-
    iguala(Items, Palabras).
iguala(o([Palabra|Resto]), Items, Palabra, Palabras0) :-
    append(Resto, Palabras1, Palabras0),
    iguala(Items, Palabras1).


/** <examples>

?- eliza([i, am, very, hungry], Respuesta).
?- eliza([i, love, you], Respuesta).
?- eliza([te, am,o], Respuesta).
*/

