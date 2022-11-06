% https://demo.logicalcontracts.com/p/emer.pl
maxTime(2). 
minCycleTime(5).
fluents emergency_at(X,Y).
actions help(_,_). 

events lps_mousedown(_,_,_). 

if emergency_at(X,Y) then help(X,Y).

% rather than detect a click on a fluent, detect a click anywhere:
lps_mousedown(_,XX,YY) initiates emergency_at(X,Y) if X is round(XX/10), Y is round(YY/10).
help(X,Y) terminates emergency_at(X,Y). 


% see https://bitbucket.org/lpsmasters/lps_corner/src/HEAD/swish/2dWord.md?at=master&fileviewer=file-view-default
display(emergency_at(X,Y),[center:[XX,YY], radius:10, type:circle, fillColor:red]) :- 
    XX is X*10, YY is Y*10.

display(help(X,Y),[[center:[XX,YY], radius:10, type:circle, fillColor:green], 
                 [type:arrow, label:'Helped', from:[FX,FY], to:[XX,YY]]]) :- 
    XX is X*10, YY is Y*10, FX is XX+10, FY is YY+10. 

display(timeless,[ 
    % a display spec can be a list of properties (for one object) or a list of lists
    %[type:star, center:[250,150], points:9, radius1:20, radius2:25, fillColor:yellow, sendToBack],
    [type:rectangle, from:[0,0], to:[420,400], sendToBack, fillColor:[0,0.746,1]], % R,G,B
    %[type:ellipse, shadowOffset:5, shadowColor:darkGray , point:[50,150], size:[110, 40],fillColor: white],
    %[type:ellipse,  point:[20,130], size:[90, 30],fillColor: white ],
    [type:text, point:[0,5], content:'Map of Emergencies (Click on)']
]).

/** <examples>
?- serve(Timeline).
*/

