#!/usr/bin/swipl -G32m -T32m -L16m -s karate.pl -g vamos -f
% karate.pl es un glosario automático de términos de Kárate
% es software libre con la licencia GLPv3. 
% Autor: Jacinto Davila <jacinto@ula.ve> 5 Mayo 2013 version 1.0

:- use_module(library(pce)).

% Japonés Español
semset(oss, saludo).
semset('jayimé', comenzar).
semset(yamé, terminar). 
semset(kiritsu, levantarse).
semset(seretzu, ordenarse). 
semset(suki, golpe).
semset(gueri, patada).
semset(rei, reverenciar).
semset(rei, saludar).
semset(kara, 'vacío').
semset(te, mano).
semset(do, camino).
semset(yoi, 'atención').
semset(keague, 'látigo').
semset(keague, rapidez).
semset(kekomi, penetrante).
semset(heian, tranquilidad).
semset(kuro, negro).
semset(aka, rojo).
semset(ao, azul).
semset(shiro, blanco).
semset(mopsu, meditar).
semset(waza, 'técnica').
semset(kime, 'explosión').
semset(tesho, 'base de la palma').
semset(kumade, 'mano de oso').
semset(washide, 'mano de águila'). 
semset(kakuto, 'muñeca doblada').
semset('tate zuki', 'golpe vertical').
semset(tettsui, 'golpe de martillo').
semset(tettsui, martillazo).
semset('ikken hissatsu', 'matar con un golpe').
semset('sun dome', 'golpear a tres centímetros del blanco'). 
semset('shoko suki', 'golpe directo').
semset(seiken, nudillos).
semset(jai, entendido).
semset(jai, 'sí'). 
semset(kihon, 'técnicas básicas en secuencia').
semset(tamasi, 'espíritu'). 
semset(omoi, mente).
semset('o zen', mente).
semset(mai, 'de frente').
semset(yoko, lateral).
semset(maguashi, circular).
semset(tate, arriba).
semset(otoshi, abajo).
semset('atrás', ushiro).
semset(oi, avanzando).
semset(hidari, izquierda).
semset(migi, derecha).
semset(hiki, retroceder).
semset(hiki, recoger).
semset(hammi, halar).
semset(taizabaki, 'desplazamiento lateral o diagonal con defensa').
semset(yoriashi, 'desplazamiento a los laterales').
semset(tobi, salto).
semset(ien, no).
semset(ren, doble).
semset(tori, atacante).
semset(uke, defensor).
semset(seiza, 'sentada japonesa'). 
semset(naka, centro). 
semset(naka, punto).
semset(nanaga, diagonal). 
semset(soeru, vertical).
semset(suikei, horizontal). 
semset(ryo, ambos). 
semset(ude, antebrazo).
semset(jiyil, antebrazo).
semset(gochi, cadera).
semset(dachi, 'posición'). 
%
% Japonés Español Contexto
%
semset(age, sube, 'técnica').
semset(enkei, circular, 'técnica').
semset(gyaku, reverso, 'técnica').
semset(juji, cruzada, 'técnica'). 
semset(yuyi, cruzada, 'técnica'). 
semset(mawashi, circular, 'técnica').
semset(morote, ambas, manos).
semset(namame, diagonal, 'técnica').
semset(oi, adelante, 'técnica').
semset(otoshi, descendiendo, 'técnica').
semset(sayu, 'izquierdo y derecho', 'técnica').
semset(shomen, frente, 'técnica').
semset(soto, 'hacia adentro', 'técnica'). 
semset(tobi, salto, 'técnica').
semset(uchi, 'hacia afuera', 'técnica').
semset(yoko, 'hacia un lado', 'técnica').
semset(ushiro, 'atrás', 'técnica').
semset(migi, derecho, lado).
semset(hidari, izquierdo, lado).
semset(mea, adelante, 'técnica').
semset(soku, costado, cuerpo).
semset(embuze, referencia, kata). 
semset('mawaté', cambio, mano).
semset('ashi caité', cambio, 'pié').  
semset(yodan, superior, cuerpo).
semset(shudan, media, cuerpo).
semset(gedan, baja, cuerpo).
semset(atama, cabeza, cuerpo).  
semset(cuvi, cuello, cuerpo).
semset(mune, pecho, cuerpo).
semset(kataa, hombro, cuerpo).
semset(te, mano, cuerpo).
semset(ken, 'puño', mano).
semset(sho, palma, mano).
semset('nukité', dedo, mano).
semset(sumazaki, dedo, 'pié').
semset(hara, abdomen, cuerpo).
semset(ashi, 'pié', cuerpo).
semset(hiza, rodilla, cuerpo).
semset(empi, codo, cuerpo).
semset(gueri, pierna, cuerpo).
semset(kakato, 'talón', 'pié').
semset(sokuto, filo, 'pié').
semset(shuto, 'filo externo', mano).
semset(aito, 'filo interno', mano).  
semset(koshi, 'base de los dedos', 'pié').
semset(aisoku, empeine, 'pié'). 
semset('mes ket', mirada, cabeza).
semset(teisoku, puente, 'pié'). 
semset(haisho, dorso, mano).
semset(karada, cuerpo, cuerpo).
semset(nini, oreja, cabeza).
semset(kushii, boca, cabeza).
semset(jaanaa, nariz, cabeza).
semset('ashi cuvi', tobillo, 'pié'). 
semset('te cubi', 'muñeca', mano). 
semset(eri, solapa, karategui).
semset(karategui, uniforme, karate).
semset(uwagi, chaqueta, karategui).
semset(sode, manga, karategui).
semset(obi, 'cinturón', karategui).
semset('zubón', 'pantalón', karategui).
semset(sodeguchi, 'apertura de la manga', uwagi). 
semset(shita, 'parte inferior', uwagi). 
semset(mutsubi, 'talones juntos', dachi). 
semset(heisoku, 'pies juntos', dachi).
semset(jeisoku, 'pies juntos', dachi).
semset(heiko, 'pies paralelos', dachi).
semset(jeiko, 'pies paralelos', dachi).
semset(zenkutsu, 'adelantada', dachi).
semset(kiba, 'jinete', dachi).
semset(kokutsu, 'atrazada', dachi).
semset(kosa, 'flexionada', dachi).
semset(kake, 'cruzando', dachi).
semset(yoi, 'atención', dachi).
semset(nekoashi, 'recogiendo una pierna', dachi).
semset(renoji, 'pies en l', dachi).
semset(teji, 'pies en t', dachi). 
semset(moto, 'adelantada corta', dachi). 
semset(zanshi, 'media luna corta', dachi).
semset(fudo, 'adelantada alineada', dachi).
semset(hangetsu, 'media luna', dachi).
semset(jangetsu, 'media luna', dachi). 
semset(gankaku, 'detrás de la rodilla', dachi).
semset(katachi, 'rodilla al frente', dachi). 
semset(hizakutsu, 'adelantada alineada', dachi). 
semset(jizakutsu, 'adelantada alineada', dachi).


