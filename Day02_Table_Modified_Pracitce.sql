use joins23;

SELECT * FROM joins23.german_credit_risk;

alter table german_credit_risk rename column `Credit amount` to Credit_amount;
desc german_credit_risk;

alter table german_credit_risk rename column MyUnknownColumn to Cust_Num;
ALTER TABLE german_credit_risk rename column sex to Gender;

alter table german_credit_risk rename column `Saving accounts` to Saving_Accounts;
alter table german_credit_risk rename column `Checking account` to Checking_Accounts;
select * from german_credit_risk;
desc german_credit_risk;