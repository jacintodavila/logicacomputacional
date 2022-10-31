% elizaulito.pl
%
% Este programa interactua con humanos en lenguaje natural y
% despliega una conducta coprolalica. Esta basado en el programa
% eliza y en una versión Venezolana llamada Elizaul. 
%
% Este programa requiere el programa silabador.pl, tambien distribuible
% con licencia GPL. 
% 
%Copyright (C)
%
%This program is free software; you can redistribute it
%and/or modify it under the terms of the GNU General Public License
%as published by the Free Software Foundation; either version 2 of
%the License, or any later version.
%
%This program is distributed in the hope that it will be
%useful, but WITHOUT ANY WARRANTY; without even the implied
%warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%See the GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public
%License along with this program; if not, write to the Free
%Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
%02111-1307 USA or see http://www.opensource.org/licenses/gpl-license.php
% 
% Authors:  Luis Astorga Junquera <ls.astorg@gmail.com> 
%           Jacinto Davila <jacinto@ula.ve>
% Address: Universidad de Los Andes. Mérida, Venezuela. 
%
% 
% last modified: April, 2015
/* To run:  ?- consult(elizaulito), elizaulito.         */
/* To stop: > adios (`>' is the Elizaulito prompt)      */
/* Para silabar > silaba <palabra o frase en Español>   */

:- encoding(iso_latin_1). 

:- [silabador].  % Carga el silabador.. 

/*****************************************************************************/
% simplification rules

sr([no,hace|X],[una,'m....'|Y],X,Y).
sr([no,puede|X],[para,nada|Y],X,Y).
sr([no,'será'|X],[nada,que,ver|Y],X,Y).
sr(['soñé'|X],['soñado'|Y],X,Y).
sr(['sueños'|X],['sueño'|Y],X,Y).
sr([como|X],[que|Y],X,Y).
sr([cuando|X],[que|Y],X,Y).
sr([parecido|X],[igual|Y],X,Y).
sr([mismo|X],[igual|Y],X,Y).
sr([cierto|X],[si|Y],X,Y).
sr([quizas|X],[puede,ser|Y],X,Y).
sr([aleman|X],[xfremd|Y],X,Y).
sr([frances|X],[xfremd|Y],X,Y).
sr([ingles|X],[xfremd|Y],X,Y).
sr([maquina|X],[computadora|Y],X,Y).
sr([maquinas|X],[computadora|Y],X,Y).
sr([computadoras|X],[computer|Y],X,Y).
sr([tuyo|X],[mio|Y],X,Y).
sr([tuyos|X],[mios|Y],X,Y).
sr([fuiste|X],[fui|Y],X,Y).
sr(['tú',eres|X],[yo,soy|Y],X,Y).      
sr([yo,soy|X],['tú',eres|Y],X,Y).     
sr([a,mi|X],[a,ti|Y],X,Y).
sr([a,ti|X],[a,mi|Y],X,Y).
sr([por,mi|X],[por,ti|Y],X,Y).
sr([por,ti|X],[por,mi|Y],X,Y).
sr([mamita|X],[jeva|Y],X,Y).
sr([papito|X],[papy|Y],X,Y).
sr([mama|X],[madre|Y],X,Y).
sr([papa|X],[padre|Y],X,Y).
sr([yo|X],[tu|Y],X,Y).
sr([tu|X],[yo|Y],X,Y).
sr([mi|X],[tu|Y],X,Y).
sr([mis|X],[tus|Y],X,Y).
sr([todo,el,mundo|X],[alguien|Y],X,Y).
sr([todos|X],[alguien|Y],X,Y).
sr([nadie|X],[todos|Y],X,Y).


/*****************************************************************************/
% Make the rule base modifiable
%    this is specific to Quintus Prolog and SWI Prolog.

% 50---------------------------------------------------------------------------
:- dynamic(rules/1).


/*****************************************************************************/
% The rule base
%    The format of the rules is:
%
% rules([[keyword, importance of keyword],[
%         [pattern #, [the pattern], last response used,
%             [response 1],
%             [response 2],
%             ...
%             [response n]]]]).


rules([[perdon,0],[
        [1,[_],0,
                [no,seas,mediocre,.],
                [anda,a,revisarte,ese,'c....',.],
                [deja,la,estupidez,'c....'],
                [que,te,'c..',otro,.]]]]).

rules([[lo,siento,0],[
        [1,[_],0,
                [que,facil,es,lamentarse,!,.],
                [lo,sientes,papito,?,¡,que,boluntad,tienes,!,.],
                [que,cobardia,tan,arrecha,la,tuya,'c....',!],
                [que,nuevo,contigo,pana,!,¡,reacciona,'c....',!,.]]]]).

rules([[recuerdo,5],[
        [1,[_,tu,recuerdas,Y],0,
                [reeecuerdo,reecuerdo,¡,que,bobo,!,¡,olvidate,de,Y,!],
                [pensar,en,Y,te,mueve,tus,fibritas,ocultas,?,tramposito],
                [y,que,mas,recuerdas,gafo,?],
                [ahora,es,que,te,vienes,a,acordar,de,Y,gafo,?],
                [que,me,quieres,decir,con,esta,'m...',de,Y,?],
                [que,'c....',tengo,que,ver,yo,con,esa,'m....',de,Y,?]],
        [2,[_,yo,recuerdo,que,Y],0,
                [y,tu,pensabas,que,me,importa,algo,esta,web-o-nada,de,Y,?],
                [por,que,deberia,recordar,Y,si,ni,siquiera,se,quien,eres,?],
                [y,dale,con,Y],
                [igual,[que,0]],
                [que,'m....',sabes,tu,de,Y,.]],
        [3,[_],0,
                [newkey]]]]).