que_significa(Palabra, Significado) :-
	semset(Palabra, Significado). 

que_significa(Palabra, Significado, Contexto) :-
	semset(Palabra, Significado, Contexto). 


como_se_dice(Palabra, Japones) :-
	semset(Japones, Palabra).

como_se_dice(Palabra, Japones, Contexto) :-
        semset(Japones, Palabra, Contexto). 

como_se_dice(Palabra, Frase, Japones, Contexto) :-
	semset(Japones, Frase, Contexto),
        sub_atom(Frase, _, _, _, Palabra).


generar_solucion(P, R) :-
        que_significa(P,S),
        format(atom(R), 'La palabra japonesa ~w significa ~w ~n', [P, S]). 

generar_solucion(P, R) :-
        que_significa(P,S,C),
        format(atom(R),'La palabra japonesa ~w significa ~w en el contexto de ~w ~n', [P, S, C]). 

generar_solucion(P, R) :-
        como_se_dice(P,J),
        format(atom(R), 'En japonés, ~w se dice ~w ~n', [P, J]).  

generar_solucion(P, R) :-
        como_se_dice(P,J,C),
        format(atom(R), 'En japonés y en el contexto ~w, ~w se dice ~w ~n', [C, P, J]). 

generar_solucion(P, R) :-
        como_se_dice(P, F, J,C), P \== F, 
        format(atom(R), 'En el contexto ~w, la expresión ~w se dice ~w en japonés ~n', [C, F, J]).

consultar(P, Respuestas) :-
     findall(R, generar_solucion(P, R), Respuestas),
     Respuestas \== [].

consultar(P, [R]) :-
     format(atom(R), 'Perdón. No entendí la palabra ~w ~n', [P]).

escribe_respuestas(_,[]).
escribe_respuestas(View, [R|RR]) :-
	send(View, append, R),
	% send(View, append, '\n'),
        escribe_respuestas(View, RR). 
     

:- pce_begin_class(word_asker, dialog,
                   "Modal prompter for a word").

initialise(W, Label:[name]) :->
        "Initialise the window and fill it"::
        send_super(W, initialise(Label)),
        send(W, append(text_item(name))),
	send(W, append, new(V, view(respuesta))),
	send(V, editable, @off),
	send(W, can_resize, @off),
        send(W, append(button(consulta))),
        send(W, append(button(cancela))),
        send(W, default_button(consulta)).
        
consulta(W) :->
        "User pressed the consulta button"::
        get(W, member(name), NameItem),
        get(NameItem, selection, Typed),
        consultar(Typed, Respuestas), 
	get(W, member, view, View),
        escribe_respuestas(View, Respuestas). 

cancela(W) :->
        "User pressed the Cancel button"::
        send(W, return(@nil)).

prompt(W, Value:name) :<-
        "Open it, destroy it and return the result"::
        get(W, confirm, Value),
        free(W).

:- pce_end_class.

vamos :- get(word_asker('Glosario de Karate TKIC - Dojo Rafael Capielo'), prompt, _), halt.



