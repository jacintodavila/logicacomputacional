% mi problema economico
% situacion actual
ingreso(1000).
egreso(casa, 500).
comedor. 
egreso(resto, 200).
bus.
% sobre el tiempo
ocupo(transporte_y_comer, 4, dia).
ocupo(clase, 4, dia).
ocupo(estudiando, 4, dia).
ocupo(durmiendo, 8, dia).
% calificaciones
promedio(14).

% reglas del problema
egreso(trans, 200) :-
  not(bus). 
egreso(trans, 0) :-
  bus.
egreso(comida, 300) :- comedor.

balance_economico(Ahorro) :-
  ingreso(I),
  egreso(casa, Casa),
  egreso(comida, Comida),
  egreso(resto, Resto),
  egreso(trans, Transp),
  Ahorro is I - Casa - Comida - Resto - Transp. 

balance_tiempo(Ocioso, dia) :-
   ocupo(transporte_y_comer, T, dia), 
   ocupo(clase, C, dia), 
   ocupo(estudiando, E, dia),
   ocupo(durmiendo, D, dia),
   Ocioso is 24 - T - C - E - D. 

%
beca :- promedio(X), X > 15.


