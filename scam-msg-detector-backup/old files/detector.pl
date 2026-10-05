% =========================================
% AI Based Scam Message Detection System
% Message Detector
% =========================================


% =========================================
% 1. NORMALIZE MESSAGE
% =========================================

normalize_message(Message, LowerMessage) :-
    string_lower(Message, LowerMessage).


% =========================================
% 2. CHECK KEYWORDS
% =========================================

contains_any(Message, Keywords) :-
    member(Keyword, Keywords),
    sub_string(Message, _, _, _, Keyword),
    !.


% =========================================
% 3. SCAM INDICATOR DETECTION
% =========================================

% -----------------------------------------
% OTP request
% -----------------------------------------

detect_indicator(Message, otp_request) :-
    contains_any(Message,
        ["otp",
         "one time password",
         "verification code"]).


% -----------------------------------------
% Password request
% -----------------------------------------

detect_indicator(Message, password_request) :-
    contains_any(Message,
        ["password",
         "login password",
         "account password"]).


% -----------------------------------------
% PIN request
% -----------------------------------------

detect_indicator(Message, pin_request) :-
    contains_any(Message,
        ["pin",
         "upi pin",
         "atm pin"]).


% -----------------------------------------
% CVV request
% -----------------------------------------

detect_indicator(Message, cvv_request) :-
    contains_any(Message,
        ["cvv",
         "card cvv"]).


% -----------------------------------------
% Bank request
% -----------------------------------------

detect_indicator(Message, bank_request) :-
    contains_any(Message,
        ["bank",
         "bank account",
         "account number"]).


% -----------------------------------------
% Payment request
% -----------------------------------------

detect_indicator(Message, payment_request) :-
    contains_any(Message,
        ["payment",
         "pay now",
         "make payment",
         "upi payment"]).


% -----------------------------------------
% Money transfer
% -----------------------------------------

detect_indicator(Message, money_transfer) :-
    contains_any(Message,
        ["send money",
         "transfer money",
         "transfer",
         "send rs",
         "send money immediately"]).


% -----------------------------------------
% Suspicious link
% -----------------------------------------

detect_indicator(Message, suspicious_link) :-
    contains_any(Message,
        ["http://",
         "https://",
         "bit.ly",
         "tinyurl",
         "click here",
         "click this link",
         "clicking this link"]).


% -----------------------------------------
% Urgent language
% -----------------------------------------

detect_indicator(Message, urgent_language) :-
    contains_any(Message,
        ["urgent",
         "immediately",
         "act now",
         "right now",
         "within 10 minutes",
         "today only",
         "do it now"]).


% -----------------------------------------
% Threatening language
% -----------------------------------------

detect_indicator(Message, threatening_language) :-
    contains_any(Message,
        ["account will be blocked",
         "account will be suspended",
         "legal action",
         "police complaint",
         "penalty",
         "fine"]).


% -----------------------------------------
% Prize claim
% -----------------------------------------

detect_indicator(Message, prize_claim) :-
    contains_any(Message,
        ["you won",
         "you have won",
         "congratulations",
         "prize",
         "reward",
         "lucky winner",
         "cash prize"]).


% -----------------------------------------
% Lottery claim
% -----------------------------------------

detect_indicator(Message, lottery_claim) :-
    contains_any(Message,
        ["lottery",
         "lottery winner",
         "lottery prize"]).


% -----------------------------------------
% Fake KYC
% -----------------------------------------

detect_indicator(Message, fake_kyc) :-
    contains_any(Message,
        ["kyc expired",
         "kyc has expired",
         "update kyc",
         "kyc update",
         "kyc verification",
         "complete your kyc"]).


% -----------------------------------------
% Account warning
% -----------------------------------------

detect_indicator(Message, account_warning) :-
    contains_any(Message,
        ["account will be blocked",
         "account will be closed",
         "account suspended",
         "account blocked",
         "verify your account"]).


% -----------------------------------------
% Investment offer
% -----------------------------------------

detect_indicator(Message, investment_offer) :-
    contains_any(Message,
        ["investment",
         "invest now",
         "double your money",
         "guaranteed return",
         "high return",
         "quick profit"]).


% -----------------------------------------
% Guaranteed profit
% -----------------------------------------

