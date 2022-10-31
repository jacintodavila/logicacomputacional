% silabador.pl
%
% Este programa implementa una definición del concepto SILABA para el
% idioma Español. 
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
% Authors:  Luis Astorga Junquera <luisastorga@hotmail.com>, <astorga@intercable.net.ve>
%           Jacinto Davila <jacinto@ula.ve>
%           Jacobo Myerston <myerston@chicago.edu>
%           H. Yelitza Contreras <hyelitza@ula.ve>
%           Melva Marquez <melva@ula.ve>
%           Marilu Parra <mmarilu@ula.ve>
%
% Address: Universidad de Los Andes. Mérida, Venezuela. 
%
% 

silabador(Silabario):- getsentence(Wordlist),silaba(Wordlist,Silabario).

silaba([],[]).
silaba([P|Resto],Silabario):-   name(P,As),sil(As,Silab),
                append(Silab,Silabario1,Silabario),
                silaba(Resto,Silabario1).

sil([],[]).

sil([V1|[]],Silab):-vocal(V1),
                    name(Sil,[V1]),            
                    append([Sil],Silab1,Silab),
            sil([],Silab1).


sil([V1,C1|[]],Silab):-vocal(V1),cons(C1),
                       name(Sil,[V1,C1]),
               append([Sil],Silab1,Silab),
               sil([],Silab1).

sil([C1,V1|[]],Silab):-cons(C1),vocal(V1),
                       name(Sil,[C1,V1]),
               append([Sil],Silab1,Silab),
               sil([],Silab1).

sil([C1,V1,C2|[]],Silab):-cons(C1),vocal(V1),cons(C2),
                       name(Sil,[C1,V1,C2]),
               append([Sil],Silab1,Silab),
               sil([],Silab1).

sil([C1,C2,V1|[]],Silab):-cons(C1),cons(C2),vocal(V1),
                       name(Sil,[C1,C2,V1]),
               append([Sil],Silab1,Silab),
               sil([],Silab1).

sil([C1,C2,V1,C3|[]],Silab):-cons(C1),cons(C2),vocal(V1),cons(C3),
                       name(Sil,[C1,C2,V1,C3]),
               append([Sil],Silab1,Silab),
               sil([],Silab1).

sil([V1,C1,V2|Restopalabra],Silab):- vocal(V1),cons(C1),vocal(V2),
                     name(Sil,[V1]),
                     append([Sil],Silab1,Silab),
                             sil([C1,V2|Restopalabra],Silab1).

sil([C1,V1,C2,V2|Restopalabra],Silab):- cons(C1),vocal(V1),cons(C2),vocal(V2),
                        name(Sil,[C1,V1]),
                        append([Sil],Silab1,Silab),
                                sil([C2,V2|Restopalabra],Silab1).

sil([C1,C2,V1,C3,V2|Restopalabra],Silab):- cons(C1),cons(C2),vocal(V1),cons(C3),vocal(V2),
                           name(Sil,[C1,C2,V1]),
                           append([Sil],Silab1,Silab),
                                   sil([C3,V2|Restopalabra],Silab1).

sil([V1,C1,C2,V2|Restopalabra],Silab):- vocal(V1),cons(C1),cons(C2),vocal(V2),
                            cluster(C1,C2),
                        name(Sil,[V1]),
                        append([Sil],Silab1,Silab),
                                sil([C1,C2,V2|Restopalabra],Silab1).

sil([V1,C1,C2,V2|Restopalabra],Silab):- vocal(V1),cons(C1),cons(C2),vocal(V2),
                            C1=:=C2,
                        name(Sil,[V1]),
                        append([Sil],Silab1,Silab),
                                sil([C1,C2,V2|Restopalabra],Silab1).

sil([V1,C1,C2,V2|Restopalabra],Silab):- vocal(V1),cons(C1),cons(C2),vocal(V2),
                        name(Sil,[V1,C1]),
                        append([Sil],Silab1,Silab),
                                sil([C2,V2|Restopalabra],Silab1).

