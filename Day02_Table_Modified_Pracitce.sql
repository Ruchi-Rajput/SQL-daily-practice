-- 11-02-2026  Day-01

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

alter table german_credit_risk add constraint pk_credit primary key (Cust_Num);

alter table german_credit_risk modify cust_num int not null,
	modify age int not null,
    modify gender varchar(10) not null,
    modify credit_amount int not null,
    modify duration int not null,
    modify risk varchar(10) not null;
    
alter table german_credit_risk add constraint chk_age check (Age between 18 and 100);


-- 12-02-2026   Day02 of sql practice 
alter table  german_credit_risk add constraint chk_credit check(credit_amount >0);
select * from german_credit_risk;
desc german_credit_risk;

alter table  german_credit_risk  add constraint chk_duration check (Duration > 0);
desc german_credit_risk;


alter table german_credit_risk add constraint chk_gender check(gender in('male',
'female'));

alter table german_credit_risk add constraint chk_risk check(risk in('good','bad'));

 
-- 13-02-2026 Modifing columns data-type  
alter table german_credit_risk modify housing varchar(20);
desc german_credit_risk;

alter table  german_credit_risk modify Saving_Accounts varchar(20);

alter table  german_credit_risk modify Checking_Accounts varchar(20);

alter table german_credit_risk modify Purpose varchar(10);
desc german_credit_risk;

select* from german_credit_risk;
# total customer
select count(*) from german_credit_risk;

# Total feamle
select count(*) from german_credit_risk where gender = "Female";

# Total male
select count(*) from german_credit_risk where gender = "male";


# Total Credit Amount
select sum(credit_amount) from german_credit_risk ;

# Total Credit Amount by male 
select sum(credit_amount) from german_credit_risk  where gender = "male";

# Total Credit Amount by female
select sum(credit_amount) from german_credit_risk where gender = "female" ;

select sum(credit_amount) from german_credit_risk where Purpose = "business" ;

select sum(credit_amount) from german_credit_risk where gender = "female" ;

select* from german_credit_risk;