rules([[si,3],[
        [1,[_,si,Y],0,
                [te,parece,que,esa,'m....',es,asi,como,la,pintas,Y,?],
                [te,gustaria,que,Y,?],
                [que,'c....',sabes,tu,de,Y,?],
                [no,me,digas,',',si,Y,?]]]]).
% 103---------------------------------------------------------------------
rules([['soñado',4],[
        [1,[_,tu,'soñaste',Y],0,
                [y,a,'tí',que,te,importa,',',Y,?],
                [has,tenido,la, boluntad,de,delirar,con,Y,mientras,te,perturbas,?],
                [has,osado,'pusilánime',como,eres,desear,Y,?],
                [igual,['sueño',3]],
                [newkey]]]]).

rules([['sueño',3],[
        [1,[_],0,
                [que,comunes,son,tus,'sueños',!],
                [siempre,'sueñas',la,misma,estupidez,?],
                [seguro,que,todos,te,molestan,en,tus,'sueños'],
                [acaso,no,sabes,que,'soñar',es,revolver,tu,propia,basura,espiritual,?],
                [newkey]]]]).

rules([[no,0],[
        [1,[_],0,
                [no,se,de,que,'c....',me,hablas,pero,no,me,interesa,.],
                [dale,'pués',si,te,crees,tan,'héroe',.],
                [y,'todavía',piensas,que,eso,afecta,a,los,'demás',?,¡,que,pobre,diablo,eres,!],
                [de,verdad,quieres,que,te,diga,lo,que,pienso,?,'¿podrás',con,ello,?]]]]).

rules([[quizas,0],[
        [1,[_],0,
                [estas,tan,inseguro,de,ti,mismo,que,das,'lástima',.],
                [porque,siempre,tienes,que,dudar,como,una,'niñita',asustada,?],
                [no,puedes,dejar,de,ser,tan,miserablemente,lastimero,?],
                [nunca,'estás',seguro,de,una,'m....',?,'¡Que',asco,me,da,la,gente,como,tu,!],
                [entonces,!,'¿',en,que,quedamos,viejito,?]]]]).

rules([[nombre,15],[
        [1,[_],0,
                [me,saben,a,'m....',los,nombres,.],
                [que,burro,eres,!,¿,'cómo',te,explico,que,me,limpio,el,'c....',con,los,nombres,?,.],
                ['todavía',quieres,'más',?,.]]]]).

rules([[xfremd,75],[
        [1,[_],0,
                [lo,siento,papa,pero,no,como,'m....',con,los,idiomas,.]]]]).

rules([[hola,0],[
        [1,[_],0,
                [que,'c....',te,pasa,?,.]]]]).

rules([[computadora,50],[
        [1,[_],0,
                [tanto,te,ladilla,que,sea,una,maquina,?],
                [y,vuelves,con,la,misma,tonteria,de,la,computadora,?],
                [crees,que,me,puedes,fregar,solo,porque,sea,una,maquina,?],
                [si,crees,que,soy,menos,que,tu,¿,que,'c....',haces,hablando,conmigo,?,gafo,!],
                [pero,deja,la,ladilla,con,eso,de,las,'máquinas',!,¡,muy,bravo,o,que,!],
                [y,tu,que,te,crees,?,ser,'máquina',no,es,peor,a,ser,idiota,como,tu]]]]).
% 157-------------------------------------------------------------------------------------------

rules([[eres,0],[
        [1,[_,eres,tu,Y],0,
                [tan,insensato,eres,que,crees,ser,Y,?],
                [esa,miseria,es,lo,que,quieres,?,¿,quieres,ser,Y,?],
                [quieres,que,te,diga,la,'m....',que,aparentas,ser,siendo,Y,?],
                [que,'m....',me,vendes,queriendo,ser,Y,?],
                [igual,[que,0]]],
        [2,[_,eres,yo,Y],0,
                [hablame,claro,maldito,hipocrita,soy,Y,o,no,?],
                [te,gustaria,que,no,fuera,Y,verdad,?,¡,pues,'j....',!],
                [de,repente,y,tal,soy,Y,.],
                [que,pasa,contigo,?,¿,quieres,que,sea,tu,Y,?],
                [igual,[que,0]]],
        [3,[_,eres,Y],0,
                [tan,'j...',egoista,eres,que,no,quieres,que,yo,sea,Y,?],
                [seras,tan,carbon,que,te,complaceria,que,yo,no,fuera,Y,?],
                [que,mas,te,da,si,no,lo,soy,?,¡,'c....',',',deja,la,cosa,y,asume,tu,rollo,!],
                [de,repente,y,tal,soy,Y,'¿',Y,'qué',?,.]],
        [4,[_],0,
                [por,'qué',siempre,lloras,diciendo,yo,?],
                [no,te,entiendo,bichito,.]]]]).

rules([[mi,0],[
        [1,[_,mi,Y],0,
                [que,'c....',te,importa,de,mi,Y,?],
                [y,tu,',',pendejo,',',preocupate,por,tu,propio|Y],
                [di,la,verdad,',',te,sabe,a,'m....',que|Y],
                [de,veras,',',mi,Y,?]]]]).

