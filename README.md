# Bank-Analysis

## Overview
This document provides a comprehensive analysis of financial loan data, covering key metrics such as total loan applications, funded amounts, received payments, loan status, trends, and regional analysis. The data is structured and analyzed using SQL queries to generate insights that help financial institutions manage their loan portfolios effectively.

## SQL Queries Used in Analysis

### 1. Fetching All Loan Data
```sql
SELECT * FROM financial_loan;
```

### 2. Total Loan Applications
```sql
SELECT COUNT(id) AS applications FROM financial_loan;
```

### 3. Total Funded Amount (for December 2021)
```sql
SELECT SUM(loan_amount) AS funded
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
```

### 4. Total Amount Received (for December 2021)
```sql
SELECT SUM(total_payment) AS received
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
```

### 5. Average Interest Rate
```sql
SELECT ROUND(AVG(int_rate) * 100, 2) AS interest
FROM financial_loan;
```

### 6. Average Debt-To-Income (DTI) Ratio (for December 2021)
```sql
SELECT ROUND(AVG(dti) * 100, 2) AS DTI
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
```

### 7. Good Loan Amount (Loans That Are Fully Paid or Current)
```sql
SELECT COUNT(id) AS good_loan
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
```

### 8. Bad Loan Percentage
```sql
SELECT COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / COUNT(id) AS bad_loan_percent
FROM financial_loan;
```

### 9. Loan Status Analysis
```sql
SELECT loan_status, COUNT(id) AS loan_count, SUM(total_payment) AS Received,
       SUM(loan_amount) AS funded, AVG(int_rate) * 100 AS Interest_rate,
       AVG(dti) * 100 AS DTI
FROM financial_loan
GROUP BY loan_status;
```

### 10. Monthly Trend by Issue Date
```sql
SELECT MONTH(issue_date) AS month_num, DATENAME(month, issue_date) AS months,
       COUNT(id) AS application, SUM(loan_amount) AS funded,
       SUM(total_payment) AS received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(month, issue_date)
ORDER BY MONTH(issue_date);
```

### 11. Regional Analysis by State
```sql
SELECT address_state, COUNT(id) AS application, SUM(loan_amount) AS funded,
       SUM(total_payment) AS received
FROM financial_loan
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC;
```

### 12. Loan Term Analysis
```sql
SELECT term, COUNT(id) AS application, SUM(loan_amount) AS funded,
       SUM(total_payment) AS received
FROM financial_loan
GROUP BY term
ORDER BY term;
```

### 13. Employee Length Analysis
```sql
SELECT emp_length, COUNT(id) AS application, SUM(loan_amount) AS funded,
       SUM(total_payment) AS received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;
```

### 14. Loan Purpose Breakdown
```sql
SELECT purpose, COUNT(id) AS application, SUM(loan_amount) AS funded,
       SUM(total_payment) AS received
FROM financial_loan
GROUP BY purpose
ORDER BY COUNT(id) DESC;
```

### 15. Home Ownership Analysis
```sql
SELECT home_ownership, COUNT(id) AS application, SUM(loan_amount) AS funded,
       SUM(total_payment) AS received
FROM financial_loan
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;
```

---

## Terminologies Used in Data

### Loan ID
- **Purpose**: Unique identifier for each loan.
- **Use for Banks**: Helps track and manage individual loans.

### Address State
- **Purpose**: Indicates the borrower's location.
- **Use for Banks**: Assists in risk assessment and compliance.

### Employee Length
- **Purpose**: Represents job stability of the borrower.
- **Use for Banks**: Assists in credit risk evaluation.

### Employee Title
- **Purpose**: Indicates the borrower's occupation.
- **Use for Banks**: Used for income verification and loan customization.

### Grade
- **Purpose**: Represents loan risk classification.
- **Use for Banks**: Helps in pricing loans and managing risk.

### Sub Grade
- **Purpose**: Provides a refined risk classification.
- **Use for Banks**: Helps adjust interest rates based on borrower risk.

### Home Ownership
- **Purpose**: Identifies the borrower's housing status.
- **Use for Banks**: Assesses collateral availability and stability.

### Issue Date
- **Purpose**: Marks the loan's origination date.
- **Use for Banks**: Used for loan tracking and interest calculations.

### Last Credit Pull Date
- **Purpose**: Shows the last credit report update.
- **Use for Banks**: Helps assess borrower’s updated credit risk.

### Last Payment Date
- **Purpose**: Tracks the borrower's last loan payment.
- **Use for Banks**: Helps analyze payment history.

### Loan Status
- **Purpose**: Indicates the loan's current state (e.g., Fully Paid, Current, Default).
- **Use for Banks**: Helps in loan portfolio management and risk assessment.

### Next Payment Date
- **Purpose**: Estimated date of the borrower's next payment.
- **Use for Banks**: Assists in cash flow forecasting.

### Purpose
- **Purpose**: Describes the reason for the loan.
- **Use for Banks**: Helps tailor loan offerings based on borrower needs.

### Term
- **Purpose**: Defines the loan duration.
- **Use for Banks**: Helps structure repayment plans.

### Verification Status
- **Purpose**: Indicates if the borrower’s financial details were verified.
- **Use for Banks**: Assesses the accuracy of borrower information.

### Annual Income
- **Purpose**: Reflects borrower earnings.
- **Use for Banks**: Determines loan eligibility and creditworthiness.

### Debt-to-Income Ratio (DTI)
- **Purpose**: Measures borrower debt relative to income.
- **Use for Banks**: Helps assess the borrower's repayment capacity.

### Instalment
- **Purpose**: Monthly repayment amount.
- **Use for Banks**: Used to structure loan agreements.

### Interest Rate
- **Purpose**: Annual cost of borrowing.
- **Use for Banks**: Helps manage profit margins and loan pricing.

### Loan Amount
- **Purpose**: Total sum borrowed.
- **Use for Banks**: Determines loan size and risk management.

---

## Conclusion
This README serves as a reference for analyzing loan data, providing structured SQL queries and definitions of key financial terminologies. These insights help banks and financial institutions in risk management, customer segmentation, and strategic decision-making.

