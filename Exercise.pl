accept(_,Final,Q,[]):- member(Q,Final).
accept(Trans,Final,Q,[H|T]):- member([Q,H,Qn],Trans), accept(Trans,Final,Qn,T).
member(X,[X|_]).
member(X,[_|L]):- member(X,L).

% line 2 we see we are at state Q and reading symbol H, and we are going to go to a new state (Qn).
% non-determinism arises if there is a different choice of Qns here.
% the accept predicate
