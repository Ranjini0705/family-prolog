# AI Based Scam Message Detection System

A **rule-based scam message detection system** developed using **SWI-Prolog**. The system analyzes text messages, identifies predefined scam indicators, applies logical rules, and classifies messages as **SAFE, SUSPICIOUS, or SCAM**.

> **Note:** This project is implemented as a **rule-based expert system using Prolog**. It does not use machine learning or numerical scoring.

---

## 📌 Project Overview

Scam messages are commonly used to trick users into sharing sensitive information, transferring money, clicking suspicious links, or responding to fraudulent offers.

This project provides a simple rule-based approach for detecting common scam patterns in messages.

The system follows these steps:

1. Accepts a message from the user.
2. Normalizes the message.
3. Detects predefined scam indicators.
4. Applies logical rules using Prolog.
5. Classifies the message as SAFE, SUSPICIOUS, or SCAM.
6. Displays the detected indicators and reasons.
7. Provides a safety recommendation.

### System Flow

```text
User Message
     ↓
Normalize Message
     ↓
Detect Scam Indicators
     ↓
Extract Indicators
     ↓
Apply Prolog Rule Engine
     ↓
┌──────────┬─────────────┬────────┐
│   SAFE   │ SUSPICIOUS  │  SCAM  │
└──────────┴─────────────┴────────┘
     ↓
Generate Reasons
     ↓
Safety Recommendation
     ↓
Display Result
```

---

## 🎯 Objectives

* Detect common scam patterns in text messages.
* Identify suspicious keywords and phrases.
* Use logical rules for scam classification.
* Explain why a message was classified as suspicious or scam.
* Provide basic safety recommendations.
* Demonstrate the use of **logic programming and expert systems using Prolog**.

---

## ✨ Features

* Rule-based scam detection
* Prolog knowledge base
* Keyword and phrase detection
* Multiple scam categories
* Three-level classification:

  * **SAFE**
  * **SUSPICIOUS**
  * **SCAM**
* Reason generation
* Safety recommendations
* Automated test cases
* Interactive command-line interface

---

## 🔍 Scam Indicators

The system currently detects indicators related to:

### Sensitive Information

* OTP requests
* Password requests
* PIN requests
* CVV requests

### Banking and Payment

* Bank/account requests
* Payment requests
* Money transfer requests

### Suspicious Links

* HTTP/HTTPS links
* Shortened links
* "Click here" type requests

### Urgency and Threats

* Urgent language
* Account blocking warnings
* Legal-action threats
* Penalty/fine threats

### Prize and Lottery

* Prize claims
* Lottery claims
* Reward claims

### KYC and Account

* Fake KYC requests
* Account verification warnings
* Account suspension/blocking messages

### Investment

* Investment offers
* Guaranteed profit
* Guaranteed returns
* Double-money claims

### Job Scams

* Work-from-home offers
* Online job offers
* Job vacancies
* Registration-fee requests

### Sender Information

* Unknown sender
* New number
* Unfamiliar sender

---

## 🧠 Rule-Based Classification

The system does not classify a message based only on a single keyword.

Instead, detected indicators are passed to the **Prolog rule engine**, where predefined logical rules are applied.

### Example

Message:

```text
Please transfer money immediately to confirm your account.
```

Detected indicators:

```text
money_transfer
urgent_language
```

Rule:

```prolog
scam_rule(Indicators) :-
    member(money_transfer, Indicators),
    member(urgent_language, Indicators).
```

Therefore:

```text
Classification: SCAM
```

This demonstrates how Prolog combines multiple indicators using logical rules.

---

## 📊 Classification Levels

### SAFE

The message does not match any major suspicious rule.

Example:

```text
Are you coming home for dinner tonight?
```

Classification:

```text
SAFE
```

### SUSPICIOUS

The message contains one or more suspicious indicators but does not satisfy a strong scam rule.

Example:

```text
Please click here to verify your details.
```

Classification:

```text
SUSPICIOUS
```

### SCAM

The message satisfies one or more strong scam rules.

Example:

```text
Your bank account will be blocked. Share your OTP i
```