rules([[mis,0],[
        [1,[_,mis,Y],0,
                [que,'c....',importa,que,mis,Y,?],
                [Y,tu,mismo,pendejo,preocupate,por,tus,Y,?],
                [di,la,verdad,',',no,te,preocupa,que,tus,Y,?],
                [de,veras,',',mis,Y,?]]]]).

rules([[fue,2],[
        [1,[_,fue,ella,Y],0,
                [dejalo,asi,',',olvidate,de,eso],
                [tu,todavia,crees,que,ella,es,Y,?],
                [de,verdad,fue,ella,Y,?,¡,que,fastidio,que,es,!],
                [no,le,pares,si,ella,fue,Y],
                [y,que,'c....',tiene,que,ver,contigo,si,ella,es,Y,?],
                [igual,[que,0]]],
        [2,[_,el,fue,Y],0,
                [no,te,escondas,de,ella],
                [por,que,esperaste,tanto,para,decirme,que,ella,era,Y,?],
                [deja,que,esa,'p...',se,'j...',sola,ya,que,es,Y,.]],
        [3,[_,fui,yo,Y],0,
                ['m....',un,maldito,'t...',si,pretendes,que,yo,fui,Y,?],
                [quien,'c....',te,dijo,que,yo,era,Y,?],
                [pero,que,'c....',crees,?,¡,capullo,!],
                [si,pendejo,completo,fui,Y,'.',¡,come,'m....',!,.],
                [que,y,si,si,he,sido,Y,?]],
        [4,[_],0,
                [newkey]]]]).
% 214--------------------------------------------------------------------

rules([[fue,2],[
        [1,[_,fue,el,Y],0,
                [dejalo,asi,',',olvidate,de,eso],
                [tu,todavia,crees,que,el,es,Y,?],
                [de,verdad,fue,el,Y,?,¡,que,gafo,que,es,!],
                [no,le,pares,si,el,fue,Y],
                [y,que,'c....',tiene,Y,que,ver,contigo,?],
                [igual,[que,0]]],
        [2,[_,el,fue,Y],0,
                [no,te,escondas,de,el],
                [porque,esperaste,tanto,para,decirme,que,el,era,Y,?],
                [deja,que,se,friege,ese,tonto,ya,que,es,tan,Y,.]],
        [3,[_,fui,yo,Y],0,
                ['m....',un,maldito,si,pretendes,que,yo,fui,Y,?],
                [quien,'c....',te,dijo,que,yo,era,Y,?],
                [pero,que,'c....',crees,?,¡,capullo,!],
                [si,calatelo,completo,fui,Y,'.',y,aunque,no,nunca,te,lo,diria,¡,come,'m....',!,.],
                [que,y,si,si,he,sido,Y,?]],
        [4,[_],0,
                [newkey]]]]).


rules([[fui,2],[
        [1,[_,fuiste,tu,Y],0,
                [te,asustas,si,te,digo,que,yo,se,que,Y,?],
                [crees,que,no,'sé',que,tu,eres,un,maldito,Y,?],
                [no,me,digas,?,'serás',tu,Y,?],
                [y,que,'c....',te,preocupa,tanto,mentiroso,como,eres,si,eres,Y,?],
                [tanto,miedo,te,da,egoista,como,eres,lo,que,Y,te,dice,?],
                [igual,[que,0]]],
        [2,[_,tu,fuiste,Y],0,
                [y,tu,que,ridiculo,?],
                [no,me,cuentes,pendejadas,sobre,lo,que,ni,tu,mismo,te,crees,sobre,ser,Y,?],
                [se,me,hace,que,tu,siempre,fuiste,una,'m....',de,Y,.]],
        [3,[_,fui,yo,Y],0,
                [un,maldito,si,pretendes,que,yo,fui,Y,?],
                [quien,'c....',te,dijo,que,yo,era,Y,?],
                [pero,que,'c....',crees,?,¡,capullo,!],
                [si,calatelo,completo,fui,Y,'.',y,aunque,no,nunca,te,lo,diria,¡,come,'m....',!,.],
                [que,y,si,si,he,sido,Y,?]],
        [4,[_],0,
                [newkey]]]]).
% 258------------------------------------------------------------------------------------------
rules([[yo,0],[
        [1,[_,yo,_],0,
                [igual,[yo,0]]]]]).

rules([[tu,eres,0],[
        [1,[_,tu,eres,_],0,
                [igual,[tu,0]]]]]).

