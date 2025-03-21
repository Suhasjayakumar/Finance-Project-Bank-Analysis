select * from financial_loan;

--TOTAL LOAN APPLICATIONS
select COUNT(id)as applications from financial_loan;

--TOTAL FUNDED AMOUNT
select sum(loan_amount)as funded from financial_loan
where MONTH(issue_date)=12 and year(issue_date)=2021;
--TOTAL AMOUNT RECEIVED
select sum(total_payment)as received from financial_loan
where MONTH(issue_date)=12 and year(issue_date)=2021;

--AVERAGE INTEREST RATE
select round(avg(int_rate)*100,2) as interest from financial_loan;

--AVG DTI(Debt-To-Income)RATIO
select round(avg(dti)*100,2)as DTI from financial_loan
where MONTH(issue_date)=12 and year(issue_date)=2021;

--GOOD LOAN AMOUNT
select COUNT(id)as good_loan from financial_loan
where loan_status='Fully Paid' or loan_status='Current';

--BAD LOAN PERCENTAGE
select COUNT(case when loan_status='Charged Off' then id end)*100.0/COUNT(id) as bad_loan_percent from financial_loan;

--LOAN STATUS
select loan_status,count(id)as loan_count,sum(total_payment)as Received,sum(loan_amount)as funded,avg(int_rate)*100 as Interest_rate,avg(dti)*100 as DTI from financial_loan
group by loan_status;

--MONTHLY TREND BY ISSUE
select MONTH(issue_date)as month_num,DATENAME(month,issue_date)as months,COUNT(id)as application,sum(loan_amount)as funded,sum(total_payment)as received from financial_loan
group by MONTH(issue_date),DATENAME(month,issue_date)
order by MONTH(issue_date);

--REGIONAL ANALYSIS BY STATE
select address_state,COUNT(id)as application,sum(loan_amount)as funded,sum(total_payment)as received from financial_loan
group by address_state
order by sum(loan_amount)desc;

--LOAN TERM
select term,COUNT(id)as application,sum(loan_amount)as funded,sum(total_payment)as received from financial_loan
group by term
order by term;

--EMPLOYEE LENGTH ANALYSIS
select emp_length,COUNT(id)as application,sum(loan_amount)as funded,sum(total_payment)as received from financial_loan
group by emp_length
order by emp_length;

--LOAN PURPOSE BREAKDOWN
select purpose,COUNT(id)as application,sum(loan_amount)as funded,sum(total_payment)as received from financial_loan
group by purpose
order by COUNT(id)desc;

--HOME OWNERSHIP
select home_ownership,COUNT(id)as application,sum(loan_amount)as funded,sum(total_payment)as received from financial_loan
group by home_ownership
order by count(id)desc;
--