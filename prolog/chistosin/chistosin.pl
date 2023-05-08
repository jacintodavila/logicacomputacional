% chistosin.pl

:- use_module(library(www_browser)).

chistes :-  escoge_chiste(URL), www_open_url(URL), espera, chistes. 

escoge_chiste(URL) :-
	N is 1+random(2),
	swritef(URL, '%w.html', [N]).
	
espera :- 
	T is 5 + random(5), % entre 5 y 10 secs
	sleep(T). 
 


   
   
