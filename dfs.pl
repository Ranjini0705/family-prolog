% PROGRAM

% FACTS

connected(p,q).
connected(p,r).
connected(q,s).
connected(q,t).
connected(r,u).
connected(r,v).
connected(s,w).
connected(t,w).
connected(u,x).
connected(v,x).
connected(w,z).
connected(x,z).

% DFS

dfs(Start,Goal,Path) :-
    dfs_search(Start,Goal,[Start],ReversePath),
    reverse(ReversePath,Path).

dfs_search(Goal,Goal,Visited,Visited).

dfs_search(Current,Goal,Visited,Path) :-
    connected(Current,Next),
    \+ member(Next,Visited),
    dfs_search(Next,Goal,[Next|Visited],Path).