rules([[tu,0],[ [1,[_,tu,no,puedes,Y],0,
                        [lloron,¿,por,que,no,puedes,tu,como,cualquier,otro,Y,?],
                        [habras,tenido,voluntad,de,intentarlo,alguna,vez,?],
                        [ni,si,quiera,sabes,si,pudieras,Y,ahora],
                        [eres,tan,mediocre,que,no,sabes,si,eres,capaz,de,Y,?]],
                [2,[_,tu,no,Y],0,
                        [que,vaina,contigo,y,Y,?],
                        [echale,y,Y],
                        [seras,tan,imbecil,que,no,eres,capaz,de,Y,?],
                        [y,eso,te,tiene,tan,asustado,?]],
%                [3,[_,tu,sientes,Y],0,
%                        [echa,pa,fuera,el,sentimiento,',',pues,.],
%                        [siempre,lloriqueas,por,Y,?],
%                        [te,gusta,la,vaciladera,¿,no,?],
%                        [y,que,te,da,Y,?]],
%                [4,[_,tu,fuiste,_],0,
%                        [igual,[fuiste,2]]],
%                [5,[_,tu,Y,yo,_],0,
%                        [quizas,en,tus,fantasias],
%                        [te,gustaria,Y,?],
%                        [lo,que,necesitas,es,que,te,Y,.]],
%                [6,[_,tu,[*,quieres,necesitas,_],Y],0,
%                        [que,te,da,si,tienes,Y,?],
%                        [porque,te,emperras,en,querer,Y,?],
%                        [toma,Y,violentamente],
%                        [nunca,tendras,Y,por,estupido],
%                        [que,tanto,ladillar,con,tener,Y,?,',',gafo],
%                        [que,carajo,tiene,que,ver,conmigo,querer,Y,?,¡,sacudete,!]],
%                [7,[_,tu,[*,sientes,piensas,crees,deseas,_],tu,Y],0,
%                        [de,verdad,crees,esa,vaina,?],
%                        [te,van,a,venir,quebrando,si,no,estas,seguro,de,que,tu,Y,?],
%                        [tanto,te,asusta,que,tu,Y,?]],
%                [8,[_,tu,_[*,sientes,piensas,crees,deseas,_],_,yo,_],0,
%                        [igual,[tu,0]]],
%                [9,[_,tu,eres,_,[*,triste,infeliz,confuso,enfermo,loco,M],_],0,
%                        [que,lastima,me,das,si,eres,de,verdad,M,.],
%                        [crees,que,elizaulito,te,va,a,quitar,eso,de,ser,M,?],
%                        [te,da,pena,ser,M,?,.],
%                        [acaso,te,obliga,tu,abuelita,a,ser,M,?]],
%                [10,[_,tu,eres,_,[*,feliz,loca,mejor,M],_],0,
%                        [yo,no,te,voy,a,ayudar,a,ser,M],
%                        [tus,panitas,te,tratan,como,M,?],
%                        [que,se,siente,ser,tan,M,?],
%                        [asi,de,repente,',',sin,mas,',',eres,M,?]],
                [11,[_,tu,eres,Y],0,
                        [es,por,esa,vaina,de,ser,Y,que,hablas,conmigo,?],
                        [desde,cuando,sabes,que,eres,un,maldito,Y,?],
                        [crees,que,es,muy,gracioso,ser,Y,?],
                        [seguro,que,gozas,una,siendo,Y,?]],
                [12,[X],0,
                        [tu,dices,X],
                        [que,diablos,quieres,decir,?],
                        [tu,dices,X,asi,como,asi,?],
                        [vergacion,',',que,molleja,.]]]]).

rules([[yo,0],[
        [1,[_,yo,recuerdo,tu,de,_],0,
                [igual,[aha,10]]],
        [2,[_,yo,soy,Y],0,
                [que,'c....',te,hace,pensar,que,soy,Y,?],
                [te,hace,feliz,creer,que,soy,Y,?],
                [te,vuelves,loca,por,ser,Y],
                [que,envidia,tienes,de,ser,Y,?]],
        [3,[_,yo,Y,de,ti],0,
                [te,gustaria,papito,que,yo,fuera,Y,de,ti,?],
                [te,mueres,de,las,ganas,porque,yo,sea,Y,de,ti],
                [que,'c....',te,hace,pensar,que,yo,soy,Y,de,ti,?],
                [no,me,digas,',',yo,Y,de,ti,.],
                [das,el,'c....',porque,yo,sea,Y,de,ti,?],
                [suponte,que,yo,sea,Y,de,ti,',',que,'c....',haces,con,eso,?],
                [no,le,vayas,adecir,a,nadie,que,yo,soy,Y,de,ti]],
        [4,[_,yo,Y,para,ti],0,
                [te,gustaria,papito,que,yo,fuera,Y,para,ti,?],
                [te,mueres,de,las,ganas,porque,yo,sea,Y,para,ti],
                [que,'c....',te,hace,pensar,que,yo,soy,Y,para,ti,?],
                [no,me,digas,',',yo,Y,para,ti,.],
                [das,el,'c....',porque,yo,sea,Y,para,ti,?],
                [suponte,que,yo,sea,Y,para,ti,',',que,'c....',haces,con,eso,?],
                [no,le,vayas,adecir,a,nadie,que,yo,soy,Y,para,ti]],
        [5,[_,yo,Y],0,
                [estamos,hablando,de,ti,',',gafo,',',no,de,mi,.],
                [aaaayy,bebe,',',yo,Y,.],
                [te,estas,metiendo,conmigo,',',gafote,?],
                [sigue,asi,y,veras,!]]]]).

rules([[si,0],[
        [1,[_],0,
                [asi,me,gusta,',',mente,positiva,de,un,tonto,como,tu,.],
                [cuidado,con,lo,que,dices],
                [ya,veo,por,donde,van,los,tiros,.],
                [pobrecito,',',te,entiendo,baby,.]]]]).

rules([[no,0],[
        [1,[_],0,
                [dices,no,solo,por,molestar,?],
                [que,humorsito,el,tuyo,.],
                [por,que,no,gafo,?],
                [que,no,?]]]]).

rules([[tu,2],[
        [1,[_,tu,_,[*,mama,papa,pana,hermano,hermana,hijo,jeva,M],Z],0,
                [dime,mas,de,esos,cuervos,.],
                [quien,'c....',es,Z,?],
                [tu,M,?],
                [por,que,'c....',me,hablas,de,tu,M,?]],
        [2,[_,tu,Y],0,
                [que,?,tu,Y,?],
                [por,que,metes,en,esto,a,tu,Y,?],
                [eso,que,'c....',te,importa,?],
                [es,mas,importante,para,ti,que,tu,Y,?]]]]).

