% FACTS

connected(p,q,2).
connected(p,r,4).
connected(q,s,3).
connected(q,t,1).
connected(r,u,2).
connected(r,v,5).
connected(s,w,2).
connected(t,w,4).
connected(u,x,3).
connected(v,x,1).
connected(w,z,2).
connected(x,z,4).

% BFS

bfs(Start,Goal,Path) :-
    search([[Start]],Goal,RevPath),
    reverse(RevPath,Path).

search([[Goal|Rest]|_],Goal,[Goal|Rest]).

search([Current|Queue],Goal,Result) :-
    extend(Current,Next),
    append(Queue,Next,NewQueue),
    search(NewQueue,Goal,Result).

extend([Node|Path],NewPaths) :-
    findall(
        [NextNode,Node|Path],
        (
            connected(Node,NextNode,_),
            \+ member(NextNode,[Node|Path])
        ),
        NewPaths
    ).