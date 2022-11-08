:- module('problemaestudiantil',[]).

en("el lenguaje objetivo es: prolog.

los predicados son:
    mi ingreso es de *una cantidad* al mes. 
    por concepto de *un concepto* egreso *una cantidad* al mes.
    hay comedor. 
    hay bus. 
    ocupo *una cantidad* horas al día en *un concepto*. 
    mi promedio es de *una cantidad*. 
    mi balance economico es de *una cantidad*.
    dispongo de *una cantidad* horas al día. 
    obtengo una beca. 

la base de conocimiento problemaestudiantil incluye:

mi balance economico es de un total 
    si mi ingreso es de un monto Ingreso al mes
    y por concepto de casa egreso un monto Casa al mes
    y por concepto de comida egreso un monto Comida al mes
    y por concepto de otros gastos egreso un monto Otros al mes
    y por concepto de transporte egreso un monto Transporte al mes
    y el total is el monto Ingreso - el monto Casa - el monto Comida - el monto Otros - el monto Transporte. 
   
dispongo de una cantidad horas al día
    si ocupo un tiempo T horas al día en transporte y comida
    y ocupo un tiempo C horas al día en clase
    y ocupo un tiempo E horas al día en estudio
    y ocupo un tiempo D horas al día en descanso
    y la cantidad is 24 - el tiempo T - el tiempo C - el tiempo E - el tiempo D. 
    
obtengo una beca 
    si mi promedio es de un numero
    y el numero > 15. 

escenario uno es:
	mi ingreso es de 1000 al mes. 
	por concepto de casa egreso 500 al mes. 
	por concepto de otros gastos egreso 200 al mes. 
    por concepto de transporte egreso 200 al mes
    	si no es el caso que
			hay bus.
    por concepto de transporte egreso 0 al mes
    	si hay bus. 
    por concepto de comida egreso 300 al mes
    	si no es el caso que 
    		hay comedor. 
    por concepto de comida egreso 0 al mes
    	si hay comedor. 
    hay bus. 
	hay comedor. 
      
la pregunta uno es:
 	mi balance economico es de cuál cantidad.
    
la pregunta dos es:
 	dispongo de cuál cantidad horas al día. 
 
").

/** <examples>
?- show prolog.
?- responde uno con uno.
?- responde dos con uno. 
*/

