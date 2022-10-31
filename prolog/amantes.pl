% amantes.pl
% un ejercicio de logica y resolucion de restricciones
%
% Después de un naufragio, cuatro hombres y cuatro mujeres 
% quedan varados en una isla desierta. 
% Juan se enamora de una chica  que, por desgracia, ama a José. 
% Antonio ama a una muchacha que ama al hombre que ama Maria. 
% A Alejandra la ama el hombre al que ama la muchacha a la que ama Kevin. 
% A Juan lo ama la muchacha  a quien ama el hombre del que Sofía está enamorada.
% A Sofía la ama el hombre que ama Lorena.
% Lorena ama al hombre que ama a la muchacha que ama a Antonio
% Al final, cada uno se enamora de otro y es, a su vez, amado por otra persona.
% 

/* Author:        Jacinto Davila
    E-mail:        jacinto@ula.ve
    WWW:           http://webdelprofesor.ula.ve/ingenieria/jacinto
    Copyright (C): 2008, Jacinto Davila and Universidad de Los Andes, Venezuela

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    You can also find a copy of the GPL at http://www.gnu.org/copyleft/gpl.html
*/

amantes(Mujer1, Mujer2, Mujer3, Mujer4, Mujer5, Hombre1, Hombre2, Hombre3, Hombre4, Hombre5) :-
% Después de un naufragio, cuatro hombres y cuatro mujeres 
% quedan varados en una isla desierta. 
% Juan se enamora de una chica  que, por desgracia, ama a José. 
% Antonio ama a una muchacha que ama al hombre que ama Maria. 
% A Alejandra la ama el hombre al que ama la muchacha a la que ama Kevin. 
% A Juan lo ama la muchacha  a quien ama el hombre del que Sofía está enamorada.
% A Sofía la ama el hombre que ama Lorena.
% Lorena ama al hombre que ama a la muchacha que ama a Antonio
% Al final, cada uno se enamora de otro y es, a su vez, amado por otra persona.
% --
	% Juan se enamora de una chica  que, por desgracia, ama a José. 
	ama(juan, Mujer1), ama(Mujer1, jose), 
	% Antonio ama a una muchacha que ama al hombre que ama Maria. 
	ama(antonio, Mujer2), ama(Mujer2, Hombre1), ama(maria, Hombre1),
	% A Alejandra la ama el hombre al que ama la muchacha a la que ama Kevin. 
	ama(kevin, Mujer3), ama(Mujer3, Hombre2), ama(Hombre2, alejandra),
	%  A Juan lo ama la muchacha  a quien ama el hombre del que Sofía está enamorada. 
	ama(sofia, Hombre3), ama(Hombre3, Mujer4), ama(Mujer4, juan),
	%  A Sofía la ama el hombre que ama Lorena. 
	ama(lorena, Hombre4), ama(Hombre4, sofia), 
	% Lorena ama al hombre que ama a la muchacha que ama a Antonio
	ama(lorena, Hombre4), ama(Hombre4, Mujer5), ama(Mujer5, antonio),
	% Al final, cada un@ se enamora de otr@ y es, a su vez, amad@ por otra persona.
	%Hombre1 \= antonio, Mujer2 \= maria, 
         %Hombre2 \= kevin, Mujer3 \= alejandra,
	%Mujer4 \= sofia, Hombre3 \= juan, 
	% Mujer5 \= lorena, Hombre6 \= antonio, 
	% Mujer4 \= Mujer1, Hombre3 \= Hombre4, 
	% Mujer5 \= Mujer2, 
	% Mujer5 \= sofia, 
	write('% Juan se enamora de la '), 
	write(Mujer1),
	write(' que, por desgracia, ama a José.'), nl, 
	% write(ama(juan, Mujer1)), nl,
	% write(ama(Mujer1, jose)), nl, 
	% Antonio ama a una muchacha que ama al hombre que ama Maria. 
	write('% Antonio ama a '), 
	write(Mujer2), 
	write(' quien ama a '),
	write(Hombre1), 
	write(' que ama María.'), nl, 
	% write(ama(antonio, Mujer2)), nl,
	% write(ama(Mujer2, Hombre1)), nl,
	% write(ama(maria, Hombre1)), nl,
	% A Alejandra la ama el hombre al que ama la muchacha a la que ama Kevin. 
	write('% A Alejandra la ama '), 
	write(Hombre2), 
	write(' al que ama la '),
	write(Mujer3), 
	write(' que ama Kevin.'), nl,  
	% write(ama(kevin, Mujer3)), nl,
	% write(ama(Mujer3, Hombre2)), nl,
	% write(ama(Hombre2, alejandra)), nl,
	%  A Juan lo ama la muchacha  a quien ama el hombre del que Sofía está enamorada. 
	write('% A Juan lo ama '),
	write( Mujer4 ), 
	write(' a quien ama '),
	write( Hombre3 ),
	write(' del que Sofía está enamorada.'), nl, 
	% write(ama(sofia, Hombre3)), nl, 
	% write(ama(Hombre3, Mujer4)), nl, 
	% write(ama(Mujer4, juan)), nl, 
	%  A Sofía la ama el hombre que ama Lorena. 
	write('% A Sofía la ama '), 
	write( Hombre4 ), 
	write(' que ama Lorena.'), nl, 
	% write(ama(lorena, Hombre4)), nl,  
	% write(ama(Hombre4, sofia)), nl, 
	% A Sofía la ama el hombre que ama Lorena
	% write(ama(maria, Hombre5)), nl, 
	% write(ama(Hombre5, lorena)), nl, 
	% Lorena ama al hombre que ama a la muchacha que ama a Antonio
	write('% Lorena ama al '), 
	write(Hombre4), 
	write(' que ama a la '), 
	write(Mujer5), 
	write(' que ama a Antonio'), nl. 
	% write(ama(lorena, Hombre6)), nl,
	% write(ama(Hombre6, Mujer5)), nl, 
	% write(ama(Mujer5, antonio)), nl.  

% todo el mundo ama a alguien de diferente sexo
ama(X, Y) :- amante(X), amado(Y), diferente_sexo(X,Y).

diferente_sexo(X,Y) :- sexo(X, Z), sexo(Y, W), Z\=W. 

sexo(juan, m).
sexo(antonio, m).
sexo(kevin, m).
sexo(jose, m). 
sexo(maria, f).
sexo(alejandra, f).
sexo(sofia, f).
sexo(lorena, f).

amante(juan).
amante(antonio).
amante(kevin).
amante(jose). 
amante(maria).
amante(alejandra).
amante(sofia).
amante(lorena).

amado(juan).
amado(antonio).
amado(kevin).
amado(jose). 
amado(maria).
amado(alejandra).
amado(sofia).
amado(lorena).