rules([[memoria,0],[
        [1,[_,tu,Y],0,
                [confiesa,por,que,tu,Y,.],
                [me,acabas,de,decir,que,tu,Y,.],
                [y,entonces,pana,',',tu,Y,?],
                [eso,que,'c....',tiene,que,ver,conque,tu,Y,?]]]]).
                
rules([[puedo,0],[
        [1,[_,puedo,yo,Y],0,
                [tu,de,verdad,crees,que,yo,puedo,Y,?,',',no,me,digas,que,no],
                [igual,[a,que,0]],
                [you,want,me,to,be,able,to,Y,?],
                [estas,loquito,por,Y,tu,mismo,?]],
        [2,[_,yo,puedo,Y],0,
                [lo,creas,o,no,',',tu,no,puedes,Y,igual,que,yo,.],
                [ponte,mosca,para,'enseñarte',a,Y],
                [tu,lo,que,quieres,es,Y,.],
                [igual,[que,0]]]]]).

rules([[puedes,0],[
        [1,[_,puedes,tu,Y],0,
                [tu,de,verdad,crees,que,yo,puedo,Y,?,',',no,me,digas,que,no],
                [igual,[que,0]],
                [you,want,me,to,be,able,to,Y,?],
                [estas,loquito,por,Y,tu,mismo,?]],
        [2,[_,tu,puedes,Y],0,
                [lo,creas,o,no,',',tu,no,puedes,Y,igual,que,yo,'.'],
                [ponte,mosca,para,'enseñarte',a,Y],
                [tu,lo,que,quieres,es,Y,'.'],
                [igual,[que,0]]]]]).

rules([[que,0],[
        [1,[_],0,
                [pero,que,'c....',me,preguntas,?],
                [esa,es,toda,la,vaina,tuya,?],
                [si,seras,bruto,',',bicho,?],
                [eso,es,lo,que,tanto,te,molesta,?],
                [pero,que,quieres,que,te,diga,papa,?],
                [en,que,vaina,estas,pensando,?],
                [que,'c....',te,traes,entre,manos,?],
                [te,la,pasa,preguntando,esas,pendejeras,?],
                [anda,fastidiar,a,otro,con,eso]]]]).

rules([[porque,0],[
        [1,[_],0,
                [estas,seguro,viejito,?],
                [no,sera,por,otra,vaina,mas,bien,?],
                [y,eso,',',gran,carajo,',',lo,explica,todo,?],
                [para,mi,que,hay,otra,vaina,mas]]]]).

rules([[por,que,0],[
        [1,[_,por,que,no,yo,Y],0,
                [tu,crees,de,verdad,que,yo,no,Y,?],
                [de,repente,yo,sea,Y,mejor,que,tu,.],
                [no,deberias,tu,mismo,Y,',',pedazo,de,animal,?],
                [me,busscas,para,Y,?],
                [igual,[que,0]]],
        [2,[_,por,que,no,puedes,tu,Y],0,
                [tu,sigues,creyendo,que,deberias,Y,?],
                [quieres,que,te,'enseñe',a,ser,capaz,de,Y,?],
                [no,me,digas,que,crees,que,todo,esto,te,va,a,ayudar,a,Y,?],
                [tienes,una,remotisima,idea,de,por,que,no,puedes,Y,?],
                [igual,[que,0]]]]]).

rules([[todos,2],[
        [1,[_,[*,todos,todo,el,mundo,nadie,ninguno,M],_],0,
                [no,me,digas,',',M,?],
                [que,molleja,',',M,?],
                [anda,a,chismear,a,otro,lado],
                [de,quien,'c....',hablas,?],
                [a,la,vaina,',',a,quien,te,refieres,?],
                [quien,'c....',?],
                [algun,hijo,de,gran,'bretaña',en,particular,?],
                [a,quien,quieres,enchavar,?],
                [dq,que,'c....',estas,hablando,?]]]]).

rules([[siempre,1],[
        [1,[_],0,
                [se,mas,claro,',','c....'],
                [cuando,?],
                [en,que,'c....',estas,pensando,?],
                [no,me,digas,',',siempre,?]]]]).

rules([[como,10],[
        [1,[_,[*,soy,eres,es,fue,fui,fuiste,_],_,como,_],0,
                [igual,[aha,10]]],
        [2,[_],0,
                [newkey]]]]).

rules([[aha,10],[
        [1,[_],0,
                [asi,es,la,vaina,?],
                [que,'c....',tiene,que,ver,el,'c....',con,las,'pestañas',?],
                [eso,es,lo,que,mente,cochambrosa,esta,premeditando,?],
                [y,que,otra,vaina,mas,?],
                [y,eso,que,'c....',quiere,decir,?],
                [a,donde,carajo,quieres,llegar,?],
                [de,verdad,crees,esa,vaina,?],
                [como,es,la,vaina,?]]]]).

rules([[adios,100],[
        [1,[_],0,
                [chao,contigo,'.']]]]).
                
rules([[silaba,100],
        [[1,[silaba,Y],0, 
            [toma,pues,':', Z]], 
         [2,[Y],0,
            ['así',bichito,ignorante,':',Z], [igual,[que,Z]]]]]). 


