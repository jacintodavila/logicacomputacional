
repostaje(per1, 25.47, 340)
repostaje(per2, 24, 287)
repostaje(per3, 20, 337)
repostaje(per4, 25, 357)
repostaje(per5, 24, 335)
repostaje(per6, 32, 394)
repostaje(per7, 30, 330)
repostaje(per8, 20, 260)
repostaje(per9, 18, 159)
repostaje(per10, 14.6, 293)



rendimiento(Kmlts) :-
    %esto de 0 hasta la cantidad de repostajes
    repostaje(perX, A, B)
	Kmlts is A / B
    %podriamos agregar una variable auxiliar la cual almacene
    %el menor valor de de Kmlts que se vaya obteniendo.
    
%El periodo de mayor eficiencia es el ultimo con 20.07 km por litro