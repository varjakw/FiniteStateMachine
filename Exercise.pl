accept(_,Final,Q,[]):- member(Q,Final).
accept(Trans,Final,Q,[H|T]):- member([Q,H,Qn],Trans), accept(Trans,Final,Qn,T).
member(X,[X|_]).
member(X,[_|L]):- member(X,L).
