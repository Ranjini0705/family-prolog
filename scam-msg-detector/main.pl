% =========================================
% AI Based Scam Message Detection System
% Main Program
% =========================================

:- consult(facts).
:- consult(rules).
:- consult(detector).


% =========================================
% START PROGRAM
% =========================================

start :-
    nl,
    writeln('=============================================='),
    writeln('     AI BASED SCAM MESSAGE DETECTION SYSTEM'),
    writeln('=============================================='),
    writeln('Enter a message to analyze.'),
    writeln('Type "exit" to close the program.'),
    nl,
    input_loop.


% =========================================
% INPUT LOOP
% =========================================

input_loop :-
    write('Enter message: '),
    read_line_to_string(user_input, Message),
    process_input(Message).


% =========================================
% EXIT
% =========================================

process_input("exit") :-
    nl,
    writeln('Thank you for using the Scam Message Detection System.'),
    !.


% =========================================
% PROCESS MESSAGE
% =========================================

process_input(Message) :-
    analyze_message(Message, Indicators, Classification),
    display_result(Message, Indicators, Classification),
    nl,
    input_loop.


% =========================================
% DISPLAY RESULT
% =========================================

display_result(Message, Indicators, Classification) :-
    nl,
    writeln('--------------- RESULT ----------------'),

    write('Message: '),
    writeln(Message),

    nl,
    write('Detected Indicators: '),
    display_indicators(Indicators),

    nl,
    write('Classification: '),
    display_classification(Classification),

    nl,
    write('Reasons:'),
    nl,
    display_reasons(Indicators),

    nl,
    write('Recommendation: '),
    display_recommendation(Classification),

    writeln('----------------------------------------').


% =========================================
% DISPLAY INDICATORS
% =========================================

display_indicators([]) :-
    writeln('None').

display_indicators(Indicators) :-
    Indicators \= [],
    display_indicator_list(Indicators).


display_indicator_list([]).

display_indicator_list([Indicator|Rest]) :-
    write('- '),
    writeln(Indicator),
    display_indicator_list(Rest).


% =========================================
% DISPLAY CLASSIFICATION
% =========================================

display_classification(safe) :-
    writeln('SAFE').

display_classification(suspicious) :-
    writeln('SUSPICIOUS').

display_classification(scam) :-
    writeln('SCAM').


% =========================================
% RECOMMENDATION
% =========================================

display_recommendation(safe) :-
    writeln(
        'This message does not contain major scam indicators. Still remain cautious.'
    ).

display_recommendation(suspicious) :-
    writeln(
        'Be careful. Do not share personal or financial information. Verify the sender.'
    ).

display_recommendation(scam) :-
    writeln(
        'Do not share OTP, passwords or financial information. Do not click suspicious links. Verify through the official website or app.'
    ).