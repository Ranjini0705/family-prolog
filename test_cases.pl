% =========================================
% AI Based Scam Message Detection System
% Test Cases
% =========================================


% Test Case 1 - OTP Scam
test_case(1,
    'Your bank account will be blocked. Share your OTP immediately.',
    scam).


% Test Case 2 - Bank Scam
test_case(2,
    'Your bank account requires verification. Share your OTP and click here immediately.',
    scam).


% Test Case 3 - KYC Scam
test_case(3,
    'Your KYC has expired. Update your KYC immediately by clicking this link.',
    scam).


% Test Case 4 - Prize Scam
test_case(4,
    'Congratulations! You won a cash prize. Click here to claim your prize.',
    scam).


% Test Case 5 - Investment Scam
test_case(5,
    'Invest now and double your money with guaranteed profit.',
    scam).


% Test Case 6 - Job Scam
test_case(6,
    'Work from home and earn money. Pay a registration fee to get the job.',
    suspicious).


% Test Case 7 - Money Transfer Scam
test_case(7,
    'Please transfer money immediately to confirm your account.',
    scam).


% Test Case 8 - Lottery Scam
test_case(8,
    'Congratulations! You are the winner of a lottery prize. Click here to claim your reward.',
    scam).


% Test Case 9 - Suspicious Link
test_case(9,
    'Your account needs verification. Please click here to verify your details.',
    suspicious).


% Test Case 10 - Threatening Message
test_case(10,
    'Your account will be blocked today. Take action immediately or legal action will be taken.',
    scam).


% Test Case 11 - Unknown Sender
test_case(11,
    'Hello, I am contacting you from a new number. Please send me your account details.',
    suspicious).


% Test Case 12 - Normal Bank Message
test_case(12,
    'Your bank statement for this month is now available. Please check your official banking app.',
    safe).


% Test Case 13 - Normal College Message
test_case(13,
    'Good morning. I will attend the college meeting at 10 AM.',
    safe).


% Test Case 14 - Normal Shopping Message
test_case(14,
    'Your order has been shipped and will be delivered tomorrow.',
    safe).


% Test Case 15 - Normal Personal Message
test_case(15,
    'Are you coming home for dinner tonight?',
    safe).


% =========================================
% END OF TEST CASES
% =========================================
% =========================================
% RUN ALL TEST CASES
% =========================================

run_tests :-
    forall(
        test_case(Number, Message, Expected),
        run_single_test(Number, Message, Expected)
    ).


% =========================================
% RUN ONE TEST CASE
% =========================================

run_single_test(Number, Message, Expected) :-
    analyze_message(Message, Indicators, Actual),

    write('Test Case '),
    write(Number),
    write(': '),

    ( Actual = Expected ->
        writeln('PASS')
    ;
        writeln('FAIL')
    ),

    write('  Expected: '),
    writeln(Expected),

    write('  Actual:   '),
    writeln(Actual),

    write('  Indicators: '),
    writeln(Indicators),

    nl.