% PROGRAM

in_room(monkey).
in_room(chair).
in_room(banana).

at(monkey,corner).
at(chair,window).
at(banana,center).

push(monkey,chair).
climb(monkey,chair).
grasp(monkey,banana).

can_get_banana :-
    in_room(monkey),
    in_room(chair),
    in_room(banana),
    push(monkey,chair),
    climb(monkey,chair),
    grasp(monkey,banana).