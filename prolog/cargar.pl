cargar(fecha(13,01,2022, 1530), espera(1,0), 25.47, 340).
cargar(fecha(17,11,2021, 0840), espera(0,10), 24, 287). 
cargar(fecha(30,10,2021, 1400), espera(0,45), 20, 337). 
cargar(fecha(08,10,2021, 1120), espera(1,0), 25, 357). 
cargar(fecha(11,09,2021, 1600), espera(2,30), 24, 335). 
cargar(fecha(14,08,2021, 0830), espera(8,30), 32, 394). 
cargar(fecha(21,04,2021, 1330), espera(10, 0), 30, 330). 
cargar(fecha(12,02,2021, 1830), espera(4, 30), 20, 260). 
cargar(fecha(25,01,2021, 1700), espera(1, 0), 18, 159). 
cargar(fecha(15,01,2021, 1700), espera(3, 0), 14.6, 293). 
cargar(inicio, espera(0,0), 40, 0). 

rendimiento(Periodo, Rendimiento) :-
	cargar(Ultimo, _, Litros, Kms),
	Rendimiento is Kms/Litros,
	justo_anterior(Ultimo, Primero),
	Periodo = periodo(Primero, Ultimo). 
	
justo_anterior(F1, F2) :-
	findall(F, cargar(F, _, _, _), L), 
	append(_, [F1, F2|_], L). 
	
maxima_eficiencia(P, R) :-
	rendimiento(P, R),
	\+ (rendimiento(P2, R2), P\==P2, R<R2). 