detect_indicator(Message, guaranteed_profit) :-
    contains_any(Message,
        ["guaranteed profit",
         "guaranteed return",
         "100% profit",
         "double your money",
         "sure profit"]).


% -----------------------------------------
% Job offer
% -----------------------------------------

detect_indicator(Message, job_offer) :-
    contains_any(Message,
        ["work from home",
         "job offer",
         "job vacancy",
         "earn money",
         "part time job",
         "easy job",
         "registration fee"]).


% -----------------------------------------
% Work from home scam
% -----------------------------------------

detect_indicator(Message, work_from_home_scam) :-
    contains_any(Message,
        ["work from home",
         "earn from home",
         "home based job",
         "online job"]).


% -----------------------------------------
% Unknown sender
% -----------------------------------------

detect_indicator(Message, unknown_sender) :-
    contains_any(Message,
        ["unknown sender",
         "unknown number",
         "new number",
         "random number"]).


% =========================================
% 4. GET ALL DETECTED INDICATORS
% =========================================

get_indicators(Message, Indicators) :-
    normalize_message(Message, LowerMessage),
    findall(
        Indicator,
        detect_indicator(LowerMessage, Indicator),
        DetectedIndicators
    ),
    unique_indicators(
        DetectedIndicators,
        Indicators
    ).


% =========================================
% 5. REMOVE DUPLICATE INDICATORS
% =========================================

unique_indicators([], []).

unique_indicators([H|T], Unique) :-
    member(H, T),
    !,
    unique_indicators(T, Unique).

unique_indicators([H|T], [H|Unique]) :-
    unique_indicators(T, Unique).


% =========================================
% 6. CLASSIFICATION
% =========================================

% Strong scam rule from rules.pl
classify_indicators(Indicators, scam) :-
    scam_rule(Indicators),
    !.

% Suspicious rule from rules.pl
classify_indicators(Indicators, suspicious) :-
    suspicious_rule(Indicators),
    !.

% No suspicious/scam rule
classify_indicators(_, safe).


% =========================================
% 7. ANALYZE MESSAGE
% =========================================

analyze_message(Message, Indicators, Classification) :-
    get_indicators(Message, Indicators),
    classify_indicators(Indicators, Classification).


% =========================================
% 8. REASON FOR EACH INDICATOR
% =========================================

indicator_reason(
    otp_request,
    'Requests an OTP or verification code.'
).

indicator_reason(
    password_request,
    'Requests a password or login credential.'
).

indicator_reason(
    pin_request,
    'Requests a PIN such as UPI PIN or ATM PIN.'
).

indicator_reason(
    cvv_request,
    'Requests card CVV information.'
).

indicator_reason(
    bank_request,
    'Contains a bank or account related request.'
).

indicator_reason(
    payment_request,
    'Requests a payment.'
).

indicator_reason(
    money_transfer,
    'Requests money transfer.'
).

indicator_reason(
    suspicious_link,
    'Contains a suspicious link or asks the user to click a link.'
).

indicator_reason(
    urgent_language,
    'Uses urgent or pressure-based language.'
).

indicator_reason(
    threatening_language,
    'Uses threatening or fear-based language.'
).

indicator_reason(
    prize_claim,
    'Claims that the user has won a prize or reward.'
).

indicator_reason(
    lottery_claim,
    'Contains a lottery-related claim.'
).

indicator_reason(
    fake_kyc,
    'Contains a suspicious KYC update or verification request.'
).

indicator_reason(
    account_warning,
    'Uses an account warning to pressure the user.'
).

indicator_reason(
    investment_offer,
    'Contains a suspicious investment or return offer.'
).

indicator_reason(
    guaranteed_profit,
    'Promises guaranteed profit or guaranteed returns.'
).

indicator_reason(
    job_offer,
    'Contains a potentially suspicious job or earning offer.'
).

indicator_reason(
    work_from_home_scam,
    'Contains a work-from-home or online earning offer.'
).

indicator_reason(
    unknown_sender,
    'Indicates that the sender may be unknown or unfamiliar.'
).


% =========================================
% 9. DISPLAY REASONS
% =========================================

display_reasons([]).

display_reasons([Indicator|Rest]) :-
    indicator_reason(Indicator, Reason),
    write('- '),
    writeln(Reason),
    display_reasons(Rest).