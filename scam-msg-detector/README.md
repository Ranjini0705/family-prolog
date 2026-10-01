AI Based Scam Message Detection System

A rule-based scam message detection system developed using SWI-Prolog. The system analyzes text messages, identifies predefined scam indicators, applies logical rules, and classifies messages as SAFE, SUSPICIOUS, or SCAM.

Note: This project is implemented as a rule-based expert system using Prolog. It does not use machine learning or numerical scoring.

📌 Project Overview

Scam messages are commonly used to trick users into sharing sensitive information, transferring money, clicking suspicious links, or responding to fraudulent offers.

This project provides a simple rule-based approach for detecting common scam patterns in messages.

The system follows these steps:

Accepts a message from the user.
Normalizes the message.
Detects predefined scam indicators.
Applies logical rules using Prolog.
Classifies the message as SAFE, SUSPICIOUS, or SCAM.
Displays the detected indicators and reasons.
Provides a safety recommendation.
System Flow
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
🎯 Objectives
Detect common scam patterns in text messages.
Identify suspicious keywords and phrases.
Use logical rules for scam classification.
Explain why a message was classified as suspicious or scam.
Provide basic safety recommendations.
Demonstrate the use of logic programming and expert systems using Prolog.
✨ Features
Rule-based scam detection
Prolog knowledge base
Keyword and phrase detection
Multiple scam categories
Three-level classification:
SAFE
SUSPICIOUS
SCAM
Reason generation
Safety recommendations
Automated test cases
Interactive command-line interface
🔍 Scam Indicators

The system currently detects indicators related to:

Sensitive Information
OTP requests
Password requests
PIN requests
CVV requests
Banking and Payment
Bank/account requests
Payment requests
Money transfer requests
Suspicious Links
HTTP/HTTPS links
Shortened links
"Click here" type requests
Urgency and Threats
Urgent language
Account blocking warnings
Legal-action threats
Penalty/fine threats
Prize and Lottery
Prize claims
Lottery claims
Reward claims
KYC and Account
Fake KYC requests
Account verification warnings
Account suspension/blocking messages
Investment
Investment offers
Guaranteed profit
Guaranteed returns
Double-money claims
Job Scams
Work-from-home offers
Online job offers
Job vacancies
Registration-fee requests
Sender Information
Unknown sender
New number
Unfamiliar sender
🧠 Rule-Based Classification

The system does not classify a message based only on a single keyword.

Instead, detected indicators are passed to the Prolog rule engine, where predefined logical rules are applied.

Example

Message:

Please transfer money immediately to confirm your account.

Detected indicators:

money_transfer
urgent_language

Rule:

scam_rule(Indicators) :-
    member(money_transfer, Indicators),
    member(urgent_language, Indicators).

Therefore:

Classification: SCAM

This demonstrates how Prolog combines multiple indicators using logical rules.

📊 Classification Levels
SAFE

The message does not match any major suspicious rule.

Example:

Are you coming home for dinner tonight?

Classification:

SAFE
SUSPICIOUS

The message contains one or more suspicious indicators but does not satisfy a strong scam rule.

Example:

Please click here to verify your details.

Classification:

SUSPICIOUS
SCAM

The message satisfies one or more strong scam rules.

Example:

Your bank account will be blocked. Share your OTP immediately.

Classification:

SCAM
🏗️ Project Structure
scam-msg-detector/
│
├── README.md
├── main.pl
├── detector.pl
├── facts.pl
├── rules.pl
└── test_cases.pl
File Description
File	Purpose
main.pl	Main program and command-line interface
detector.pl	Message normalization, indicator detection, classification and reason generation
facts.pl	Knowledge base containing scam indicators
rules.pl	Scam and suspicious classification rules
test_cases.pl	Automated test cases
README.md	Project documentation
🔄 System Architecture
             ┌──────────────────┐
             │   User Message   │
             └────────┬─────────┘
                      ↓
             ┌──────────────────┐
             │ Message          │
             │ Normalization    │
             └────────┬─────────┘
                      ↓
             ┌──────────────────┐
             │ Keyword / Phrase │
             │ Detection        │
             └────────┬─────────┘
                      ↓
             ┌──────────────────┐
             │ Scam Indicators  │
             └────────┬─────────┘
                      ↓
             ┌──────────────────┐
             │ Prolog Rule      │
             │ Engine           │
             └────────┬─────────┘
                      ↓
          ┌───────────┼───────────┐
          ↓           ↓           ↓
       SAFE      SUSPICIOUS      SCAM
          │           │           │
          └───────────┼───────────┘
                      ↓
             ┌──────────────────┐
             │ Reasons & Safety │
             │ Recommendation   │
             └──────────────────┘
