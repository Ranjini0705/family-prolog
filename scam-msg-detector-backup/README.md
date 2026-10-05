# AI Based Scam Message Detection System

## Project Overview

The AI Based Scam Message Detection System is a simple rule-based expert system developed using SWI-Prolog.

The system analyzes a user-provided message, detects predefined scam indicators, and classifies the message as:

- SCAM
- SUSPICIOUS
- SAFE

This project does not use Machine Learning or a training dataset. It uses predefined keywords and logical rules.

## Technologies Used

- SWI-Prolog
- Visual Studio Code
- Prolog

## How It Works

User Message
      ↓
Keyword Detection
      ↓
Indicator Identification
      ↓
Rule-Based Classification
      ↓
SCAM / SUSPICIOUS / SAFE

## Scam Indicators

The current system detects:

- OTP requests
- Suspicious links
- Money transfer requests
- Urgent language
- Bank-related messages

## Classification Rules

### SCAM

A message is classified as SCAM when strong combinations of indicators are detected.

Examples:

- OTP + suspicious link
- Money transfer + urgent language
- Bank + OTP

### SUSPICIOUS

A message is classified as SUSPICIOUS when a suspicious indicator is detected but a strong scam rule is not matched.

### SAFE

A message is classified as SAFE when no predefined scam indicators are detected.

## Main File

`main.pl` contains the complete simplified Prolog implementation, including:

- Indicator detection
- Rule-based classification
- User input
- Result display

## Example

Input:

Please transfer money immediately

Output:

Indicators: [money,urgent]

Classification: scam

## Project Structure

scam-msg-detector-backup/
│
├── main.pl
├── README.md
└── old-files/
    ├── facts_old.pl
    ├── detector.pl
    ├── rules.pl
    └── test_cases.pl

The files inside `old-files` are previous versions kept as backup.

## Conclusion

This project demonstrates how Prolog can be used to build a simple rule-based expert system for detecting suspicious and scam messages.