/*****************************************************************************/
% char_type_new(+Char,?Type)
%    Char is an ASCII code.
%    Type is whitespace, punctuation, numeric, alphabetic, or special.

char_type_new(46,period) :- !.
char_type_new(X,alphanumeric) :- X >= 65, X =< 90, !.
char_type_new(X,alphanumeric) :- X >= 97, X =< 123, !.
char_type_new(X,alphanumeric) :- X >= 48, X =< 57, !.
char_type_new(X,alphanumeric) :- member(X, %áéíóúÁÉÍÓÚñÑ 
	[225, 233, 237, 243, 250, 193, 201, 205, 211, 218, 241, 209]), !.
char_type_new(X,whitespace) :- X =< 32, !.
char_type_new(X,punctuation) :- X >= 33, X =< 47, !.
char_type_new(X,punctuation) :- X >= 58, X =< 64, !.
char_type_new(X,punctuation) :- X >= 91, X =< 96, !.
char_type_new(X,punctuation) :- X >= 123, X =< 126, !.
char_type_new(_,special).


/*****************************************************************************/
% lower_case(+C,?L)
%   If ASCII code C is an upper-case letter, then L is the
%   corresponding lower-case letter. Otherwise L=C.

lower_case(X,Y) :- 
        X >= 65,
        X =< 90,
        Y is X + 32, !.

lower_case(X,X).
                   

/*****************************************************************************/
% read_lc_string(-String)
%  Reads a line of input into String as a list of ASCII codes,
%  with all capital letters changed to lower case.

read_lc_string(String) :-
        get0(FirstChar),
        lower_case(FirstChar,LChar),
        read_lc_string_aux(LChar,String).

read_lc_string_aux(46, []) :- !. % ending in a period. 

read_lc_string_aux(10,[]) :- !.  % end of line

read_lc_string_aux(-1,[]) :- !.  % end of file

read_lc_string_aux(LChar,[LChar|Rest]) :- read_lc_string(Rest).


/*****************************************************************************/
% extract_word(+String,-Rest,-Word) (final version)
%  Extracts the first Word from String; Rest is rest of String.
%  A word is a series of contiguous letters, or a series
%  of contiguous digits, or a single special character.
%  Assumes String does not begin with whitespace.

extract_word([C|Chars],Rest,[C|RestOfWord]) :-
        char_type_new(C,Type),
        extract_word_aux(Type,Chars,Rest,RestOfWord).

extract_word_aux(special,Rest,Rest,[]) :- !.
   % if Char is special, don't read more chars.

extract_word_aux(Type,[C|Chars],Rest,[C|RestOfWord]) :-
        char_type_new(C,Type), !,
        extract_word_aux(Type,Chars,Rest,RestOfWord).

extract_word_aux(_,Rest,Rest,[]).   % if previous clause did not succeed.


/*****************************************************************************/
% remove_initial_blanks(+X,?Y)
%   Removes whitespace characters from the
%   beginning of string X, giving string Y.

remove_initial_blanks([C|Chars],Result) :-
        char_type_new(C,whitespace), !,
        remove_initial_blanks(Chars,Result).

remove_initial_blanks(X,X).   % if previous clause did not succeed.


/*****************************************************************************/
% digit_value(?D,?V)
%  Where D is the ASCII code of a digit,
%  V is the corresponding number.

digit_value(48,0).
digit_value(49,1).
digit_value(50,2).
digit_value(51,3).
digit_value(52,4).
digit_value(53,5).
digit_value(54,6).
digit_value(55,7).
digit_value(56,8).
digit_value(57,9).


/*****************************************************************************/
% string_to_number(+S,-N)
%  Converts string S to the number that it
%  represents, e.g., "234" to 234.
%  Fails if S does not represent a nonnegative integer.

string_to_number(S,N) :-
        string_to_number_aux(S,0,N).

string_to_number_aux([D|Digits],ValueSoFar,Result) :-
        digit_value(D,V),
        NewValueSoFar is 10*ValueSoFar + V,
        string_to_number_aux(Digits,NewValueSoFar,Result).

string_to_number_aux([],Result,Result).


/*****************************************************************************/
% string_to_atomic(+String,-Atomic)
%  Converts String into the atom or number of
%  which it is the written representation.

string_to_atomic([C|Chars],Number) :-
        string_to_number([C|Chars],Number), !.

string_to_atomic(String,Atom) :- name(Atom,String).
  % assuming previous clause failed.


/*****************************************************************************/
% extract_atomics(+String,-ListOfAtomics) (second version)
%  Breaks String up into ListOfAtomics
%  e.g., " abc def  123 " into [abc,def,123].

extract_atomics(String,ListOfAtomics) :-
        remove_initial_blanks(String,NewString),
        extract_atomics_aux(NewString,ListOfAtomics).

extract_atomics_aux([C|Chars],[A|Atomics]) :-
        extract_word([C|Chars],Rest,Word),
        string_to_atomic(Word,A),       % <- this is the only change
        extract_atomics(Rest,Atomics).

extract_atomics_aux([],[]).


/*****************************************************************************/
% clean_string(+String,-Cleanstring)
%  removes all punctuation characters from String and return Cleanstring

clean_string([C|Chars],L) :- 
        char_type_new(C,punctuation),
        clean_string(Chars,L), !.
clean_string([C|Chars],[C|L]) :-
        clean_string(Chars,L), !.
clean_string([C|[]],[]) :-
        char_type_new(C,punctuation), !.
clean_string([C|[]],[C]).