🛠️ Technologies Used
Programming Language: Prolog
Prolog Environment: SWI-Prolog
IDE: Visual Studio Code
Version Control: Git
Repository: GitHub
⚙️ Requirements

Before running the project, install:

SWI-Prolog
Visual Studio Code
Prolog extension for Visual Studio Code
Git (optional, for version control)
▶️ How to Run
Step 1: Open the Project

Open the scam-msg-detector folder in Visual Studio Code.

Step 2: Start SWI-Prolog

Open the terminal and navigate to the project folder.

Run:

swipl

If SWI-Prolog is not configured in PATH, use:

& "C:\Program Files\swipl\bin\swipl.exe"
Step 3: Load the Main Program

Inside SWI-Prolog:

consult(main).
Step 4: Start the System
start.
Step 5: Enter a Message

Example:

Enter message: Please transfer money immediately to confirm your account.

The system displays the detected indicators, classification, reasons, and recommendation.

🧪 Automated Testing

The project contains 15 automated test cases covering different types of scam and normal messages.

Test categories include:

OTP scam
Bank scam
KYC scam
Prize scam
Investment scam
Job scam
Money-transfer scam
Lottery scam
Suspicious-link message
Threatening message
Unknown sender
Normal bank message
Normal college message
Normal shopping message
Normal personal message
Run Automated Tests

Inside SWI-Prolog:

consult(test_cases).
run_tests.

Expected result:

Test Case 1: PASS
Test Case 2: PASS
Test Case 3: PASS
...
Test Case 15: PASS
Testing Result
Total Test Cases : 15
Passed           : 15
Failed           : 0
💻 Sample Output
==============================================
     AI BASED SCAM MESSAGE DETECTION SYSTEM
==============================================

Enter message: Please transfer money immediately to confirm your account.

--------------- RESULT ----------------

Message: Please transfer money immediately to confirm your account.

Detected Indicators:
- money_transfer
- urgent_language

Classification: SCAM

Reasons:
- Requests money transfer.
- Uses urgent or pressure-based language.

Recommendation:
Do not share OTP, passwords or financial information.
Do not click suspicious links.
Verify through the official website or app.

----------------------------------------
📈 Testing Summary
Test Case	Category	Expected Result
1	OTP Scam	SCAM
2	Bank Scam	SCAM
3	KYC Scam	SCAM
4	Prize Scam	SCAM
5	Investment Scam	SCAM
6	Job Scam	SUSPICIOUS
7	Money Transfer Scam	SCAM
8	Lottery Scam	SCAM
9	Suspicious Link	SUSPICIOUS
10	Threatening Message	SCAM
11	Unknown Sender	SUSPICIOUS
12	Normal Bank Message	SAFE
13	Normal College Message	SAFE
14	Normal Shopping Message	SAFE
15	Normal Personal Message	SAFE

Total Test Cases: 15

Passed: 15

Failed: 0

⚠️ Limitations
Detection depends on predefined keywords and rules.
New scam patterns may not be detected until corresponding rules are added.
The system does not use machine learning.
It may not understand complex context or sarcasm.
It is designed as an academic rule-based prototype, not as a production-grade security system.
🚀 Future Enhancements

Possible future improvements include:

Adding more scam categories.
Expanding the knowledge base.
Supporting multiple languages.
Adding a graphical user interface.
Integrating real-time message analysis.
Adding URL reputation checking.
Adding more advanced natural-language processing.
Connecting the system with external scam databases.
Improving contextual analysis.
🎓 Academic Relevance

This project demonstrates concepts from:

Artificial Intelligence
Expert Systems
Knowledge Representation
Logic Programming
Rule-Based Reasoning
Natural Language Processing concepts
Software Testing

The project demonstrates how facts, rules, and logical inference can be used to build an expert system using Prolog.

📌 Project Information

Project Title:
AI Based Scam Message Detection System

Project Type:
Rule-Based Expert System

Domain:
Artificial Intelligence / Cybersecurity

Programming Language:
Prolog

Development Environment:
SWI-Prolog + Visual Studio Code

Testing:
15 Automated Test Cases

📜 License

This project is developed for academic and educational purposes.