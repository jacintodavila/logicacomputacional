
repita1(N1,N) :- N1>N. 
repita1(I, N) :- 
  II is I + 1,
  write(II), 
  repita2(II, N), 
  repita1(II, N). 
  
repita2(N1,N) :- N1>N. 
repita2(I, N) :- 
  II is I + 1,
  write(II), 
  repita3(II, N), 
  repita2(II, N).

repita3(N1,N) :- N1>N. 
repita3(I, N) :- 
  II is I + 1, 
  write(II), nl, 
  repita3(II, N).