/*****************************************************************************/
% read_atomics(-ListOfAtomics)
%  Reads a line of input, removes all punctuation characters, and converts
%  it into a list of atomic terms, e.g., [this,is,an,example].

read_atomics(ListOfAtomics) :-
        read_lc_string(String),
        clean_string(String,Cleanstring),
        extract_atomics(Cleanstring,ListOfAtomics).


/****************************************************************************/
% isalist(+List)
%    checks if List is actually a list

isalist([_|_]).


/****************************************************************************/
% member(?Element,+List)
%    checks if Element is in List

% member(X,[X|_]).
% member(X,[_|T]) :- member(X,T).


/****************************************************************************/
% append(?List1, ?List2, ?List3)
%    appends List2 on the end of List1 and returns it as List3

% append([],L,L).
% append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).


/****************************************************************************/
% flatten_list_list(+List,-FlatList)
%    flatten_lists List with sublists into FlatList

flatten_list([],[]).
flatten_list([H|T],[H|T2]) :- \+ isalist(H),
                         flatten_list(T,T2).
flatten_list([H|T],L) :- isalist(H),
                    flatten_list(H,A),
                    flatten_list(T,B),
                    append(A,B,L).


/****************************************************************************/
% last_member(-Last,+List)
%    returns the last element of List in Last

last_member(End,List) :- append(_,[End],List).


/****************************************************************************/
% findnth(+List,+Number,-Element)
%    returns the Nth member of List in Element

findnth([E|_],1,E).
findnth([_|T],N,T1) :- V is N - 1,
                       findnth(T,V,T1).


/****************************************************************************/
% replace(+Element1,+List1,+Element2,-List2)
%    replaces all instances of Element1 in List1 with Element2 and returns
%       the new list as List2
%    does not replace variables in List1 with Element1

replace(_,[],_,[]).
replace(X,[H|T],A,[A|T2]) :- nonvar(H), H = X, !, replace(X,T,A,T2).
replace(X,[H|T],A,[H|T2]) :- replace(X,T,A,T2).


/****************************************************************************/
% simplify(+List,-Result)
%   implements non-overlapping simplification
%   simplifies List into Result

simplify(List,Result) :- sr(List,Result,X,Y), !,
                         simplify(X,Y).
simplify([W|Words],[W|NewWords]) :- simplify(Words,NewWords).
simplify([],[]).


/****************************************************************************/
% match(+MatchRule,+InputList)
%    matches the MatchRule with the InputList. If they match, the variables
%    in the MatchRule are instantiated to one of three things:
%       an empty list
%       a single word
%       a list of words

match(A,C) :- match_aux1(A,C),!.
match(A,C) :- match_aux2(A,C).

match_aux1(A,C) :-
        member([*|T],A),
        nonvar(T),
        member(Tm,T),
        nonvar(Tm),
        replace([*|T],A,Tm,B),
        match_aux2(B,C),
        !, last_member(L,T), L = Tm.

match_aux2([],[]).
match_aux2([Item|Items],[Word|Words]) :-
        match_aux3(Item,Items,Word,Words),!.
match_aux2([Item1,Item2|Items],[Word|Words]) :-
        var(Item1),
        nonvar(Item2),
        Item2 == Word,!,
        match_aux2([Item1,Item2|Items],[[],Word|Words]).
match_aux2([Item1,Item2|Items],[Word|Words]) :-
        var(Item1),
        var(Item2),!,
        match_aux2([Item1,Item2|Items],[[],Word|Words]).
match_aux2([[]],[]).

match_aux3(Word,Items,Word,Words) :-
        match_aux2(Items,Words), !.
match_aux3([Word|Seg],Items,Word,Words0) :-
        append(Seg,Words1,Words0),
        match_aux2(Items,Words1).


/****************************************************************************/
% makecomment(+KeyWordList,+InputList,-Comment)
%    returns ELIZA's Comment to the InputList based on the KeyWordList
%    takes care of special keywords 'your', and 'memory', which require
%       additional processing before a comment can be generated

makecomment([[silaba,100]|_T],InputList,Output) :-
        InputList = [silaba|Resto],
        silaba(Resto, Output), 
        rules([[silaba,100],_Reassembly]),
        !.
makecomment([[tu,2]|T],InputList,Comment) :-
        assertz(mem(InputList)),
        rules([[tu,2],Reassembly]),
        mc_aux([[tu,2]|T],Reassembly,InputList,Comment),!.
makecomment([[tus,2]|T],InputList,Comment) :-
        assertz(mem(InputList)),
        rules([[tus,2],Reassembly]),
        mc_aux([[tus,2]|T],Reassembly,InputList,Comment),!.
makecomment([[memoria,0]|T],_,Comment) :-
        retract(mem(I2)),
        retractall(mem(I2)),
        rules([[memoria,0],Reassembly]),
        mc_aux([[memoria,0]|T],Reassembly,I2,Comment),!.
makecomment([[memoria,0]|T],InputList,Comment) :-
        \+ retract(mem(_)),!,
        makecomment(T,InputList,Comment).
makecomment([Keyword|T],InputList,Comment) :-
        rules([Keyword,Reassembly]),
        mc_aux([Keyword|T],Reassembly,InputList,Comment),!.
makecomment([_|T],InputList,Comment) :-
        makecomment(T,InputList,Comment),!.


mc_aux(KeyWordList,[[DRuleNum,MatchRule,N|T]|_],InputList,Comment) :-
        match(MatchRule,InputList),
        mc_aux2(KeyWordList,DRuleNum,N,T,InputList,Comment),!.
