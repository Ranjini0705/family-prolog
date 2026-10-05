% =========================================
% Scam Message Detection System
% Knowledge Base - Scam Indicators
% =========================================

% Sensitive information requests
indicator(otp_request).
indicator(password_request).
indicator(pin_request).
indicator(cvv_request).

% Banking and payment indicators
indicator(bank_request).
indicator(payment_request).
indicator(money_transfer).

% Suspicious link
indicator(suspicious_link).

% Urgency and threatening language
indicator(urgent_language).
indicator(threatening_language).

% Prize and lottery scams
indicator(prize_claim).
indicator(lottery_claim).

% KYC and account warnings
indicator(fake_kyc).
indicator(account_warning).

% Investment scams
indicator(investment_offer).
indicator(guaranteed_profit).

% Fake job scams
indicator(job_offer).
indicator(work_from_home_scam).

% Unknown sender
indicator(unknown_sender).