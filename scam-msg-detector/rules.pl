% =========================================
% AI Based Scam Message Detection System
% Rule Engine
% =========================================


% =========================================
% 1. STRONG SCAM RULES
% =========================================

% OTP + suspicious link
scam_rule(Indicators) :-
    member(otp_request, Indicators),
    member(suspicious_link, Indicators).


% Password + suspicious link
scam_rule(Indicators) :-
    member(password_request, Indicators),
    member(suspicious_link, Indicators).


% PIN + suspicious link
scam_rule(Indicators) :-
    member(pin_request, Indicators),
    member(suspicious_link, Indicators).


% CVV + suspicious link
scam_rule(Indicators) :-
    member(cvv_request, Indicators),
    member(suspicious_link, Indicators).


% Bank request + OTP
scam_rule(Indicators) :-
    member(bank_request, Indicators),
    member(otp_request, Indicators).


% Money transfer + urgent language
scam_rule(Indicators) :-
    member(money_transfer, Indicators),
    member(urgent_language, Indicators).


% Fake KYC + suspicious link
scam_rule(Indicators) :-
    member(fake_kyc, Indicators),
    member(suspicious_link, Indicators).


% Prize claim + suspicious link
scam_rule(Indicators) :-
    member(prize_claim, Indicators),
    member(suspicious_link, Indicators).


% Lottery + suspicious link
scam_rule(Indicators) :-
    member(lottery_claim, Indicators),
    member(suspicious_link, Indicators).


% Investment + guaranteed profit
scam_rule(Indicators) :-
    member(investment_offer, Indicators),
    member(guaranteed_profit, Indicators).


% Job offer + money transfer
scam_rule(Indicators) :-
    member(job_offer, Indicators),
    member(money_transfer, Indicators).


% Threat + urgent language + account warning
scam_rule(Indicators) :-
    member(threatening_language, Indicators),
    member(urgent_language, Indicators),
    member(account_warning, Indicators).


% =========================================
% 2. SUSPICIOUS RULES
% =========================================

% Suspicious link
suspicious_rule(Indicators) :-
    member(suspicious_link, Indicators).


% Prize claim
suspicious_rule(Indicators) :-
    member(prize_claim, Indicators).


% Lottery claim
suspicious_rule(Indicators) :-
    member(lottery_claim, Indicators).


% Investment offer
suspicious_rule(Indicators) :-
    member(investment_offer, Indicators).


% Job offer
suspicious_rule(Indicators) :-
    member(job_offer, Indicators).


% Work from home offer
suspicious_rule(Indicators) :-
    member(work_from_home_scam, Indicators).


% Fake KYC
suspicious_rule(Indicators) :-
    member(fake_kyc, Indicators).


% Unknown sender
suspicious_rule(Indicators) :-
    member(unknown_sender, Indicators).


% Account warning
suspicious_rule(Indicators) :-
    member(account_warning, Indicators).


% Threatening language
suspicious_rule(Indicators) :-
    member(threatening_language, Indicators).


% =========================================
% END OF RULES
% =========================================