sil([C1,V1,C2,C3,V2|Restopalabra],Silab):- cons(C1),vocal(V1),cons(C2),cons(C3),vocal(V2),
                               cluster(C2,C3),
                           name(Sil,[C1,V1]),
                           append([Sil],Silab1,Silab),
                                   sil([C2,C3,V2|Restopalabra],Silab1).

sil([C1,V1,C2,C3,V2|Restopalabra],Silab):- cons(C1),vocal(V1),cons(C2),cons(C3),vocal(V2),
                               C2=C3,
                           name(Sil,[C1,V1]),
                           append([Sil],Silab1,Silab),
                                   sil([C2,C3,V2|Restopalabra],Silab1).

sil([C1,V1,C2,C3,V2|Restopalabra],Silab):- cons(C1),vocal(V1),cons(C2),cons(C3),vocal(V2),
                           name(Sil,[C1,V1,C2]),
                           append([Sil],Silab1,Silab),
                                   sil([C3,V2|Restopalabra],Silab1).

sil([C1,C2,V1,C3,C4,V2|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),cons(C3),cons(C4),
                                             vocal(V2),
                                 cluster(C3,C4),
                             name(Sil,[C1,C2,V1]),
                             append([Sil],Silab1,Silab),
                                     sil([C3,C4,V2|Restopalabra],Silab1).

sil([C1,C2,V1,C3,C4,V2|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),cons(C3),cons(C4),
                                             vocal(V2),
                                 C3=C4,
                             name(Sil,[C1,C2,V1]),
                             append([Sil],Silab1,Silab),
                                     sil([C3,C4,V2|Restopalabra],Silab1).

sil([C1,C2,V1,C3,C4,V2|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),cons(C3),cons(C4),
                             vocal(V2),
                             name(Sil,[C1,C2,V1,C3]),
                             append([Sil],Silab1,Silab),
                                     sil([C4,V2|Restopalabra],Silab1).

sil([V1,C1,C2,C3,V2|Restopalabra],Silab):- vocal(V1),cons(C1),cons(C2),cons(C3),vocal(V2),
                                C2=115,
                            name(Sil,[V1,C1,C2]),
                            append([Sil],Silab1,Silab),
                                    sil([C3,V2|Restopalabra],Silab1).

sil([V1,C1,C2,C3,V2|Restopalabra],Silab):- vocal(V1),cons(C1),cons(C2),cons(C3),vocal(V2),
                            name(Sil,[V1,C1]),
                            append([Sil],Silab1,Silab),
                                    sil([C2,C3,V2|Restopalabra],Silab1).

sil([C1,V1,C2,C3,C4,V2|Restopalabra],Silab):- cons(C1),vocal(V1),cons(C2),cons(C3),cons(C4),
                              vocal(V2),
                                  C3=115,
                              name(Sil,[C1,V1,C2,C3]),
                              append([Sil],Silab1,Silab),
                                      sil([C4,V2|Restopalabra],Silab1).

sil([C1,V1,C2,C3,C4,V2|Restopalabra],Silab):-cons(C1),vocal(V1),cons(C2),cons(C3),cons(C4),
                              vocal(V2),
                              name(Sil,[C1,V1,C2]),
                              append([Sil],Silab1,Silab),
                                      sil([C3,C4,V2|Restopalabra],Silab1).
 
sil([C1,C2,V1,C3,C4,C5,V2|Restopalabra],Silab):- cons(C1),cons(C2),vocal(V1),cons(C3),cons(C4),
                                 cons(C5),vocal(V2),
                                     C4=115,
                                 name(Sil,[C1,C2,V1,C3,C4]),
                                 append([Sil],Silab1,Silab),
                                         sil([C5,V2|Restopalabra],Silab1).

sil([C1,C2,V1,C3,C4,C5,V2|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),cons(C3),cons(C4),
                                 cons(C5),vocal(V2),
                                 name(Sil,[C1,C2,V1,C3]),
                                 append([Sil],Silab1,Silab),
                                         sil([C4,C5,V2|Restopalabra],Silab1).

sil([V1,C1,C2,C3,C4,V2|Restopalabra],Silab):-vocal(V1),cons(C1),cons(C2),cons(C3),cons(C4),
                                 vocal(V2),
                                     C2=115,
                                 name(Sil,[V1,C1,C2]),
                                 append([Sil],Silab1,Silab),
                                         sil([C3,C4,V2|Restopalabra],Silab1). 


sil([C1,V1,C2,C3,C4,C5,V2|Restopalabra],Silab):-cons(C1),vocal(V1),cons(C2),cons(C3),cons(C4),
                                                 cons(C5),vocal(V2),
                                     C3=115,
                                 name(Sil,[C1,V1,C2,C3]),
                                 append([Sil],Silab1,Silab),
                                         sil([C4,C5,V2|Restopalabra],Silab1). 


sil([C1,C2,V1,C3,C4,C5,C6,V2|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),cons(C3),
                                 cons(C4),cons(C5),cons(C6),vocal(V2),
                                     C4=115,
                                 name(Sil,[C1,C2,V1,C3,C4]),
                                 append([Sil],Silab1,Silab),
                                         sil([C5,C6,V2|Restopalabra],Silab1). 


sil([C1,V1,V2|[]],Silab):-cons(C1),vocal(V1),vocal(V2),
                          name(Sil,[C1,V1,V2]),            
                          append([Sil],Silab1,Silab),
                  sil([],Silab1).

sil([C1,V1,V2,C2|[]],Silab):-cons(C1),vocal(V1),vocal(V2),cons(C2),
                          name(Sil,[C1,V1,V2,C2]),             
                          append([Sil],Silab1,Silab),
                  sil([],Silab1).

sil([C1,V1,V2,V3|[]],Silab):-cons(C1),vocal(V1),vocal(V2),vocal(V3),
                          name(Sil,[C1,V1,V2,V3]),             
                          append([Sil],Silab1,Silab),
                  sil([],Silab1).

sil([C1,V1,V2,V3,C2|[]],Silab):-cons(C1),vocal(V1),vocal(V2),vocal(V3),cons(C2),
                          name(Sil,[C1,V1,V2,V3,C2]),              
                          append([Sil],Silab1,Silab),
                  sil([],Silab1).

sil([V1,V2,C1,V3|Restopalabra],Silab):- vocal(V1),vocal(V2),cons(C1),vocal(V3),
                                       name(Sil,[V1,V2]),              
                                       append([Sil],Silab1,Silab),
                               sil([C1,V3|Restopalabra],Silab1).

sil([C1,V1,V2,C2,V3|Restopalabra],Silab):- cons(C1),vocal(V1),vocal(V2),cons(C2),vocal(V3),
                                           name(Sil,[C1,V1,V2]),               
                                           append([Sil],Silab1,Silab),
                                   sil([C2,V3|Restopalabra],Silab1).


sil([C1,C2,V1,V2,C3,V3|Restopalabra],Silab):- cons(C1),cons(C2),vocal(V1),vocal(V2),
                           cons(C3),vocal(V3),
                           name(Sil,[C1,C2,V1,V2]),
                           append([Sil],Silab1,Silab),
                                   sil([C3,V3|Restopalabra],Silab1).

sil([V1,V2,C1,C2,V3|Restopalabra],Silab):- vocal(V1),vocal(V2),cons(C1),cons(C2),vocal(V3),
                               cluster(C1,C2),
                           name(Sil,[V1,V2]),
                           append([Sil],Silab1,Silab),
                                   sil([C1,C2,V3|Restopalabra],Silab1).

sil([V1,V2,C1,C2,V3|Restopalabra],Silab):- vocal(V1),vocal(V2),cons(C1),cons(C2),vocal(V3),
                               C1=C2,
                           name(Sil,[V1,V2]),
                           append([Sil],Silab1,Silab),
                                   sil([C1,C2,V3|Restopalabra],Silab1).

sil([V1,V2,C1,C2,V3|Restopalabra],Silab):- vocal(V1),vocal(V2),cons(C1),cons(C2),vocal(V3),
                           name(Sil,[V1,V2,C1]),
                           append([Sil],Silab1,Silab),
                                   sil([C2,V3|Restopalabra],Silab1).

sil([C1,V1,V2,C2,C3,V3|Restopalabra],Silab):- cons(C1),vocal(V1),vocal(V2),cons(C2),
                                              cons(C3),vocal(V3),
                                  cluster(C2,C3),
                              name(Sil,[C1,V1,V2]),
                              append([Sil],Silab1,Silab),
                                      sil([C2,C3,V3|Restopalabra],Silab1).

sil([C1,V1,V2,C2,C3,V3|Restopalabra],Silab):- cons(C1),vocal(V1),vocal(V2),cons(C2),
                                              cons(C3),vocal(V3),
                                  C2=C3,
                              name(Sil,[C1,V1,V2]),
                              append([Sil],Silab1,Silab),
                                      sil([C2,C3,V3|Restopalabra],Silab1).

sil([C1,V1,V2,C2,C3,V3|Restopalabra],Silab):- cons(C1),vocal(V1),vocal(V2),cons(C2),
                             cons(C3),vocal(V3),
                             name(Sil,[C1,V1,V2,C2]),
                             append([Sil],Silab1,Silab),
                                     sil([C3,V3|Restopalabra],Silab1).

sil([C1,C2,V1,V2,C3,C4,V3|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),vocal(V2),
                                cons(C3),cons(C4),vocal(V3),
                                    cluster(C3,C4),
                                name(Sil,[C1,C2,V1,V2]),
                                append([Sil],Silab1,Silab),
                                        sil([C3,C4,V3|Restopalabra],Silab1).

sil([C1,C2,V1,V2,C3,C4,V3|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),vocal(V2),
                                cons(C3),cons(C4),vocal(V3),
                                    C3=C4,
                                name(Sil,[C1,C2,V1,V2]),
                                append([Sil],Silab1,Silab),
                                        sil([C3,C4,V3|Restopalabra],Silab1).

sil([C1,C2,V1,V2,C3,C4,V3|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),vocal(V2),
                                cons(C3),cons(C4),vocal(V3),
                                name(Sil,[C1,C2,V1,V2,C3]),
                                append([Sil],Silab1,Silab),
                                        sil([C4,V3|Restopalabra],Silab1).

sil([V1,V2,C1,C2,C3,V3|Restopalabra],Silab):- vocal(V1),vocal(V2),cons(C1),cons(C2),
                              cons(C3),vocal(V3),
                                  C2=115,
                              name(Sil,[V1,V2,C1,C2]),
                              append([Sil],Silab1,Silab),
                                      sil([C3,V3|Restopalabra],Silab1).

sil([V1,V2,C1,C2,C3,V2|Restopalabra],Silab):- vocal(V1),vocal(V2),cons(C1),cons(C2),
                              cons(C3),vocal(V3),
                              name(Sil,[V1,V2,C1]),
                              append([Sil],Silab1,Silab),
                                      sil([C2,C3,V3|Restopalabra],Silab1).

sil([C1,V1,V2,C2,C3,C4,V3|Restopalabra],Silab):- cons(C1),vocal(V1),vocal(V2),cons(C2),
                              cons(C3),cons(C4),vocal(V3),
                                  C3=115,
                              name(Sil,[C1,V1,V2,C2,C3]),
                              append([Sil],Silab1,Silab),
                                      sil([C4,V3|Restopalabra],Silab1).

sil([C1,V1,V2,C2,C3,C4,V3|Restopalabra],Silab):-cons(C1),vocal(V1),vocal(V2),cons(C2),
                              cons(C3),cons(C4),vocal(V3),
                              name(Sil,[C1,V1,V2,C2]),
                              append([Sil],Silab1,Silab),
                                      sil([C3,C4,V3|Restopalabra],Silab1).
 
sil([C1,C2,V1,V2,C3,C4,C5,V3|Restopalabra],Silab):- cons(C1),cons(C2),vocal(V1),vocal(V2),
                                                 cons(C3),cons(C4),cons(C5),vocal(V3),
                                     C4=115,
                                 name(Sil,[C1,C2,V1,V2,C3,C4]),
                                 append([Sil],Silab1,Silab),
                                         sil([C5,V3|Restopalabra],Silab1).

sil([C1,C2,V1,V2,C3,C4,C5,V3|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),vocal(V2),
                                                 cons(C3),cons(C4),cons(C5),vocal(V3),
                                 name(Sil,[C1,C2,V1,V2,C3]),
                                 append([Sil],Silab1,Silab),
                                         sil([C4,C5,V3|Restopalabra],Silab1).



sil([V1,V2,C1,C2,C3,C4,V3|Restopalabra],Silab):-vocal(V1),vocal(V2),cons(C1),cons(C2),
                                 cons(C3),cons(C4),vocal(V3),
                                     C2=115,
                                 name(Sil,[V1,V2,C1,C2]),
                                 append([Sil],Silab1,Silab),
                                         sil([C3,C4,V3|Restopalabra],Silab1). 


sil([C1,V1,V2,C2,C3,C4,C5,V3|Restopalabra],Silab):-cons(C1),vocal(V1),vocal(V2),cons(C2),
                                 cons(C3),cons(C4),cons(C5),vocal(V3),
                                     C3=115,
                                 name(Sil,[C1,V1,V2,C2,C3]),
                                 append([Sil],Silab1,Silab),
                                         sil([C4,C5,V3|Restopalabra],Silab1). 


sil([C1,C2,V1,V2,C3,C4,C5,C6,V3|Restopalabra],Silab):-cons(C1),cons(C2),vocal(V1),vocal(V2),
                                                 cons(C3),cons(C4),cons(C5),cons(C6),vocal(V3),
                                     C4=115,
                                 name(Sil,[C1,C2,V1,V2,C3,C4]),
                                 append([Sil],Silab1,Silab),
                                         sil([C5,C6,V3|Restopalabra],Silab1). 


sil([C1,V1,V2,V3,C2,V4|Restopalabra],Silab):-cons(C1),vocal(V1),vocal(V2),vocal(V3),
                                             cons(C2),vocal(V4),
                             name(Sil,[C1,V1,V2,V3]),
                             append([Sil],Silab1,Silab),
                                     sil([C2,V4|Restopalabra],Silab1). 
 


cons(C):- member(C,[122,121,120,119,118,116,115,114,113,112,110]).
cons(C):- member(C,[241,109,108,107,106,104,103,102,100,99,98]). 
 



vocal(V):- member(V, [121,117,111,105,101,97] ).

cluster(C1, C2) :- member(C1, [112,116,99,107,102,98,100,103,110]), 
                   member(C2, [108,114,104]).  

%---------------------------------------------------------------------------
getsentence(Wordlist):- get0(Char),
                        getrest(Char, Wordlist).

getrest(46,[]):- !.                          /*fin de oración: 46 = ASCII para '.'*/

getrest(32,Wordlist):- !,                    /*fin de palabra 32 = ASCII para blanco*/
                       getsentence(Wordlist). /*salta el blanco*/

getrest(Letter,[Word|Wordlist]):- 
               getletters(Letter,Letters,Nextchar),/*lee letras de la palabra actual*/
               name(Word,Letters),
               getrest(Nextchar,Wordlist).

getletters(46,[],46):- !.                     /*fin de palabra 46 = punto final*/

getletters(32,[],32):- !.                     /*fin de palabra 32 = blanco*/

getletters(Let,[Let|Letters],Nextchar):- get0(Char),
                                         getletters(Char,Letters,Nextchar).







% los que caminan sobre rios de vino a veces flotan
% cada comarca tiene los fanatismos que se merece
% nada hay mas mágico que la ruta del semen por el que somos

 