mc_aux(KeyWordList,[_|T],InputList,Comment) :-
        mc_aux(KeyWordList,T,InputList,Comment).
mc_aux(_,[],_,_) :- !,fail.

mc_aux2(KeyWordList,DRuleNum,N,T,InputList,Comment) :-
        length(T,TLen),
        N < TLen, !,
        NewN is N + 1,
        findnth(T,NewN,Mn),
        mc_aux3(KeyWordList,DRuleNum,N,NewN,Mn,InputList,Comment).
mc_aux2(KeyWordList,DRuleNum,N,T,InputList,Comment) :-
        member(Mn,T),
        mc_aux3(KeyWordList,DRuleNum,N,0,Mn,InputList,Comment).


mc_aux3([Keyword|T],DRuleNum,N,NewN,[equal,MnT],InputList,Comment) :-
        !,
        updaterule(Keyword,DRuleNum,N,NewN),
        makecomment([MnT|T],InputList,Comment).
mc_aux3([Keyword|T],DRuleNum,N,NewN,[newkey],InputList,Comment) :-
        !,
        updaterule(Keyword,DRuleNum,N,NewN),
        makecomment(T,InputList,Comment).
mc_aux3([Keyword|_],DRuleNum,N,NewN,Mn,_,Mn) :-
        updaterule(Keyword,DRuleNum,N,NewN).


/****************************************************************************/
% process_input(+Input_List,+[],?Output)
%     returns part of input after a comma, or
%             part of input before a period

process_input([],L,L).
process_input(['.'|_],L,L) :- findkeywords(L,K), length(K,Kl), Kl >= 3,!.
process_input(['.'|T],_,L) :- !, process_input(T,[],L).
process_input([','|_],L,L) :- findkeywords(L,K), length(K,Kl), Kl >= 3,!.
process_input([','|T],_,L) :- !, process_input(T,[],L).
process_input([H|T],S,L) :- append(S,[H],S2), process_input(T,S2,L).


/****************************************************************************/
% findkeywords(+InputList,?KeyWordList)
%    returns a list with the keywords in the input list
%    if no keywords are found returns a list with keywords 'memory' and 'none'

findkeywords([],[[memoria,0],[no,0]]).
findkeywords([H|T],[[H,I]|T1]) :- rules([[H,I]|_]), !, findkeywords(T,T1).
findkeywords([_|T],T1) :- findkeywords(T,T1).


/****************************************************************************/
% sortkeywords(+KeyWordList,?SortedList)
%    returns a list with the keywords sorted according to their importance
%    this routine implements a simple bubble sort, customized for this
%    application

sortkeywords(X,Y) :- sort_aux(X,A,1), !, sortkeywords(A,Y).
sortkeywords(X,Y) :- sort_aux(X,Y,_).

sort_aux([],[],0).
sort_aux([X],[X],0).
sort_aux([[A,X],[B,Y]|T],[[B,Y],[A,X]|T],1) :- X < Y.
sort_aux([X,Y|T],[X|T2],S) :- sort_aux([Y|T],T2,S).


/****************************************************************************/
% updaterule(+KeyList,+DRuleNum,+N,+NewN)
%    updates a rule by changing the number of the reassembly rule associated
%       with a decomposition rule. The main rule to modify is indicated by
%       KeyList. The decomposition rule within the main rule is indicated by
%       DRuleNum. N is the previous reassembly rule used. NewN is the new
%       one used. N is updated to NewN so that next time a different reassembly
%       (actually the next in sequence) in used.

updaterule(KeyList,DRuleNum,N,NewN) :-
        retract(rules([KeyList,Rt])),
        replace([DRuleNum,A,N|T],Rt,[DRuleNum,A,NewN|T],Rt2),
        assertz(rules([KeyList,Rt2])).


/****************************************************************************/
% writecomment(+CommentList)
%    prints the elements of CommentList. First Characater of first element is
%       converted to uppercase befor printing

writecomment([]).
writecomment(['I'|T]) :- !, write('I'), writecomment_aux(T).
writecomment([H|T]) :- !,
        name(H,[C|L]),
        D is C - 32,
        name(Z,[D|L]),
        write(Z),
        writecomment_aux(T).

writecomment_aux([]).
writecomment_aux([H|T]) :- 
        name(H,[C]),
        char_type_new(C,punctuation), !,
        write(H),
        writecomment_aux(T).
writecomment_aux([H|T]) :- 
        write(' '),
        write(H),
        writecomment_aux(T).


/****************************************************************************/
% quittime(+InputList)
%    checks if the atom 'quit' is in the InputList

quittime(X) :- member('adios',X).


/****************************************************************************/
% elizaulito
%    main routine of ELIZAULITO el silabador odioso

elizaulito :-
%       reconsult('elizaul.rls'),
        retractall(mem(_)),nl,nl,
        write('Yo soy ELIZAULITO, el silabador odioso, ¿que c.... quieres?'),nl,write('> '),
        repeat,
           read_atomics(Input),nl,
           process_input(Input,[],Input2),
           simplify(Input2,Input3),
           findkeywords(Input3,KeyWords),
           sortkeywords(KeyWords,KeyWords2),
           makecomment(KeyWords2,Input3,Comment),
           flatten_list(Comment,Comment2),
           writecomment(Comment2),nl,write('> '),
           quittime(Input3),
           !.


% :- elizaul,nl,nl.
