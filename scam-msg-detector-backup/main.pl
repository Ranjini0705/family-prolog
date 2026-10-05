% AI Based Scam Message Detection System

scam(I) :-
    member(otp,I),
    member(link,I).

scam(I) :-
    member(money,I),
    member(urgent,I).

scam(I) :-
    member(bank,I),
    member(otp,I).

detect(M,otp) :-
    sub_string(M,_,_,_,"otp").

detect(M,link) :-
    sub_string(M,_,_,_,"http").

detect(M,money) :-
    sub_string(M,_,_,_,"transfer").

detect(M,urgent) :-
    sub_string(M,_,_,_,"immediately").

detect(M,bank) :-
    sub_string(M,_,_,_,"bank").

get_indicators(M,I) :-
    findall(X,detect(M,X),L),
    sort(L,I).

classify(I,scam) :-
    scam(I), !.

classify(I,suspicious) :-
    I \= [], !.

classify(_,safe).

start :-
    writeln('=============================='),
    writeln(' SCAM MESSAGE DETECTION SYSTEM'),
    writeln('=============================='),
    loop.

loop :-
    write('Enter message: '),
    read_line_to_string(user_input,M),
    ( M = "exit" ->
        writeln('Thank you!')
    ;
        string_lower(M,L),
        get_indicators(L,I),
        classify(I,C),
        nl,
        write('Indicators: '),
        writeln(I),
        write('Classification: '),
        writeln(C),
        nl,
        loop
    ).